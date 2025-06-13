package eu.crg.qsample.qgenerator.instrument;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;

@RestController
@RequestMapping("/api/instrument")
public class InstrumentController {

  @Autowired InstrumentService instrumentService;

  @GetMapping
  @PreAuthorize("hasRole('INTERNAL')")
  public List<Instrument> getAll() {
    return instrumentService.getAll();
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasRole('INTERNAL')")
  public Instrument getById(@PathVariable Long id) {
    return instrumentService.getById(id);
  }

  @PostMapping
  @PreAuthorize("hasRole('MANAGER')")
  public Instrument save(@RequestBody Instrument instrument) {
    return instrumentService.save(instrument);
  }

  @DeleteMapping("/{id}")
  @PreAuthorize("hasRole('MANAGER')")
  public boolean delete(@PathVariable Long id) {
    return instrumentService.delete(id);
  }
}
