package eu.crg.qsample.request;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    public List<MiniRequest> getAll(boolean showAll) {
        List<MiniRequest> miniRequests = new ArrayList<>();
        String ccc = restService.getAllRequests();
        Gson gson = new Gson();
        AgendoRequestWrapper response = gson.fromJson(ccc, AgendoRequestWrapper.class);
        for (AgendoRequest agendoRequest : response.getRequest()) {
            if (!showAll) {
                if (!agendoRequest.getLast_action().getAction().equals("Rejected")
                        && !agendoRequest.getLast_action().getAction().equals("Completed")
                        && !agendoRequest.getLast_action().getAction().equals("Created")
                        && !agendoRequest.getLast_action().getAction().equals("Cancelled")
                        && !agendoRequest.getLast_action().getAction().equals("Created as draft")) {
                    miniRequests.add(new MiniRequest(agendoRequest.getId(), agendoRequest.getClasss(),
                            agendoRequest.getCreated_by().getEmail(), agendoRequest.getCreated_by().getName(),agendoRequest.getdate_created(),
                            agendoRequest.getLast_action().getAction(), getRequestCode(agendoRequest.getFields().get(agendoRequest.getFields().size()-1).getValue())));
                }
            } else {
                miniRequests.add(new MiniRequest(agendoRequest.getId(), agendoRequest.getClasss(),
                            agendoRequest.getCreated_by().getEmail(), agendoRequest.getCreated_by().getName(), agendoRequest.getdate_created(),
                            agendoRequest.getLast_action().getAction(), getRequestCode(agendoRequest.getFields().get(agendoRequest.getFields().size()-1).getValue())));
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

    public AgendoRequest getRequestById(Long id) {
        Gson gson = new Gson();
        AgendoRequestWrapperOneRequest wrapper = gson.fromJson(restService.getRequestById(id),
                AgendoRequestWrapperOneRequest.class);
        return wrapper.getRequest();
    }

    public String getPlotName(Long csId, Long paramId) {
        Optional<Param> param = paramRepo.findById(paramId);
        Optional<ContextSource> cs = csRepo.findById(csId);
        if (cs.isPresent() && param.isPresent()) {
            return cs.get().getName();
        } else {
            return "Error getting the name";
        }
    }

    public List<MiniRequest> getAllExternal() {
        Long userId = getUserFromSecurityContext().getAgendoId();
        List<MiniRequest> miniRequests = new ArrayList<>();
        String ccc = restService.getAllRequestsExternal(userId);
        Gson gson = new Gson();
        AgendoRequestWrapper response = gson.fromJson(ccc, AgendoRequestWrapper.class);
        for (AgendoRequest agendoRequest : response.getRequest()) {
            miniRequests.add(new MiniRequest(agendoRequest.getId(), agendoRequest.getClasss(),
                    agendoRequest.getCreated_by().getEmail(), agendoRequest.getCreated_by().getName(), agendoRequest.getdate_created(),
                    agendoRequest.getLast_action().getAction()));
        }
        return miniRequests;
    }

    private User getUserFromSecurityContext() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepo.findByUsername(authentication.getName()).get();
        return u;
    }

}
