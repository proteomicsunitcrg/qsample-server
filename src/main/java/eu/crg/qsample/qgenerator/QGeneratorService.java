package eu.crg.qsample.qgenerator;

import eu.crg.qsample.qgenerator.application.ApplicationRepository;
import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;
import eu.crg.qsample.qgenerator.instrument.InstrumentRepository;
import eu.crg.qsample.qgenerator.method.Method;
import eu.crg.qsample.qgenerator.method.MethodRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QGeneratorService {

  @Autowired InjectionConditionsRepository injCondRepository;

  @Autowired ApplicationRepository appRepo;

  @Autowired InstrumentRepository instrumentRepo;

  @Autowired MethodRepository methodRepo;

  public List<Instrument> getInstrumentsByAppName(String appName) {
    List<Instrument> instruments = new ArrayList<>();
    Optional<List<InjectionConditions>> injCondOpt =
        injCondRepository.findByApplicationName(appName);
    if (injCondOpt.isPresent()) {
      for (InjectionConditions injCond : injCondOpt.get()) {
        instruments.add(injCond.getInstrument());
      }
    }
    return instruments;
  }

  public InjectionConditions getMethodsByAppIdAndInstrumentId(Long appId, Long instrumentId) {
    Optional<InjectionConditions> injCondOpt =
        injCondRepository.findByApplicationIdAndInstrumentId(appId, instrumentId);
    if (injCondOpt.isPresent()) {
      return injCondOpt.get();
    } else {
      return null;
    }
  }

  public InjectionConditions saveInjectionConditions(InjectionConditions condition) {
    List<Method> methods = new ArrayList<>();
    condition.setApplication(appRepo.findById(condition.getApplication().getId()).get());
    condition.setInstrument(instrumentRepo.findById(condition.getInstrument().getId()).get());
    for (Method m : condition.getMethods()) {
      methods.add(methodRepo.findById(m.getId()).get());
    }
    condition.setMethod(methods);
    return injCondRepository.save(condition);
  }

  public boolean deleteInjectionCondition(Long id) {
    InjectionConditions injCond = injCondRepository.findById(id).get();
    injCond.setApplication(null);
    injCond.setInstrument(null);
    try {
      injCondRepository.deleteById(id);
      return true;
    } catch (Exception e) {
      return false;
    }
  }
}
