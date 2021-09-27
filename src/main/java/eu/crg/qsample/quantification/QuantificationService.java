package eu.crg.qsample.quantification;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.SortedMap;
import java.util.TreeMap;

import com.google.gson.JsonObject;

import org.apache.commons.math3.linear.EigenDecomposition;
import org.apache.commons.math3.linear.MatrixUtils;
import org.apache.commons.math3.linear.RealMatrix;
import org.apache.commons.math3.stat.correlation.Covariance;
import org.apache.commons.math3.stat.correlation.PearsonsCorrelation;
import org.nd4j.linalg.api.buffer.DataType;
import org.nd4j.linalg.api.ndarray.INDArray;
import org.nd4j.linalg.dimensionalityreduction.PCA;
import org.nd4j.linalg.factory.Nd4j;
import org.nd4j.list.NDArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.exceptions.ConsensusException;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.file.FileService;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
import eu.crg.qsample.quantification.model.QuantificationFromPipeline;
import eu.crg.qsample.restservice_neon.DendogramBody;
import eu.crg.qsample.restservice_neon.RestServiceNeon;
import net.bytebuddy.TypeCache.Sort;


@Service
public class QuantificationService {

    @Autowired
    RequestFileRepository requestFileRepo;

    @Autowired
    QuantificationRepository quantificationRepository;

    @Autowired
    FileService fileService;

    @Autowired
    FileRepository fileRepository;

    @Autowired
    RestServiceNeon restNeon;

    @Value("${neon-stats.disable}")
    boolean disableNeonStats;

    public void insertQuantificationFromPipeline(QuantificationFromPipeline quantificationFromPipeline) {
        Optional<RequestFile> fileOpt = requestFileRepo
                .findOneByChecksum(quantificationFromPipeline.getFile().getChecksum());
        if (!fileOpt.isPresent()) {
            System.out.println("File not found");
            throw new DataRetrievalFailureException("File not found");
        }
        quantificationFromPipeline.setFile(fileOpt.get());
        for (Quantification quant : quantificationFromPipeline.getQuant()) {
            Optional<Quantification> quantOpt = quantificationRepository.findByFileChecksumAndAccession(
                    quantificationFromPipeline.getFile().getChecksum(), quant.getAccession());
            if (quantOpt.isPresent()) {
                continue;
            }
            Quantification toInsert = new Quantification();
            toInsert.setFile(quantificationFromPipeline.getFile());
            toInsert.setAbundance(quant.getAbundance());
            toInsert.setAccession(quant.getAccession());
            toInsert.setDescription(quant.getDescription());
            toInsert.setContaminant(quant.isContaminant());
            quantificationRepository.save(toInsert);
        }
    }

    public List<Quantification> getByChechsumAndContaminant(String checksum, boolean contaminant) {
        return quantificationRepository.findFirst5ByFileChecksumAndContaminantOrderByAbundanceDesc(checksum,
                contaminant);
        // return null;
    }

    private double[] convertListOfDoublesToPrimitiveArray(List<Double> list) {
        double[] doublePrimitivePapa = new double[list.size()]; // Create array of primitive doubles
        for (int i = 0; i < doublePrimitivePapa.length; i++) { // this is the only way to convert Double[] to do
                                                               // double[] primitive type
            doublePrimitivePapa[i] = list.get(i); // populate the primitive double array
        }
        return doublePrimitivePapa;
    }

    public HeatmapData heatmap2(String requestCode, List<String> checksums, int consensus, String order) {
        HeatmapData heatmapData = new HeatmapData();
        List<String> filenames = new ArrayList<>();
        Optional<List<RequestFile>> files = Optional.of(new ArrayList<RequestFile>());
        switch (order) {
            case "filename":
                files = fileRepository.findAllByRequestCodeAndChecksumInOrderByFilename(requestCode, checksums);
                break;
            case "date":
                files = fileRepository.findAllByRequestCodeAndChecksumInOrderByCreationDate(requestCode, checksums);
                break;
            default:
                files = fileRepository.findAllByRequestCodeAndChecksumInOrderByFilename(requestCode, checksums);
                break;
        }
        List<List<Double>> finalCorrelationList = new ArrayList<>();
        if (files.isPresent()) {
            for (RequestFile file : files.get()) {
                List<Double> correlationsList = new ArrayList<>();
                Optional<List<Quantification>> quantificationListOpt = quantificationRepository
                        .findByFileChecksumOrderByIdDesc(file.getChecksum());
                if (quantificationListOpt.isPresent()) {
                    for (RequestFile fileMini : files.get()) {
                        Double calRes = calc(file, fileMini, consensus);
                        if (calRes != null) {
                            correlationsList.add(calc(file, fileMini, consensus));
                        }
                    }
                    filenames.add(file.getFilename());
                    finalCorrelationList.add(correlationsList);
                }
            }
            heatmapData.setData(finalCorrelationList);
            heatmapData.setNames(filenames);
            return heatmapData;
        }
        return null;
    }

    public Double calc(RequestFile file1, RequestFile file2, int consensus) {
        Optional<List<Quantification>> quantificationListOpt = quantificationRepository // Obtain the current file loop
                                                                                        // quantification
                .findByFileChecksumOrderByIdDesc(file1.getChecksum());
        Optional<List<Quantification>> quantificationListOpt2 = quantificationRepository // Obtain the current file loop
                                                                                         // quantification
                .findByFileChecksumOrderByIdDesc(file2.getChecksum());
        List<Double> consensued = new ArrayList<>();
        List<Double> consensued2 = new ArrayList<>();
        if (quantificationListOpt.isPresent() && quantificationListOpt2.isPresent()) {
            if (file1.getId().equals(file2.getId())) { // Both are the same file, the consensus is total
                return 1d;
            } else {
                for (Quantification quant1 : quantificationListOpt.get()) {
                    for (Quantification quant2 : quantificationListOpt2.get()) {
                        if (quant1.getAccession().equals(quant2.getAccession())) {
                            consensued.add(quant1.getAbundance());
                            consensued2.add(quant2.getAbundance());
                            continue;
                        }
                    }
                }
            }
            if (consensued.size() < consensus) {
                return 0d;
            }
            double correlation = new PearsonsCorrelation().correlation(convertListOfDoublesToPrimitiveArray(consensued),
                    convertListOfDoublesToPrimitiveArray(consensued2)); // Do de math
            return Math.pow(correlation, 2);
        } else {
            return null;
        }
    }

    public List<List<Double>> pca(String requestCode, List<String> checksums) {
        HeatmapData heatmapData = heatmap2(requestCode, checksums, 20, "filename");
        System.out.println(heatmapData.getData().toString());
        return heatmapData.getData();
    }

    /**
     * OTHER HEATMAP WITH FULL CONSENSUS TRACES I DONT WANT TO DELETE IT BECAUSE WE
     * KNOW CRISTINA AND EDUARD <3
     */

    // public List<List<Double>> heatmap(String requestCode, List<String> checksums)
    // {
    // SortedMap<RequestFile, List<Double>> fileWithConsensusQuantificationsMap =
    // consensus(requestCode);
    // List<List<Double>> finalCorrelationList = new ArrayList<>();
    // fileWithConsensusQuantificationsMap.forEach((kpapa, vpapa) -> {
    // System.out.println("Consensued prots: " + vpapa.size());
    // if (vpapa.size() <= 1) {
    // throw new ConsensusException("Consensus 1 or 0");
    // }
    // List<Double> correlationsList = new ArrayList<>();
    // double[] xList = convertListOfDoublesToPrimitiveArray(vpapa);
    // correlationsList.clear();
    // fileWithConsensusQuantificationsMap.forEach((k, v) -> {
    // double[] yList = convertListOfDoublesToPrimitiveArray(v);
    // double correlation = new PearsonsCorrelation().correlation(xList, yList); //
    // do the math
    // correlationsList.add(correlation); // add the result to the list
    // });
    // finalCorrelationList.add(correlationsList); // add the list inside the list
    // });
    // return finalCorrelationList;
    // }

    /**
     *
     * @param requestCode
     * @return
     */
    private SortedMap<RequestFile, List<Quantification>> consensus(String requestCode, List<String> checksums) {
        Optional<List<RequestFile>> files = fileRepository
                .findAllByRequestCodeContainsAndChecksumInOrderByFilename(requestCode, checksums); // We get all
        // request files
        // that his
        // checksum is in
        // the list
        SortedMap<RequestFile, List<Quantification>> fileMap = new TreeMap<>(); // Data
        // struct to store the file with his
        // quantification abundance
        if (files.isPresent()) {
            System.out.println("I have files");
            for (RequestFile file : files.get()) {
                List<Quantification> quantInAllFiles = new ArrayList<>(); // List to store the
                // consensued file quantification
                List<RequestFile> filesCopy = new ArrayList<>(files.get()); // Clone withouth
                // the current loop element
                filesCopy.remove(file); // Remove the current file loop element
                Optional<List<Quantification>> quantificationListOpt = quantificationRepository // Obtain the current
                        // file loop
                        // quantification
                        .findByFileChecksumOrderByIdDesc(file.getChecksum());
                if (quantificationListOpt.isPresent()) {
                    // System.out.println(quantificationListOpt.get().size());
                    for (Quantification quant : quantificationListOpt.get()) { // Loop the file
                        // quantification
                        if (checkIfQuantificationInAllFiles(quant, filesCopy)) {
                            quantInAllFiles.add(quant); // If all the files have the
                            // quantification we
                            // push it to the list
                        }
                    }
                }
                fileMap.put(file, quantInAllFiles); // Push the element to the map
            }
        }
        return fileMap;
    }

    /**
     * Returns true if a quantification
     *
     * @param quant
     * @param files
     * @return
     */
    public boolean checkIfQuantificationInAllFiles(Quantification quant, List<RequestFile> files) {
        for (RequestFile file : files) {
            boolean inList = false;
            Optional<List<Quantification>> quantListOpt = quantificationRepository
                    .findByFileChecksumOrderByIdDesc(file.getChecksum());
            if (!quantListOpt.isPresent()) {
                return false; // A file doesnt have quantifications
            }
            for (Quantification quantItem : quantListOpt.get()) {
                if (quantItem.getAccession().equals(quant.getAccession())) {
                    inList = true;
                }
            }
            if (!inList) {
                return false;
            }
        }
        return true;
    }

    public byte[] dendogram(String requestCode, List<String> checksums, String theme) {
        HeatmapData heatmapData = heatmap2(requestCode, checksums, 20, "filename");
        DendogramBody dendo = new DendogramBody(heatmapData.getData(), heatmapData.getNames(), theme);
        byte[] imgbyte= restNeon.getFiles(dendo);

        return imgbyte;
    }

    public boolean showNeonStats() {
        return disableNeonStats;
    }

}
