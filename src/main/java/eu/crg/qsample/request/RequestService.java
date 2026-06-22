package eu.crg.qsample.request;

import com.google.gson.Gson;
import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

  @Autowired RequestFileRepository requestFileRepository;

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
      String lastProcessedFileDate = getLastProcessedFileDate(req.getRequestCode());

      miniRequestList.add(
          newMiniRequestWithLastProcessedFileDate(
              new MiniRequest(
                  req.getId(),
                  req.getApplication().getName(),
                  req.getCreator(),
                  req.getCreator(),
                  req.getCreationDate().toString().split("\\.")[0],
                  req.getStatus(),
                  req.getRequestCode(),
                  lastProcessedFileDate != null,
                  true),
              lastProcessedFileDate));
    }

    return miniRequestList;
  }

  private List<MiniRequest> getAllAgendo(boolean showAll, Date startDate, Date endDate) {
    List<MiniRequest> miniRequests = new ArrayList<>();
    String ccc =
        restService.getAllRequests(
            convertDateToAgendoFormat(startDate), convertDateToAgendoFormat(endDate));

    Gson gson = new Gson();
    AgendoRequestWrapper response = gson.fromJson(ccc, AgendoRequestWrapper.class);

    List<String> requestCodes = new ArrayList<>();
    for (AgendoRequest agendoRequest : response.getRequest()) {
      requestCodes.add(agendoRequest.getRef());
    }

    Map<String, String> lastProcessedFileDates = getLastProcessedFileDates(requestCodes);

    for (AgendoRequest agendoRequest : response.getRequest()) {
      String requestCode = agendoRequest.getRef();
      String lastProcessedFileDate = lastProcessedFileDates.get(requestCode);
      boolean hasData = lastProcessedFileDate != null;

      if (!showAll) {
        String action = agendoRequest.getLast_action().getAction();

        boolean shouldShow =
            hasData
                || (!action.equals("Rejected")
                    && !action.equals("Completed")
                    && !action.equals("Created")
                    && !action.equals("Cancelled")
                    && !action.equals("Created as draft"));

        if (shouldShow) {
          miniRequests.add(
              newMiniRequestWithLastProcessedFileDate(
                  new MiniRequest(
                      agendoRequest.getId(),
                      agendoRequest.getClasss(),
                      agendoRequest.getCreated_by().getEmail(),
                      agendoRequest.getCreated_by().getName(),
                      agendoRequest.getdate_created(),
                      agendoRequest.getLast_action().getAction(),
                      requestCode,
                      hasData,
                      false),
                  lastProcessedFileDate));
        }
      } else {
        miniRequests.add(
            newMiniRequestWithLastProcessedFileDate(
                new MiniRequest(
                    agendoRequest.getId(),
                    agendoRequest.getClasss(),
                    agendoRequest.getCreated_by().getEmail(),
                    agendoRequest.getCreated_by().getName(),
                    agendoRequest.getdate_created(),
                    agendoRequest.getLast_action().getAction(),
                    requestCode,
                    hasData,
                    false),
                lastProcessedFileDate));
      }
    }

    return miniRequests;
  }

  private Map<String, String> getLastProcessedFileDates(List<String> requestCodes) {
    Map<String, String> lastProcessedFileDates = new HashMap<>();

    if (requestCodes == null || requestCodes.isEmpty()) {
      return lastProcessedFileDates;
    }

    for (Object[] row : requestFileRepository.findLastProcessedFileDatesByRequestCodeIn(requestCodes)) {
      if (row[0] != null && row[1] != null) {
        lastProcessedFileDates.put(String.valueOf(row[0]), formatDate(row[1]));
      }
    }

    return lastProcessedFileDates;
  }

  private String getLastProcessedFileDate(String requestCode) {
    if (requestCode == null || requestCode.trim().isEmpty()) {
      return null;
    }

    return requestFileRepository
        .findFirstByRequestCodeContainsOrderByCreationDateDesc(requestCode)
        .map(RequestFile::getCreationDate)
        .map(this::formatDate)
        .orElse(null);
  }

  private String formatDate(Object date) {
    return date.toString().split("\\.", 2)[0];
  }

  private MiniRequest newMiniRequestWithLastProcessedFileDate(
      MiniRequest miniRequest, String lastProcessedFileDate) {
    miniRequest.setLastProcessedFileDate(lastProcessedFileDate);
    return miniRequest;
  }

  private String convertDateToAgendoFormat(Date date) {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    return sdf.format(date);
  }

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
      agendoRequest.setSamplesViaString(requestOpt.get().getSamples());
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

    List<String> requestCodes = new ArrayList<>();
    for (AgendoRequest agendoRequest : response.getRequest()) {
      requestCodes.add(agendoRequest.getRef());
    }

    Map<String, String> lastProcessedFileDates = getLastProcessedFileDates(requestCodes);

    for (AgendoRequest agendoRequest : response.getRequest()) {
      String requestCode = agendoRequest.getRef();
      String lastProcessedFileDate = lastProcessedFileDates.get(requestCode);
      boolean hasData = lastProcessedFileDate != null;

      miniRequests.add(
          newMiniRequestWithLastProcessedFileDate(
              new MiniRequest(
                  agendoRequest.getId(),
                  agendoRequest.getClasss(),
                  agendoRequest.getCreated_by().getEmail(),
                  agendoRequest.getCreated_by().getName(),
                  agendoRequest.getdate_created(),
                  agendoRequest.getLast_action().getAction(),
                  requestCode,
                  hasData,
                  false),
              lastProcessedFileDate));
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