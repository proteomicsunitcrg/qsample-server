package eu.crg.qsample.quantification;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
import eu.crg.qsample.quantification.model.QuantificationFromPipeline;

@Service
public class QuantificationService {

    @Autowired
    RequestFileRepository requestFileRepo;

    @Autowired
    QuantificationRepository quantificationRepository;

    public void insertQuantificationFromPipeline(QuantificationFromPipeline quantificationFromPipeline) {
        Optional<RequestFile> fileOpt = requestFileRepo
                .findOneByChecksum(quantificationFromPipeline.getFile().getChecksum());
        if (!fileOpt.isPresent()) {
            System.out.println("File not found");
            throw new DataRetrievalFailureException("File not found");
        }
        quantificationFromPipeline.setFile(fileOpt.get());
        for (Quantification quant : quantificationFromPipeline.getQuant()) {
            Optional<Quantification> quantOpt= quantificationRepository.findByFileChecksumAndAccession(quantificationFromPipeline.getFile().getChecksum(), quant.getAccession());
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
        return quantificationRepository.findFirst5ByFileChecksumAndContaminantOrderByAbundanceDesc(checksum, contaminant);
        // return null;
    }

}
