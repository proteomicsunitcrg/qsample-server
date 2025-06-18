package eu.crg.qsample.qgenerator;

import eu.crg.qsample.qgenerator.application.Application;
import eu.crg.qsample.qgenerator.application.ApplicationRepository;
import eu.crg.qsample.qgenerator.application.instruments.ApplicationInstrumentsRepository;
import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditionsQC;
import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditionsQCRepository;
import eu.crg.qsample.qgenerator.instrument.Instrument;
import eu.crg.qsample.qgenerator.instrument.InstrumentRepository;
import eu.crg.qsample.qgenerator.method.MethodRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QGeneratorService {

  // @Autowired InjectionConditionsRepository injCondRepository;

  @Autowired ApplicationRepository appRepo;

  @Autowired InstrumentRepository instrumentRepo;

  @Autowired MethodRepository methodRepo;

  @Autowired ApplicationInstrumentsRepository appInstrumentsRepo;

  @Autowired InjectionConditionsQCRepository injCondRepository;

  public List<Instrument> getInstrumentsByAppName(String appName) {

    Application application = appRepo.findOneByName(appName);

    // Fetch instrument IDs associated with the application
    List<Instrument> instruments = appInstrumentsRepo.findInstrumentsByApplication(application);

    return instruments;
  }

  public List<InjectionConditionsQC> getMethodsByInstrumentId(Long instrumentId) {
    List<InjectionConditionsQC> injCondsQC = injCondRepository.findByInstrumentId(instrumentId);

    return injCondsQC;
  }

  // public InjectionConditions saveInjectionConditions(InjectionConditions condition) {
  //   List<Method> methods = new ArrayList<>();
  //   condition.setApplication(appRepo.findById(condition.getApplication().getId()).get());
  //   condition.setInstrument(instrumentRepo.findById(condition.getInstrument().getId()).get());
  //   for (Method m : condition.getMethods()) {
  //     methods.add(methodRepo.findById(m.getId()).get());
  //   }
  //   condition.setMethod(methods);
  //   return injCondRepository.save(condition);
  // }

  // public boolean deleteInjectionCondition(Long id) {
  //   InjectionConditions injCond = injCondRepository.findById(id).get();
  //   injCond.setApplication(null);
  //   injCond.setInstrument(null);
  //   try {
  //     injCondRepository.deleteById(id);
  //     return true;
  //   } catch (Exception e) {
  //     return false;
  //   }
  // }
}
