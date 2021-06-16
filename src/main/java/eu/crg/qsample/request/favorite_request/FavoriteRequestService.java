package eu.crg.qsample.request.favorite_request;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.UserRepository;

@Service
public class FavoriteRequestService {

    @Autowired
    FavoriteRequestRepository favoriteRequestRepository;

    @Autowired
    UserRepository userRepository;

    public FavoriteRequest save(FavoriteRequest favoriteRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional <FavoriteRequest> favrequest = favoriteRequestRepository.findOneByAgendoId(favoriteRequest.getAgendoId());
        if (favrequest.isPresent()) {
            List<User> users = favrequest.get().getUsers();
            users.add(u);
            favrequest.get().setUsers(users);
            favoriteRequestRepository.save(favrequest.get());
            return favrequest.get();
        } else {
            List<User> users = new ArrayList<>();
            users.add(u);
            FavoriteRequest newRequest = new FavoriteRequest();
            newRequest.setAgendoId(favoriteRequest.getAgendoId());
            newRequest.setRequestCode(favoriteRequest.getRequestCode());
            newRequest.setUsers(users);
            favoriteRequestRepository.save(newRequest);
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
        Optional <FavoriteRequest> optReq = favoriteRequestRepository.findOneByAgendoIdAndUsers(agendoId, u);
        if (optReq.isPresent()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean removeFav(FavoriteRequest favRequest) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByUsername(authentication.getName()).get();
        Optional <FavoriteRequest> toDelete = favoriteRequestRepository.findOneByAgendoIdAndUsers(favRequest.getAgendoId(), u);
        if (toDelete.isPresent()) {
                toDelete.get().getUsers().remove(u);
                if (toDelete.get().getUsers().size() == 0) {
                    favoriteRequestRepository.delete(toDelete.get());
                } else {
                    favoriteRequestRepository.save(toDelete.get());
                }
                return true;
            } else {
                    return false;
                }
            }
        }