package eu.crg.qsample.request.favorite_request;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import eu.crg.qsample.security.model.User;

public interface FavoriteRequestUsersRepository extends CrudRepository <FavoriteRequestsUsers, Long> {

    public List<FavoriteRequestsUsers> findByFavoriteRequest(FavoriteRequest favoriteRequest);

    public Optional<FavoriteRequestsUsers> findOneByFavoriteRequestAgendoIdAndUser(Long agendoId, User user);
}