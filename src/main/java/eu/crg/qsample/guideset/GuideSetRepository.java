package eu.crg.qsample.guideset;

import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.wetlab.WetLab;

public interface GuideSetRepository extends CrudRepository<GuideSet, Long>{

    @Modifying
    @Query(value = "delete from guide_set_files where files_id = ?1", nativeQuery = true)
    void deleteFileFromGuideSets(Long fileId);
}