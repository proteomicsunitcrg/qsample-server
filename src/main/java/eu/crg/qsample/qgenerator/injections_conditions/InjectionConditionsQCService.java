package eu.crg.qsample.qgenerator.injections_conditions;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InjectionConditionsQCService {

    @Autowired InjectionConditionsQCRepository injCondQCRepo;

    public List<InjectionConditionsQC> getByInstrumentIdAndQCType(Long instrumentId, String qcType) {
        Optional<List<InjectionConditionsQC>> optList = injCondQCRepo.findByInstrumentIdAndQCtype(instrumentId, qcType);
        if (optList.isPresent()) {
            return optList.get();
        } else {
            return null;
        }
    }
}
