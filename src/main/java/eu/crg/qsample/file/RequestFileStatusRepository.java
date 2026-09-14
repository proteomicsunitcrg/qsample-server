package eu.crg.qsample.file;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RequestFileStatusRepository extends JpaRepository<RequestFileStatus, Long> {

    Optional<RequestFileStatus> findByChecksum(String checksum);

    List<RequestFileStatus> findByChecksumIn(List<String> checksums);

}
