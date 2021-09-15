package eu.crg.qsample.file;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.wetlab.WetLabFile;

public interface RequestFileRepository extends CrudRepository<File, Long> {
    public Optional<RequestFile> findOneByChecksum(String checksum);

    public List<RequestFile> findAllByCreationDateBetweenAndRequestCodeContainsAndFilenameContainsOrderByCreationDateDesc(Date startDate, Date endDate, String requestCode, String filename);

}