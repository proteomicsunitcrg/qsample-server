package eu.crg.qsample.security.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.security.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // Optional <User> findByEmail(String email);

    Boolean existsByUsername(String username);

    Optional<User> findByUsername(String username);

    Optional<User> findByAgendoId(Long agendoId);

    Optional<User> findByApiKey(UUID apiKey);

	Boolean deleteByUsername(String username);
}
