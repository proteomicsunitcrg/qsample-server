package eu.crg.qsample.data;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.file.File;
import eu.crg.qsample.wetlab.WetLabFile;

public interface DataRepository extends CrudRepository<Data, Long> {

    @Query("SELECT d as d from Data d, File f where d.contextSource.id=?1 and d.param.id=?2 and d.file.id = f.id and f.creationDate between ?3 and ?4 and f.type.id=?5 order by d.file.creationDate asc")
    List<Data> findParamData(Long contextSourceId, Long paramId, java.util.Date start, java.util.Date end,
            Long wetLabId);

    List<Data> findByFileInAndContextSourceInAndParamId(List <WetLabFile> fileId, List<ContextSource> contextSourceId, Long paramId);

}