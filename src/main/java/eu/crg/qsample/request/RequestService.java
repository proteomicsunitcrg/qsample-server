package eu.crg.qsample.request;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.google.gson.Gson;

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

	public List<MiniRequest> getAll() {
        List <MiniRequest> miniRequests = new ArrayList<>();
        String ccc = restService.getAllRequests();
        Gson gson = new Gson();
        AgendoRequestWrapper response = gson.fromJson(ccc, AgendoRequestWrapper.class);
        for(AgendoRequest agendoRequest: response.getRequest()) {
            miniRequests.add(new MiniRequest(agendoRequest.getId(), agendoRequest.getClasss(), agendoRequest.getCreated_by().getEmail(), agendoRequest.getdate_created(), agendoRequest.getLast_action().getAction()));
        }
        return miniRequests;
	}

}
