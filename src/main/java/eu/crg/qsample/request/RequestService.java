package eu.crg.qsample.request;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import eu.crg.qsample.restservice.RestService;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.UserRepository;
import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.request.AgendoRequestWrapperOneRequest;

@Service
public class RequestService {

    @Autowired
    RestService restService;

    @Autowired
    UserRepository userRepo;

    @Autowired
    ContextSourceRepository csRepo;

    @Autowired
    ParamRepository paramRepo;

    public List<MiniRequest> getAll() {
        List<MiniRequest> miniRequests = new ArrayList<>();
        String ccc = restService.getAllRequests();
        Gson gson = new Gson();
        AgendoRequestWrapper response = gson.fromJson(ccc, AgendoRequestWrapper.class);
        for (AgendoRequest agendoRequest : response.getRequest()) {
            miniRequests.add(new MiniRequest(agendoRequest.getId(), agendoRequest.getClasss(),
                    agendoRequest.getCreated_by().getEmail(), agendoRequest.getdate_created(),
                    agendoRequest.getLast_action().getAction()));
        }
        return miniRequests;
    }

    public AgendoRequest getRequestById(Long id) {
        Gson gson = new Gson();
        AgendoRequestWrapperOneRequest wrapper = gson.fromJson(restService.getRequestById(id),
                AgendoRequestWrapperOneRequest.class);
        return wrapper.getRequest();
    }

    public String getPlotName(Long csId, Long paramId) {
        System.out.println("hola");
        Optional <Param> param = paramRepo.findById(paramId);
        Optional <ContextSource> cs = csRepo.findById(csId);
        if (cs.isPresent() && param.isPresent()) {
            return param.get().getName() + cs.get().getAbbreviated();
        } else {
            return "Error getting the name";
        }
    }

}
