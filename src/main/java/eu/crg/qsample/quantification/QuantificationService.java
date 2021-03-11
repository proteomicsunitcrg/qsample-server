package eu.crg.qsample.quantification;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.commons.math3.stat.correlation.PearsonsCorrelation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.exceptions.ConsensusException;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.file.FileService;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
import eu.crg.qsample.quantification.model.QuantificationFromPipeline;
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
        for (int i = 0; i < doublePrimitivePapa.length; i++) { // this is the only way to convert Double[] to do double[] primitive type
            doublePrimitivePapa[i] = list.get(i); // populate the primitive double array
        }
        return doublePrimitivePapa;
    }

    public List<List<Double>> heatmap(String requestCode, List<String> checksums) {
        SortedMap<RequestFile, List<Double>> fileWithConsensusQuantificationsMap = consensus(requestCode, checksums);
        List <List<Double>> finalCorrelationList = new ArrayList<>();
        fileWithConsensusQuantificationsMap.forEach((kpapa, vpapa) -> {
            System.out.println("Consensued prots: " + vpapa.size());
            if (vpapa.size() <= 1) {
                throw new ConsensusException("Consensus 1 or 0");
            }
            List <Double> correlationsList = new ArrayList<>();
            double[] xList = convertListOfDoublesToPrimitiveArray(vpapa);
            correlationsList.clear();
            fileWithConsensusQuantificationsMap.forEach((k, v) -> {
                double[] yList = convertListOfDoublesToPrimitiveArray(v);
                double correlation = new PearsonsCorrelation().correlation(xList, yList); // Do de math
                correlationsList.add(correlation); // add the result to the list
            });
            finalCorrelationList.add(correlationsList); //  add the list inside the list
        });
        return finalCorrelationList;
    }

    /**
     *
     * @param requestCode
     * @return
     */
    private SortedMap<RequestFile, List<Double>> consensus(String requestCode, List<String> checksums) {
        Optional<List<RequestFile>> files = fileRepository.findAllByRequestCodeContainsAndChecksumIn(requestCode, checksums); // We get all request files that his checksum is in the list
        SortedMap<RequestFile, List<Double>> fileMap = new TreeMap<>(); // Data struct to store the file with his quantification abundance
        if (files.isPresent()) {
            for (RequestFile file : files.get()) {
                List<Double> quantInAllFiles = new ArrayList<>(); // List to store the consensued file quantification
                List<RequestFile> filesCopy = new ArrayList<>(files.get()); // Clone withouth the current loop element
                filesCopy.remove(file); // Remove the current file loop element
                Optional<List<Quantification>> quantificationListOpt = quantificationRepository // Obtain the current file loop quantification
                        .findByFileChecksumOrderByIdDesc(file.getChecksum());
                if (quantificationListOpt.isPresent()) {
                    for (Quantification quant : quantificationListOpt.get()) { // Loop the file quantification
                        if (checkIfQuantificationInAllFiles(quant, filesCopy)) {
                            quantInAllFiles.add(quant.getAbundance()); // If all the files have the quantification we push it to the list
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

}
