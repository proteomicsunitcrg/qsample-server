package eu.crg.qsample.file;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import eu.crg.qsample.wetlab.WetLabFile;

public interface RequestFileRepository extends CrudRepository<File, Long> {
    public Optional<RequestFile> findOneByChecksum(String checksum);

    public List<RequestFile> findAllByCreationDateBetweenAndRequestCodeContainsAndFilenameContainsOrderByCreationDateDesc(Date startDate, Date endDate, String requestCode, String filename);

    public Optional<RequestFile> findFirstByRequestCodeContainsOrderByCreationDateDesc(String requestCode);

    @Query("select f.requestCode, max(f.creationDate) from RequestFile f where f.requestCode in :requestCodes group by f.requestCode")
    public List<Object[]> findLastProcessedFileDatesByRequestCodeIn(@Param("requestCodes") List<String> requestCodes);

}