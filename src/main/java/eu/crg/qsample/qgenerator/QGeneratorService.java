package eu.crg.qsample.qgenerator;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;

@Service
public class QGeneratorService {

    @Autowired
    InjectionConditionsRepository injCondRepository;

    public List<Instrument> getInstruentsByAppName(String appName) {
        List<Instrument> instruments = new ArrayList<>();
        Optional<List<InjectionConditions>> injCondOpt = injCondRepository.findByApplicationName(appName);
        if (injCondOpt.isPresent()) {
            for (InjectionConditions injCond : injCondOpt.get()) {
                instruments.add(injCond.getInstrument());
            }
        }
        return instruments;
    }

    public InjectionConditions getMethodsByAppNameAndInstrumentId(String appName, Long instrumentId) {
        Optional<InjectionConditions> injCondOpt =  injCondRepository.findByApplicationNameAndInstrumentId(appName, instrumentId);
        return injCondOpt.get();
    }

}
