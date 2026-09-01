package eu.crg.qsample.quantification;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface QuantificationRepository extends CrudRepository<Quantification, Long> {

    List<Quantification>findFirst5ByFileChecksumAndContaminantOrderByAbundanceDesc(String checksum, boolean contaminant);

    Optional<Quantification> findByFileChecksumAndAccession(String checksum, String accession);

    Optional <List<Quantification>> findByFileChecksumOrderByIdDesc(String checksum);

    @Modifying
    @Query("delete from Quantification q where q.file.id = ?1")
    void deleteByFile_Id(Long fileId);

}
