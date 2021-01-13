package eu.crg.qsample.qgenerator.method;

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

@RestController
@RequestMapping("/api/method")
public class MethodController {


    @Autowired
    MethodService methodService;

    @GetMapping
    @PreAuthorize("hasRole('INTERNAL')")
    public List<Method> getAll() {
        return methodService.getAll();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('INTERNAL')")
    public Method getById(@PathVariable Long id) {
        return methodService.getById(id);
    }

    @PostMapping
    @PreAuthorize("hasRole('MANAGER')")
    public Method save(@RequestBody Method instrument) {
        return methodService.save(instrument);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('MANAGER')")
    public boolean delete(@PathVariable Long id) {
        return methodService.delete(id);
    }

}
