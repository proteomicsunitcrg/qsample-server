package eu.crg.qsample.quantification;

import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.file.FileService;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
import eu.crg.qsample.quantification.model.QuantificationFromPipeline;
import eu.crg.qsample.restservice_neon.DendogramBody;
import eu.crg.qsample.restservice_neon.RestServiceNeon;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.SortedMap;
import java.util.TreeMap;
import org.apache.commons.math3.stat.correlation.PearsonsCorrelation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

@Service
public class QuantificationService {

  @Autowired RequestFileRepository requestFileRepo;

  @Autowired QuantificationRepository quantificationRepository;

  @Autowired FileService fileService;

  @Autowired FileRepository fileRepository;

  @Autowired RestServiceNeon restNeon;

  @Value("${neon-stats.disable}")
  boolean disableNeonStats;

  public void insertQuantificationFromPipeline(
      QuantificationFromPipeline quantificationFromPipeline) {
    Optional<RequestFile> fileOpt =
        requestFileRepo.findOneByChecksum(quantificationFromPipeline.getFile().getChecksum());
    if (!fileOpt.isPresent()) {
      // System.out.println("File not found");
      throw new DataRetrievalFailureException("File not found");
    }
    quantificationFromPipeline.setFile(fileOpt.get());
    for (Quantification quant : quantificationFromPipeline.getQuant()) {
      Optional<Quantification> quantOpt =
          quantificationRepository.findByFileChecksumAndAccession(
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
    return quantificationRepository.findFirst5ByFileChecksumAndContaminantOrderByAbundanceDesc(
        checksum, contaminant);
    // return null;
  }

  private double[] convertListOfDoublesToPrimitiveArray(List<Double> list) {
    double[] doublePrimitivePapa = new double[list.size()]; // Create array of primitive doubles
    for (int i = 0;
        i < doublePrimitivePapa.length;
        i++) { // this is the only way to convert Double[] to do
      // double[] primitive type
      doublePrimitivePapa[i] = list.get(i); // populate the primitive double array
    }
    return doublePrimitivePapa;
  }

  public HeatmapData heatmap2(
      String requestCode, List<String> checksums, int consensus, String order) {
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

    if (!files.isPresent()) {
      return null;
    }

    Map<String, Map<String, Double>> quantificationsByChecksum = new HashMap<>();

    for (RequestFile file : files.get()) {
      Optional<List<Quantification>> quantificationListOpt =
          quantificationRepository.findByFileChecksumOrderByIdDesc(file.getChecksum());

      if (!quantificationListOpt.isPresent()) {
        continue;
      }

      Map<String, Double> abundanceByAccession = new HashMap<>();
      for (Quantification quantification : quantificationListOpt.get()) {
        abundanceByAccession.putIfAbsent(
            quantification.getAccession(),
            quantification.getAbundance());
      }

      quantificationsByChecksum.put(file.getChecksum(), abundanceByAccession);
    }

    List<List<Double>> finalCorrelationList = new ArrayList<>();

    for (RequestFile file : files.get()) {
      if (!quantificationsByChecksum.containsKey(file.getChecksum())) {
        continue;
      }

      List<Double> correlationsList = new ArrayList<>();

      for (RequestFile fileMini : files.get()) {
        Double calRes = calc(file, fileMini, consensus, quantificationsByChecksum);
        if (calRes != null) {
          correlationsList.add(calRes);
        }
      }

      filenames.add(file.getFilename());
      finalCorrelationList.add(correlationsList);
    }

    heatmapData.setData(finalCorrelationList);
    heatmapData.setNames(filenames);
    return heatmapData;
  }

  public Double calc(RequestFile file1, RequestFile file2, int consensus) {
    Map<String, Map<String, Double>> quantificationsByChecksum = new HashMap<>();

    Optional<List<Quantification>> quantificationListOpt =
        quantificationRepository.findByFileChecksumOrderByIdDesc(file1.getChecksum());
    Optional<List<Quantification>> quantificationListOpt2 =
        quantificationRepository.findByFileChecksumOrderByIdDesc(file2.getChecksum());

    if (quantificationListOpt.isPresent()) {
      quantificationsByChecksum.put(file1.getChecksum(), toAbundanceByAccession(quantificationListOpt.get()));
    }

    if (quantificationListOpt2.isPresent()) {
      quantificationsByChecksum.put(file2.getChecksum(), toAbundanceByAccession(quantificationListOpt2.get()));
    }

    return calc(file1, file2, consensus, quantificationsByChecksum);
  }

  private Double calc(
      RequestFile file1,
      RequestFile file2,
      int consensus,
      Map<String, Map<String, Double>> quantificationsByChecksum) {
    if (file1.getId().equals(file2.getId())) {
      return 1d;
    }

    Map<String, Double> quantifications1 = quantificationsByChecksum.get(file1.getChecksum());
    Map<String, Double> quantifications2 = quantificationsByChecksum.get(file2.getChecksum());

    if (quantifications1 == null || quantifications2 == null) {
      return null;
    }

    List<Double> consensued = new ArrayList<>();
    List<Double> consensued2 = new ArrayList<>();

    for (Map.Entry<String, Double> entry : quantifications1.entrySet()) {
      Double abundance2 = quantifications2.get(entry.getKey());

      if (abundance2 != null) {
        consensued.add(Math.log(entry.getValue()));
        consensued2.add(Math.log(abundance2));
      }
    }

    if (consensued.size() < consensus) {
      return 0d;
    }

    double correlation =
        new PearsonsCorrelation()
            .correlation(
                convertListOfDoublesToPrimitiveArray(consensued),
                convertListOfDoublesToPrimitiveArray(consensued2));

    if (Double.isNaN(correlation)) {
      return null;
    }

    return Math.pow(correlation, 2);
  }

  private Map<String, Double> toAbundanceByAccession(List<Quantification> quantifications) {
    Map<String, Double> abundanceByAccession = new HashMap<>();

    for (Quantification quantification : quantifications) {
      abundanceByAccession.putIfAbsent(
          quantification.getAccession(),
          quantification.getAbundance());
    }

    return abundanceByAccession;
  }

  public List<List<Double>> pca(String requestCode, List<String> checksums) {
    HeatmapData heatmapData = heatmap2(requestCode, checksums, 20, "filename");
    // System.out.println(heatmapData.getData().toString());
    return heatmapData.getData();
  }

  /**
   * @param requestCode
   * @return
   */
  private SortedMap<RequestFile, List<Quantification>> consensus(
      String requestCode, List<String> checksums) {
    Optional<List<RequestFile>> files =
        fileRepository.findAllByRequestCodeContainsAndChecksumInOrderByFilename(
            requestCode, checksums); // We get all
    // request files
    // that his
    // checksum is in
    // the list
    SortedMap<RequestFile, List<Quantification>> fileMap = new TreeMap<>(); // Data
    // struct to store the file with his
    // quantification abundance
    if (files.isPresent()) {
      // System.out.println("I have files");
      for (RequestFile file : files.get()) {
        List<Quantification> quantInAllFiles = new ArrayList<>(); // List to store the
        // consensued file quantification
        List<RequestFile> filesCopy = new ArrayList<>(files.get()); // Clone withouth
        // the current loop element
        filesCopy.remove(file); // Remove the current file loop element
        Optional<List<Quantification>> quantificationListOpt =
            quantificationRepository // Obtain the current
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
      Optional<List<Quantification>> quantListOpt =
          quantificationRepository.findByFileChecksumOrderByIdDesc(file.getChecksum());
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

  public byte[] dendogram(String requestCode, List<String> checksums, int consensus, String theme) {
    HeatmapData heatmapData = heatmap2(requestCode, checksums, consensus, "filename");
    DendogramBody dendo = new DendogramBody(heatmapData.getData(), heatmapData.getNames(), theme);
    byte[] imgbyte = restNeon.getFiles(dendo);

    return imgbyte;
  }

  public boolean showNeonStats() {
    return disableNeonStats;
  }
}
