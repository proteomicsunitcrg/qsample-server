package eu.crg.qsample.quantification;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface QuantificationRepository extends CrudRepository<Quantification, Long> {

    List<Quantification>findFirst5ByFileChecksumAndContaminantOrderByAbundanceDesc(String checksum, boolean contaminant);

}
