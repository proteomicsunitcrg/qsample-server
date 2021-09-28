package eu.crg.qsample.request.local;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface RequestRepository extends CrudRepository <RequestLocal, Long> {

    List <RequestLocal> findAllByCreationDateBetween(Date startDate, Date endDate);

}