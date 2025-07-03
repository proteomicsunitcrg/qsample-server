package eu.crg.qsample.qgenerator.application;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ApplicationRepository extends CrudRepository<Application, Long> {

  public Application findOneByName(String name);
}
