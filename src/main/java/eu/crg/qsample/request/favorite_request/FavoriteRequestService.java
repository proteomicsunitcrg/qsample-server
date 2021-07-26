package eu.crg.qsample.request.favorite_request;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.request.AgendoFieldWrapper;
import eu.crg.qsample.request.AgendoRequest;
import eu.crg.qsample.request.MiniRequest;
import eu.crg.qsample.request.RequestService;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.UserRepository;

@Service
public class FavoriteRequestService {

    @Autowired
    FavoriteRequestRepository favoriteRequestRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RequestService requestService;

    @Autowired
    FavoriteRequestUsersRepository favoriteRequestUsersRepository;

    public FavoriteRequest save(FavoriteRequest favoriteRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequest> favrequest = favoriteRequestRepository
                .findOneByAgendoId(favoriteRequest.getAgendoId());
        if (favrequest.isPresent()) {
            FavoriteRequestsUsers newRelation = new FavoriteRequestsUsers(null, favrequest.get(), u, false);
            favoriteRequestUsersRepository.save(newRelation);
            return favrequest.get();
        } else {
            FavoriteRequest newRequest = new FavoriteRequest(null, favoriteRequest.getRequestCode(), favoriteRequest.getAgendoId());
            favoriteRequestRepository.save(newRequest);
            FavoriteRequestsUsers newRelation = new FavoriteRequestsUsers(null, newRequest, u, false);
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
        Optional<FavoriteRequestsUsers> optReq = favoriteRequestUsersRepository.findOneByFavoriteRequestAgendoIdAndUser(agendoId, u);
        if (optReq.isPresent()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean removeFav(FavoriteRequest favRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional<FavoriteRequestsUsers> optReq = favoriteRequestUsersRepository.findOneByFavoriteRequestAgendoIdAndUser(favRequest.getAgendoId(), u);
        if (optReq.isPresent()) { // delete the relation
            favoriteRequestUsersRepository.delete(optReq.get());
        } else {
            return false; // if not found means that something is wrong
        }
        Optional <List<FavoriteRequestsUsers>> optCheckLast = favoriteRequestUsersRepository.findByFavoriteRequestAgendoId(favRequest.getAgendoId()); // get all the relations
        if (!optCheckLast.isPresent()) { // if no relations means that the favrequest doesnt have any user
            Optional<FavoriteRequest> favRequestOpt = favoriteRequestRepository.findOneByAgendoId(favRequest.getAgendoId());
            if (favRequestOpt.isPresent()) { // so we find it and then delete it
                favoriteRequestRepository.delete(favRequestOpt.get());
            }
        }
        return true;
    }

    public List<MiniRequest> getFavAgendo() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional <List<FavoriteRequestsUsers>> favListOpt = favoriteRequestUsersRepository.findByAndUser(u);
        List<AgendoRequest> agendoRequests = new ArrayList<>();
        List<MiniRequest> miniRequests = new ArrayList<>();
        if (favListOpt.isPresent()) {
            for (FavoriteRequestsUsers request : favListOpt.get()) {
                agendoRequests.add(requestService.getRequestById(request.getFavoriteRequest().getAgendoId()));
            }
            for (AgendoRequest agendoRequest: agendoRequests) {
                miniRequests.add(new MiniRequest(agendoRequest.getId(), agendoRequest.getClasss(),
                            agendoRequest.getCreated_by().getEmail(), agendoRequest.getCreated_by().getName(), agendoRequest.getdate_created(),
                            agendoRequest.getLast_action().getAction(), getRequestCode(agendoRequest.getFields().get(agendoRequest.getFields().size()-1).getValue()), false));
            }
        }

        return miniRequests;
    }

        // TODO THIS
        private String getRequestCode(String mierda) {
            try {
                Gson gson = new Gson();
                // mierda = mierda.substring(1, mierda.length() - 1);
                AgendoFieldWrapper[] fielderinos = gson.fromJson(mierda, AgendoFieldWrapper[].class);
                List<AgendoFieldWrapper> wrapper = Arrays.asList(fielderinos);
                return wrapper.get(0).getFields().get(0).getValue();
            } catch (Exception e) {
                return mierda;
            }
        }

        public FavoriteRequestsUsers getFavoriteRequestRelationByAgendoId(Long agendoId) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User u = userRepository.findByUsername(authentication.getName()).get();
            Optional<FavoriteRequestsUsers> favRequestOpt = favoriteRequestUsersRepository.findOneByFavoriteRequestAgendoIdAndUser(agendoId, u);
            if (favRequestOpt.isPresent()) {
                return favRequestOpt.get();
            } else {
                return null;
            }
        }

        public FavoriteRequestsUsers setNotify(FavoriteRequest favRequest, boolean action) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User u = userRepository.findByUsername(authentication.getName()).get();
            Optional<FavoriteRequestsUsers> favRequestOpt = favoriteRequestUsersRepository.findOneByFavoriteRequestAgendoIdAndUser(favRequest.getAgendoId(), u);
            if (favRequestOpt.isPresent()) {
                favRequestOpt.get().setNotify(action);
                return favoriteRequestUsersRepository.save(favRequestOpt.get());
            } else {
                throw new NotFoundException("Fav request not found");
            }
        }

        public List <FavoriteRequestsUsers> getByRequestCodeAndNotify(String requestCode, boolean notify) {
            return favoriteRequestUsersRepository.findByFavoriteRequestRequestCodeAndNotify(requestCode, notify);
        }
}