package eu.crg.qsample.qgenerator.injections_conditions;

import eu.crg.qsample.qgenerator.instrument.InstrumentRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InjectionConditionsQCService {

  @Autowired InjectionConditionsQCRepository injCondQCRepo;

  @Autowired InstrumentRepository instrumentRepo;

  public InjectionConditionsQC getByInstrumentIdAndQCType(Long instrumentId, String qcType) {
    Optional<InjectionConditionsQC> opt =
        injCondQCRepo.findByInstrumentIdAndQctype(instrumentId, qcType);
    if (opt.isPresent()) {
      return opt.get();
    } else {
      return null;
    }
  }

  public InjectionConditionsQC save(InjectionConditionsQC injCondQC) {
    injCondQC.setInstrument(instrumentRepo.findById(injCondQC.getInstrument().getId()).get());
    return injCondQCRepo.save(injCondQC);
  }

  public boolean delete(Long injectionConditionId) {
    InjectionConditionsQC injCond = injCondQCRepo.findById(injectionConditionId).get();
    injCond.setInstrument(null);
    try {
      injCondQCRepo.deleteById(injectionConditionId);
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  public List<InjectionConditionsQC> getByInstrumentId(Long instrumentId) {
    return injCondQCRepo.findByInstrumentId(instrumentId);
  }
}
