package eu.crg.qsample.file.tic;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.zip.GZIPInputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.file.File;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.file.RequestFile;

@Service
public class TicService {

    public static final String GZIP_PREFIX = "gz1:";

    private static final int DEFAULT_MAX_POINTS = 1000;

    @Autowired
    private FileRepository fileRepository;

    @Autowired
    private TicRepository ticRepository;

    /**
     * Upserts the full TIC series of a file, addressed by checksum (the
     * pipeline registers the file row before uploading the series).
     *
     * The payload is the Atlas upload format:
     * "gz1:" + base64(gzip(compact JSON array of [rt_ms, msLevel, tic] points)).
     * The DECODED JSON text is what gets stored, so the column stays
     * inspectable and reads never need per-row gunzip.
     */
    @Transactional
    public void storeTicByChecksum(String checksum, String payload) {
        File file = fileRepository.findByChecksum(checksum)
                .orElseThrow(() -> new NotFoundException("TIC: No file with checksum " + checksum));

        String series = decodeSeries(payload);

        Optional<Tic> existing = ticRepository.findByFileId(file.getId());
        if (existing.isPresent()) {
            existing.get().setTic(series);
            ticRepository.save(existing.get());
        } else {
            ticRepository.save(new Tic(file, series));
        }
    }

    /**
     * @return the stored (decoded) TIC series text, or null when the file or
     *         its series does not exist.
     */
    @Transactional(readOnly = true)
    public String findTicByChecksum(String checksum) {
        File file = fileRepository.findByChecksum(checksum).orElse(null);
        if (file == null) {
            return null;
        }
        return ticRepository.findByFileId(file.getId()).map(Tic::getTic).orElse(null);
    }

    /**
     * All TIC series of a request's files (request QC view), downsampled
     * for overlay rendering. Files without a stored series are skipped.
     */
    @Transactional(readOnly = true)
    public List<TicSeries> getSeriesForRequest(String requestCode, int maxPoints) {
        if (maxPoints <= 0) {
            maxPoints = DEFAULT_MAX_POINTS;
        }

        List<RequestFile> files = fileRepository.findAllByRequestCodeOrderByFilename(requestCode)
                .orElse(new ArrayList<>());

        List<TicSeries> result = new ArrayList<>();
        for (RequestFile file : files) {
            String series = ticRepository.findByFileId(file.getId()).map(Tic::getTic).orElse(null);
            if (series == null || series.trim().isEmpty()) {
                continue;
            }

            double[][] points = parseSeries(series);
            if (points.length == 0) {
                continue;
            }

            result.add(new TicSeries(file.getChecksum(), file.getFilename(), downsample(points, maxPoints)));
        }

        return result;
    }

    /**
     * Validates the "gz1:" upload format and returns the decoded JSON text.
     */
    private String decodeSeries(String payload) {
        if (payload == null || !payload.startsWith(GZIP_PREFIX)) {
            throw new TicPayloadException("TIC payload must start with 'gz1:'");
        }

        byte[] compressed;
        try {
            compressed = Base64.getDecoder().decode(payload.substring(GZIP_PREFIX.length()));
        } catch (IllegalArgumentException e) {
            throw new TicPayloadException("TIC payload is not valid base64");
        }

        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try (GZIPInputStream in = new GZIPInputStream(new ByteArrayInputStream(compressed))) {
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                }
            }

            String decoded = out.toString(StandardCharsets.UTF_8.name()).trim();
            if (!decoded.startsWith("[")) {
                throw new TicPayloadException("TIC series is not a JSON array");
            }
            return decoded;
        } catch (TicPayloadException e) {
            throw e;
        } catch (Exception e) {
            throw new TicPayloadException("TIC payload is not valid gzip data");
        }
    }

    private double[][] parseSeries(String series) {
        double[][] points = new Gson().fromJson(series, double[][].class);
        return points == null ? new double[0][] : points;
    }

    /**
     * Peak-preserving downsampling: splits the (time-ordered) series into
     * n/maxPoints buckets and keeps the min and max TIC point of each, so a
     * 25-minute run (~5400 points) comes back as at most 2*maxPoints points
     * without losing peaks or valleys.
     */
    private double[][] downsample(double[][] points, int maxPoints) {
        int n = points.length;
        int budget = 2 * maxPoints;
        if (n <= budget) {
            return points;
        }

        int bucketSize = (n + maxPoints - 1) / maxPoints;
        List<double[]> out = new ArrayList<>(budget);

        for (int start = 0; start < n; start += bucketSize) {
            int end = Math.min(n, start + bucketSize);
            double[] min = points[start];
            double[] max = points[start];
            for (int i = start + 1; i < end; i++) {
                if (points[i][2] < min[2]) {
                    min = points[i];
                }
                if (points[i][2] > max[2]) {
                    max = points[i];
                }
            }
            out.add(min);
            if (max != min) {
                out.add(max);
            }
        }

        // Bucket min/max are not in time order; sort back by rt.
        out.sort((a, b) -> Double.compare(a[0], b[0]));
        return out.toArray(new double[0][]);
    }
}
