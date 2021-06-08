package eu.crg.qsample.file;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.wetlab.WetLabFile;

public interface FileRepository extends CrudRepository<File, Long> {

    public List <WetLabFile> findAllByCreationDateBetweenAndTypeId(Date startDate, Date endDate, Long wetLabId);

    public List <WetLabFile> findAllByTypeApiKey(UUID apiKey);

    public Optional<WetLabFile> findOneByChecksum(String checksum);

    public Optional <List<WetLabFile>> findByCreationDateGreaterThanAndTypeApiKey(Date creationDate, UUID apiKey);

    public Optional <List<WetLabFile>> findOneBytypeApiKeyAndWeekAndYearAndReplicate(UUID apiKey, int week, int year, int replicate);

    public Optional <List<RequestFile>> findAllByRequestCodeContains(String requestCode);

    public Optional <List<RequestFile>> findAllByRequestCodeOrderByFilename(String requestCode);

    public Optional <List<RequestFile>> findAllByRequestCodeAndChecksumInOrderByFilename(String requestCode, List<String> checksum);

    public Optional <List<RequestFile>> findAllByRequestCodeOrderByCreationDate(String requestCode);

    public Optional <List<RequestFile>> findAllByRequestCodeAndChecksumInOrderByCreationDate(String requestCode, List<String> checksum);

    public Optional <List<RequestFile>> findAllByRequestCodeContainsAndChecksumInOrderByFilename(String requestCode, List<String> checksum);

}