package eu.crg.qsample.security.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.security.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    // Optional <User> findByEmail(String email);

	Boolean existsByUsername(String username);

	Optional <User> findByUsername(String username);
}