package eu.crg.qsample.data;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.file.File;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.wetlab.WetLabFile;

public interface DataRepository extends CrudRepository<Data, Long> {

    @Query("SELECT d as d from Data d, File f where d.contextSource.id=?1 and d.param.id=?2 and d.file.id = f.id and f.creationDate between ?3 and ?4 and f.type.id=?5 order by d.file.creationDate asc")
    List<Data> findParamData(Long contextSourceId, Long paramId, java.util.Date start, java.util.Date end,
            Long wetLabId);

    List<Data> findByFileInAndContextSourceInAndParamId(List <WetLabFile> fileId, List<ContextSource> contextSourceId, Long paramId);

    List<Data> findByFileInAndContextSourceIdAndParamId(List <WetLabFile> fileId, Long contextSourceId, Long paramId);


    List<Data> findByFileInAndContextSourceInAndParamOrderByFileFilename(List <RequestFile> fileId, List <ContextSource> contextSource, Param param);

    List<Data> findByFileInAndContextSourceInAndParamOrderByFileCreationDate(List <RequestFile> fileId, List <ContextSource> contextSource, Param param);


    List<Data> findByFile(WetLabFile file);

    List<Data> findByFileAndParam(WetLabFile file, Param param);

    List<Data> findByFileIn(List<WetLabFile> files);

    List<Data> findByFileInAndParam(List<WetLabFile> files, Param param);


}