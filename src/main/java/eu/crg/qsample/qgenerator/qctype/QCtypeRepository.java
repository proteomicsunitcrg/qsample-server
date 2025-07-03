package eu.crg.qsample.qgenerator.qctype;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QCtypeRepository extends CrudRepository<QCtype, Long> {

  public QCtype findOneByName(String name);
}
