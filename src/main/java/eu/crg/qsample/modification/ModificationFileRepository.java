package eu.crg.qsample.modification;

import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.file.RequestFile;

public interface ModificationFileRepository extends CrudRepository<ModificationFile, Long> {

    public Optional <ModificationFile> findOneByFileAndModification(RequestFile file, Modification mod);

    @Modifying
    @Query("delete from ModificationFile mf where mf.file.id = ?1")
    void deleteByFile_Id(Long fileId);

}
