package eu.crg.qsample.modification;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.file.RequestFile;

public interface ModificationFileRepository extends CrudRepository<ModificationFile, Long> {

    public Optional <ModificationFile> findOneByFileAndModification(RequestFile file, Modification mod);

}
