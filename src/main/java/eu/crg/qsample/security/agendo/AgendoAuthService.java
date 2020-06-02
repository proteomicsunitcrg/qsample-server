package eu.crg.qsample.security.agendo;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.server.ResponseStatusException;

import eu.crg.qsample.exceptions.AgendoException;
import eu.crg.qsample.restservice.RestService;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.UserRepository;
import eu.crg.qsample.security.services.UserService;

@Service
public class AgendoAuthService {

    @Autowired
    RestService restService;

    @Autowired
    UserRepository userRepo;

    @Autowired
    UserService userService;




    public boolean agendoAuth(String username, String password) {
        //TODO: Remove the bypass
        // return true;
        return true;
        // try {
        //     ResponseEntity<AgendoAuthResponse> response = restService.loginAgendo(username, password);
        //     if (response.getBody().isSuccess()) {
        //         Optional <User> userOpt =  userRepo.findByAgendoId(response.getBody().getUser().getId());
        //         if (userOpt.isPresent()) {
        //             return true;
        //         } else {
        //             userService.addUserAgendo(username, password, response.getBody().getUser());
        //             return true;
        //         }
        //     } else {
        //         return false;
        //     }
        // } catch (HttpClientErrorException e) {
        //     throw new ResponseStatusException(HttpStatus.I_AM_A_TEAPOT, "Agendo error" + e.getRawStatusCode());
        // }
    }
}