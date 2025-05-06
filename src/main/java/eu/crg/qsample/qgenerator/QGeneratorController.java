package eu.crg.qsample.qgenerator;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.application.ApplicationRepository;
import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/qgenerator")
public class QGeneratorController {

  @Autowired QGeneratorService qGeneratorService;

  @Autowired ApplicationRepository appRepo;

  @GetMapping("/available/{appName}")
  @PreAuthorize("hasRole('INTERNAL')")
  public List<Instrument> getInstruentsByAppName(@PathVariable String appName) {
    return qGeneratorService.getInstruentsByAppName(appName);
  }

  @GetMapping("/getByAppNameAndInstrumentId/{appName}/{instrumentId}")
  @PreAuthorize("hasRole('INTERNAL')")
  public InjectionConditions getMethodsByAppNameAndInstrumentId(
      @PathVariable String appName, @PathVariable Long instrumentId) {

    Application app = appRepo.findOneByName(appName);
    long appId = app.getId();

    return qGeneratorService.getMethodsByAppIdAndInstrumentId(appId, instrumentId);
  }

  @PostMapping
  @PreAuthorize("hasRole('MANAGER')")
  public InjectionConditions saveInjectionConditions(@RequestBody InjectionConditions condition) {
    return qGeneratorService.saveInjectionConditions(condition);
  }

  @DeleteMapping("/{id}")
  @PreAuthorize("hasRole('MANAGER')")
  public boolean deleteInjectionCondition(@PathVariable Long id) {
    return qGeneratorService.deleteInjectionCondition(id);
  }

  @ExceptionHandler(NotFoundException.class)
  void handleNotFoundException(HttpServletResponse response, Exception e) throws IOException {
    response.sendError(HttpStatus.NOT_FOUND.value(), "Nothing found with this parameters");
  }
}
