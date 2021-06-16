package eu.crg.qsample.request.favorite_request;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import eu.crg.qsample.security.model.User;

@Repository
public interface FavoriteRequestRepository extends CrudRepository<FavoriteRequest, Long>{

    Optional<FavoriteRequest> findOneByAgendoIdAndUsers(Long agendoId, User u);

    Optional<FavoriteRequest>findOneByAgendoId(Long agendoId);


}