package eu.crg.qsample.quantification;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

public interface QuantificationRepository extends CrudRepository<Quantification, Long> {

    List<Quantification>findFirst5ByFileChecksumAndContaminantOrderByAbundanceDesc(String checksum, boolean contaminant);

    Optional<Quantification> findByFileChecksumAndAccession(String checksum, String accession);

    Optional <List<Quantification>> findByFileChecksumOrderByIdDesc(String checksum);

}
