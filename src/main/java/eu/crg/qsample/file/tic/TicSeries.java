package eu.crg.qsample.file.tic;

/**
 * One file's TIC series for the request view:
 * points = [[rt_ms, msLevel, tic], ...], downsampled (min/max per bucket).
 */
public class TicSeries {

    private final String checksum;
    private final String filename;
    private final double[][] points;

    public TicSeries(String checksum, String filename, double[][] points) {
        this.checksum = checksum;
        this.filename = filename;
        this.points = points;
    }

    public String getChecksum() {
        return checksum;
    }

    public String getFilename() {
        return filename;
    }

    public double[][] getPoints() {
        return points;
    }
}
