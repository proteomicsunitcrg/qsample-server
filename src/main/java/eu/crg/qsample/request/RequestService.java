package eu.crg.qsample.request;

import com.google.gson.Gson;
import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.request.local.RequestLocal;
import eu.crg.qsample.request.local.RequestRepository;
import eu.crg.qsample.restservice.RestService;
import eu.crg.qsample.security.model.User;
import eu.crg.qsample.security.repository.UserRepository;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.ws.rs.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class RequestService {

  @Autowired RestService restService;

  @Autowired UserRepository userRepo;

  @Autowired ContextSourceRepository csRepo;

  @Autowired ParamRepository paramRepo;

  @Autowired FileRepository fileRepository;

  @Autowired RequestRepository requestRepository;

  @Value("${local-requests}")
  boolean localRequests;

  @Value("${qcloud2.disable}")
  boolean disableQCloudFiles;

  public List<MiniRequest> getAll(boolean showAll, Date startDate, Date endDate) {
    if (localRequests) {
      return getAllLocal(showAll, startDate, endDate);
    } else {
      return getAllAgendo(showAll, startDate, endDate);
    }
  }

  private List<MiniRequest> getAllLocal(boolean showAll, Date startDate, Date endDate) {
    List<RequestLocal> requestList =
        requestRepository.findAllByCreationDateBetween(startDate, endDate);
    List<MiniRequest> miniRequestList = new ArrayList<>();
    for (RequestLocal req : requestList) {
      // System.out.println(req.getRequestCode());
      // Format string and remove dots of create_date
      miniRequestList.add(
          new MiniRequest(
              req.getId(),
              req.getApplication().getName(),
              req.getCreator(),
              req.getCreator(),
              req.getCreationDate().toString().split("\\.")[0],
              req.getStatus(),
              req.getRequestCode(),
              false,
              true));
    }
    return miniRequestList;
  }

  private List<MiniRequest> getAllAgendo(boolean showAll, Date startDate, Date endDate) {
    List<MiniRequest> miniRequests = new ArrayList<>();
    String ccc =
        restService.getAllRequests(
            convertDateToAgendoFormat(startDate), convertDateToAgendoFormat(endDate));
    System.out.println(ccc);
    Gson gson = new Gson();
    AgendoRequestWrapper response = gson.fromJson(ccc, AgendoRequestWrapper.class);
    for (AgendoRequest agendoRequest : response.getRequest()) {

      // String requestCode = getRequestCode(
      //         agendoRequest.getFields().get(agendoRequest.getFields().size() - 1).getValue());
      String requestCode = agendoRequest.getRef(); // Get requestCode from ref field
      System.out.println("REQUEST CODE:");
      System.out.println(requestCode);
      boolean hasData = false;
      if (!showAll) {
        if (!agendoRequest.getLast_action().getAction().equals("Rejected")
            && !agendoRequest.getLast_action().getAction().equals("Completed")
            && !agendoRequest.getLast_action().getAction().equals("Created")
            && !agendoRequest.getLast_action().getAction().equals("Cancelled")
            && !agendoRequest.getLast_action().getAction().equals("Created as draft")) {
          miniRequests.add(
              new MiniRequest(
                  agendoRequest.getId(),
                  agendoRequest.getClasss(),
                  agendoRequest.getCreated_by().getEmail(),
                  agendoRequest.getCreated_by().getName(),
                  agendoRequest.getdate_created(),
                  agendoRequest.getLast_action().getAction(),
                  requestCode,
                  hasData,
                  false));
        }
      } else {
        miniRequests.add(
            new MiniRequest(
                agendoRequest.getId(),
                agendoRequest.getClasss(),
                agendoRequest.getCreated_by().getEmail(),
                agendoRequest.getCreated_by().getName(),
                agendoRequest.getdate_created(),
                agendoRequest.getLast_action().getAction(),
                requestCode,
                hasData,
                false));
      }
    }
    return miniRequests;
  }

  private String convertDateToAgendoFormat(Date date) {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    return sdf.format(date);
  }

  // TODO THIS
  // private String getRequestCode(String mierda) {
  //     try {
  //         Gson gson = new Gson();
  //         AgendoFieldWrapper[] fielderinos = gson.fromJson(mierda, AgendoFieldWrapper[].class);
  //         List<AgendoFieldWrapper> wrapper = Arrays.asList(fielderinos);
  //         return wrapper.get(0).getFields().get(0).getValue();
  //     } catch (Exception e) {
  //         return mierda;
  //     }
  // }

  public AgendoRequest getRequestById(Long id) {
    if (localRequests) {
      return getRequestByIdLocal(id);
    } else {
      return getRequestByIdAgendo(id);
    }
  }

  public RequestLocal getRequestByCode(String requestCode) {
    if (localRequests) {
      return getLocalRequestByRequestCode(requestCode);
    } else {
      // TODO: We should preload all agendo Requests and then retrieve the one we want
      // If client already detected one in cache, we would not need it anymore
      return null;
    }
  }

  private AgendoRequest getRequestByIdLocal(Long id) {
    Optional<RequestLocal> requestOpt = requestRepository.findById(id);
    if (requestOpt.isPresent()) {
      String emptyRef = "";
      AgendoRequest agendoRequest =
          new AgendoRequest(
              requestOpt.get().getId(),
              emptyRef,
              requestOpt.get().getGroup(),
              requestOpt.get().getApplication().getName(),
              requestOpt.get().getCreationDate().toString(),
              requestOpt.get().getStatus());
      agendoRequest.setLocalCode(requestOpt.get().getRequestCode());
      agendoRequest.setLocalCreationDate(requestOpt.get().getCreationDate().toString());
      agendoRequest.setLocalCreator(requestOpt.get().getCreator());
      agendoRequest.setSamplesViaString(
          requestOpt.get().getSamples()); // TODO: Here we have confronting types
      agendoRequest.setLocalTaxonomy(requestOpt.get().getTaxonomy());
      return agendoRequest;
    } else {
      throw new NotFoundException("Request not found by id");
    }
  }

  private AgendoRequest getRequestByIdAgendo(Long id) {
    Gson gson = new Gson();
    AgendoRequestWrapperOneRequest wrapper =
        gson.fromJson(restService.getRequestById(id), AgendoRequestWrapperOneRequest.class);
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
      miniRequests.add(
          new MiniRequest(
              agendoRequest.getId(),
              agendoRequest.getClasss(),
              agendoRequest.getCreated_by().getEmail(),
              agendoRequest.getCreated_by().getName(),
              agendoRequest.getdate_created(),
              agendoRequest.getLast_action().getAction()));
    }
    return miniRequests;
  }

  private User getUserFromSecurityContext() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User u = userRepo.findByUsername(authentication.getName()).get();
    return u;
  }

  public boolean isQCloud2FilesEnabled() {
    return disableQCloudFiles;
  }

  public RequestLocal getLocalRequestById(Long id) {
    Optional<RequestLocal> localOpt = requestRepository.findById(id);
    if (localOpt.isPresent()) {
      return localOpt.get();
    } else {
      throw new NotFoundException("Request not found by id");
    }
  }

  public RequestLocal getLocalRequestByRequestCode(String requestCode) {
    Optional<RequestLocal> localOpt = requestRepository.findByRequestCode(requestCode);
    if (localOpt.isPresent()) {
      return localOpt.get();
    } else {
      throw new NotFoundException("Request not found by Request Code");
    }
  }

  public RequestLocal saveLocal(RequestLocal localRequest) {
    return requestRepository.save(localRequest);
  }

  public boolean deleteLocal(Long localRequestId) {
    try {
      requestRepository.deleteById(localRequestId);
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  public boolean isLocalMode() {
    return localRequests;
  }
}
