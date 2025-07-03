package eu.crg.qsample.qgenerator.qctype;

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
@RequestMapping("/api/qctype")
public class QCtypeController {

  @Autowired QCtypeService qctypeService;

  @GetMapping
  @PreAuthorize("hasRole('INTERNAL')")
  public List<QCtype> getAll() {
    return qctypeService.getAll();
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasRole('INTERNAL')")
  public QCtype getById(@PathVariable Long id) {
    return qctypeService.getById(id);
  }

  @GetMapping("name/{name}")
  @PreAuthorize("hasRole('USER')")
  public QCtype getByName(@PathVariable String name) {
    return qctypeService.getByName(name);
  }

  @PostMapping
  @PreAuthorize("hasRole('MANAGER')")
  public QCtype save(@RequestBody QCtype qctype) {
    return qctypeService.save(qctype);
  }

  @DeleteMapping("/{id}")
  @PreAuthorize("hasRole('MANAGER')")
  public boolean delete(@PathVariable Long id) {
    return qctypeService.delete(id);
  }
}
