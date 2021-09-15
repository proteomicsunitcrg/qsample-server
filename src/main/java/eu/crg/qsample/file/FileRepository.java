package eu.crg.qsample.file;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.wetlab.WetLabFile;

public interface FileRepository extends CrudRepository<File, Long> {

    public List <WetLabFile> findAllByCreationDateBetweenAndTypeIdOrderByWeekAscYearAsc(Date startDate, Date endDate, Long wetLabId);

    public List <WetLabFile> findAllByTypeApiKey(UUID apiKey);

    public Optional<WetLabFile> findOneByChecksum(String checksum);

    public Optional <List<WetLabFile>> findByCreationDateGreaterThanAndTypeApiKey(Date creationDate, UUID apiKey);

    public Optional <List<WetLabFile>> findOneBytypeApiKeyAndWeekAndYearAndReplicate(UUID apiKey, int week, int year, int replicate);

    public Optional <List<RequestFile>> findAllByRequestCodeContains(String requestCode);

    // public Page<RequestFile> findAllByRequestCodeAndCreationDateBetweenOrderByFilename(String requestCode, Date startDate, Date endDate, Pageable page);

    public List<WetLabFile> findAllByCreationDateBetweenAndFilenameContainsAndTypeIdOrderByCreationDateDesc(Date startDate, Date endDate, String filename, Long wetlabId);

    public List<WetLabFile> findAllByCreationDateBetweenAndFilenameContainsOrderByCreationDateDesc(Date startDate, Date endDate, String filename);


    public List<RequestFile> findAllByRequestCodeContainsAndFilenameContainsOrderByFilename(String requestCode, String filename);


    public Optional <List<RequestFile>> findAllByRequestCodeOrderByFilename(String requestCode);

    public Optional <List<RequestFile>> findAllByRequestCodeAndChecksumInOrderByFilename(String requestCode, List<String> checksum);

    public Optional <List<RequestFile>> findAllByRequestCodeOrderByCreationDate(String requestCode);

    public Optional <List<RequestFile>> findAllByRequestCodeAndChecksumInOrderByCreationDate(String requestCode, List<String> checksum);

    public Optional <List<RequestFile>> findAllByRequestCodeContainsAndChecksumInOrderByFilename(String requestCode, List<String> checksum);

}