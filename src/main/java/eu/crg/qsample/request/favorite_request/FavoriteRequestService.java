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
            FavoriteRequestsUsers newRelation = new FavoriteRequestsUsers(null, favoriteRequest, u, false);
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
        if (optReq.isPresent()) {
            favoriteRequestUsersRepository.delete(optReq.get());
        }
        // if (toDelete.isPresent()) {
        //     toDelete.get().getUsers().remove(u);
        //     if (toDelete.get().getUsers().size() == 0) {
        //         favoriteRequestRepository.delete(toDelete.get());
        //     } else {
        //         favoriteRequestRepository.save(toDelete.get());
        //     }
        //     return true;
        // } else {
        //     return false;
        // }
    }

    public List<MiniRequest> getFavAgendo() {
        return null;
        // Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // User u = userRepository.findByUsername(authentication.getName()).get();
        // Optional <List<FavoriteRequest>> favListOpt = favoriteRequestRepository.findAllByUsers(u);
        // List<AgendoRequest> agendoRequests = new ArrayList<>();
        // List<MiniRequest> miniRequests = new ArrayList<>();
        // if (favListOpt.isPresent()) {
        //     for (FavoriteRequest request : favListOpt.get()) {
        //         agendoRequests.add(requestService.getRequestById(request.getAgendoId()));
        //     }
        //     for (AgendoRequest agendoRequest: agendoRequests) {
        //         miniRequests.add(new MiniRequest(agendoRequest.getId(), agendoRequest.getClasss(),
        //                     agendoRequest.getCreated_by().getEmail(), agendoRequest.getCreated_by().getName(), agendoRequest.getdate_created(),
        //                     agendoRequest.getLast_action().getAction(), getRequestCode(agendoRequest.getFields().get(agendoRequest.getFields().size()-1).getValue())));
        //     }
        // }

        // return miniRequests;
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
}