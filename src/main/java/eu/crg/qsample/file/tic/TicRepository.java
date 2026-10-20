package eu.crg.qsample.file.tic;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TicRepository extends CrudRepository<Tic, Long> {

    Optional<Tic> findByFileId(Long fileId);
}
