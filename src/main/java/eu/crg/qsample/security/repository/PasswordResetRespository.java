package eu.crg.qsample.security.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.security.model.PasswordResetToken;
import eu.crg.qsample.security.model.User;

@Repository
public interface PasswordResetRespository extends JpaRepository <PasswordResetToken, Long>{

    public Optional <PasswordResetToken> findOneByUser(User u);

}
