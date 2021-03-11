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

    public Optional<WetLabFile> findOneByCreationDateGreaterThanAndTypeApiKey(Date creationDate, UUID apiKey);

    public Optional <List<RequestFile>> findAllByRequestCodeContains(String requestCode);

    public Optional <List<RequestFile>> findAllByRequestCodeContainsAndChecksumIn(String requestCode, List<String> checksum);

}