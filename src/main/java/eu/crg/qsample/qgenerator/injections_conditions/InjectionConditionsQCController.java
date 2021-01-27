package eu.crg.qsample.qgenerator.injections_conditions;

import java.util.List;
import java.util.UUID;

import javax.ws.rs.Path;

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
@RequestMapping("/api/injectionConditionsQC")
public class InjectionConditionsQCController {

    @Autowired InjectionConditionsQCService injCondServ;

    @GetMapping("/getByInstrumentIdAndQCType/{instrumentId}/{qcType}")
    @PreAuthorize("hasRole('MANAGER')")
    public InjectionConditionsQC getByInstrumentIdAndQCType(@PathVariable Long instrumentId, @PathVariable String qcType) {
        return injCondServ.getByInstrumentIdAndQCType(instrumentId, qcType);
    }

    @PostMapping("")
    @PreAuthorize("hasRole('MANAGER')")
    public InjectionConditionsQC save(@RequestBody InjectionConditionsQC injCondQC) {
        return injCondServ.save(injCondQC);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('MANAGER')")
    public boolean delete(@PathVariable(name = "id") Long injectionConditionId) {
        return injCondServ.delete(injectionConditionId);
    }
}
