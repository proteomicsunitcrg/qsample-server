package eu.crg.qsample.modification;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

public interface ModificationRepository extends CrudRepository<Modification, Long> {

    public Optional <Modification> findOneByName(String name);
}
