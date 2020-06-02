package eu.crg.qsample.file;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.wetlab.WetLabFile;

public interface FileRepository extends CrudRepository<File, Long> {

    public List <WetLabFile> findAllByCreationDateBetweenAndTypeId(Date startDate, Date endDate, Long wetLabId);
}