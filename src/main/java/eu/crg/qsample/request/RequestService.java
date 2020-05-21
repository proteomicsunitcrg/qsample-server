package eu.crg.qsample.request;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import eu.crg.qsample.restservice.RestService;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.UserRepository;

@Service
public class RequestService {

    @Autowired
    RestService restService;

    @Autowired
    UserRepository userRepo;

	public ResponseEntity<String> getAll() {
        List<Request> allRequests = new ArrayList<>();
        ResponseEntity<String> res = restService.getAllRequests();
        if (res.getStatusCode().is2xxSuccessful()) {
            return res;
        }
        return res;
	}

}
