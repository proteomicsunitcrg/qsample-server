package eu.crg.qsample.security.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.security.model.ERole;
import eu.crg.qsample.security.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<eu.crg.qsample.security.model.Role, Long> {
    Optional<eu.crg.qsample.security.model.Role> findByName(eu.crg.qsample.security.model.ERole name);
}