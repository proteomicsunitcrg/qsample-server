package eu.crg.qsample.qgenerator.wetlab_category;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;

@RestController
@RequestMapping("/api/wetlab_category")
public class WetlabCategoryController {

  @Autowired WetlabCategoryService wetlab_categoryService;

  @GetMapping
  @PreAuthorize("hasRole('INTERNAL')")
  public List<WetlabCategory> getAll() {
    return wetlab_categoryService.getAll();
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasRole('INTERNAL')")
  public WetlabCategory getById(@PathVariable Long id) {
    return wetlab_categoryService.getById(id);
  }

  @GetMapping("name/{name}")
  @PreAuthorize("hasRole('USER')")
  public WetlabCategory getByName(@PathVariable String name) {
    return wetlab_categoryService.getByName(name);
  }
}
