package eu.crg.qsample.request.favorite_request;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.request.AgendoRequest;
import eu.crg.qsample.request.MiniRequest;
import eu.crg.qsample.request.RequestService;
import eu.crg.qsample.request.local.RequestLocal;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class FavoriteRequestService {

    @Autowired FavoriteRequestRepository favoriteRequestRepository;

    @Autowired UserRepository userRepository;

    @Autowired RequestService requestService;

    @Autowired FavoriteRequestUsersRepository favoriteRequestUsersRepository;

    public FavoriteRequest save(FavoriteRequest favoriteRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequest> favrequest =
                favoriteRequestRepository.findOneByRequestCode(favoriteRequest.getRequestCode());
        if (favrequest.isPresent()) {
            FavoriteRequestsUsers newRelation =
                    new FavoriteRequestsUsers(null, favrequest.get(), u, false);
            favoriteRequestUsersRepository.save(newRelation);
            return favrequest.get();
        } else {
            FavoriteRequest newRequest =
                    new FavoriteRequest(
                            null, favoriteRequest.getRequestCode(), favoriteRequest.getAgendoId());
            favoriteRequestRepository.save(newRequest);
            FavoriteRequestsUsers newRelation =
                    new FavoriteRequestsUsers(null, newRequest, u, false);
            favoriteRequestUsersRepository.save(newRelation);
            return newRequest;
        }
    }

    private User getUserFromSecurityContext() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        return u;
    }

    public boolean checkIfFav(Long agendoId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequestsUsers> optReq =
                favoriteRequestUsersRepository.findOneByFavoriteRequestAgendoIdAndUser(agendoId, u);
        if (optReq.isPresent()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkIfFavByRequestCode(String requestCode) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequestsUsers> optReq =
                favoriteRequestUsersRepository.findOneByFavoriteRequestRequestCodeAndUser(
                        requestCode, u);
        if (optReq.isPresent()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean removeFav(FavoriteRequest favRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequestsUsers> optReq =
                favoriteRequestUsersRepository.findOneByFavoriteRequestRequestCodeAndUser(
                        favRequest.getRequestCode(), u);
        if (optReq.isPresent()) { // delete the relation
            favoriteRequestUsersRepository.delete(optReq.get());
        } else {
            return false; // if not found means that something is wrong
        }
        Optional<List<FavoriteRequestsUsers>> optCheckLast =
                favoriteRequestUsersRepository.findByFavoriteRequestRequestCode(
                        favRequest.getRequestCode()); // get all the relations
        if (!optCheckLast
                .isPresent()) { // if no relations means that the favrequest doesnt have any user
            Optional<FavoriteRequest> favRequestOpt =
                    favoriteRequestRepository.findOneByRequestCode(favRequest.getRequestCode());
            if (favRequestOpt.isPresent()) { // so we find it and then delete it
                favoriteRequestRepository.delete(favRequestOpt.get());
            }
        }
        return true;
    }

    // Handle requests thru' Agendo
    public List<MiniRequest> getFavAgendo() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<List<FavoriteRequestsUsers>> favListOpt =
                favoriteRequestUsersRepository.findByAndUser(u);
        List<AgendoRequest> agendoRequests = new ArrayList<>();
        List<MiniRequest> miniRequests = new ArrayList<>();
        if (favListOpt.isPresent()) {
            for (FavoriteRequestsUsers request : favListOpt.get()) {
                agendoRequests.add(
                        requestService.getRequestById(request.getFavoriteRequest().getAgendoId()));
            }
            for (AgendoRequest agendoRequest : agendoRequests) {
                String requestCode = agendoRequest.getRef(); // Get requestCode from ref field
                miniRequests.add(
                        new MiniRequest(
                                agendoRequest.getId(),
                                agendoRequest.getClasss(),
                                agendoRequest.getCreated_by().getEmail(),
                                agendoRequest.getCreated_by().getName(),
                                agendoRequest.getdate_created(),
                                agendoRequest.getLast_action().getAction(),
                                // getRequestCode(agendoRequest.getFields().get(agendoRequest.getFields().size() - 1).getValue()),
                                requestCode,
                                false,
                                false));
            }
        }

        return miniRequests;
    }

    // Handle requests locally
    public List<MiniRequest> getFavLocal() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<List<FavoriteRequestsUsers>> favListOpt =
                favoriteRequestUsersRepository.findByAndUser(u);
        List<RequestLocal> requests = new ArrayList<>();
        List<MiniRequest> miniRequests = new ArrayList<>();
        if (favListOpt.isPresent()) {
            for (FavoriteRequestsUsers request : favListOpt.get()) {
                requests.add(
                        requestService.getLocalRequestByRequestCode(
                                request.getFavoriteRequest().getRequestCode()));
            }

            for (RequestLocal request : requests) {
                miniRequests.add(
                        new MiniRequest(
                                request.getId(),
                                request.getApplication().getName(),
                                "",
                                request.getCreator(),
                                request.getCreationDate().toString().split("\\.")[0],
                                request.getStatus(),
                                request.getRequestCode(),
                                false,
                                true));
            }
        }

        return miniRequests;
    }

    public FavoriteRequestsUsers getFavoriteRequestRelationByAgendoId(Long agendoId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequestsUsers> favRequestOpt =
                favoriteRequestUsersRepository.findOneByFavoriteRequestAgendoIdAndUser(agendoId, u);
        if (favRequestOpt.isPresent()) {
            return favRequestOpt.get();
        } else {
            return null;
        }
    }

    public FavoriteRequestsUsers getFavoriteRequestRelationByRequestCode(String requestCode) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequestsUsers> favRequestOpt =
                favoriteRequestUsersRepository.findOneByFavoriteRequestRequestCodeAndUser(
                        requestCode, u);
        if (favRequestOpt.isPresent()) {
            return favRequestOpt.get();
        } else {
            return null;
        }
    }

    public FavoriteRequestsUsers setNotify(FavoriteRequest favRequest, boolean action) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequestsUsers> favRequestOpt =
                favoriteRequestUsersRepository.findOneByFavoriteRequestAgendoIdAndUser(
                        favRequest.getAgendoId(), u);
        if (favRequestOpt.isPresent()) {
            favRequestOpt.get().setNotify(action);
            return favoriteRequestUsersRepository.save(favRequestOpt.get());
        } else {
            throw new NotFoundException("Fav request not found");
        }
    }

    public List<FavoriteRequestsUsers> getByRequestCodeAndNotify(
            String requestCode, boolean notify) {
        return favoriteRequestUsersRepository.findByFavoriteRequestRequestCodeAndNotify(
                requestCode, notify);
    }
}
