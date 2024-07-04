package eu.crg.qsample.request.favorite_request;

import eu.crg.qsample.security.model.User;

import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface FavoriteRequestUsersRepository
        extends CrudRepository<FavoriteRequestsUsers, Long> {

    public List<FavoriteRequestsUsers> findByFavoriteRequest(FavoriteRequest favoriteRequest);

    public Optional<FavoriteRequestsUsers> findOneByFavoriteRequestAgendoIdAndUser(
            Long agendoId, User user);

    public Optional<FavoriteRequestsUsers> findOneByFavoriteRequestRequestCodeAndUser(
            String requestCode, User user);

    public Optional<List<FavoriteRequestsUsers>> findByAndUser(User user);

    public Optional<List<FavoriteRequestsUsers>> findByFavoriteRequestAgendoId(Long agendoId);

    public Optional<List<FavoriteRequestsUsers>> findByFavoriteRequestRequestCode(
            String requestCode);

    public List<FavoriteRequestsUsers> findByFavoriteRequestRequestCodeAndNotify(
            String requestCode, boolean notify);
}
