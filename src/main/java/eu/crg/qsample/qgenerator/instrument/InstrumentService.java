package eu.crg.qsample.qgenerator.instrument;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.qgenerator.injections_conditions.InjectionConditions;
import eu.crg.qsample.qgenerator.instrument.Instrument;

@Service
public class InstrumentService {

    @Autowired
    InstrumentRepository instrumentRepo;

    public List<Instrument> getAll() {
        List<Instrument> instruments = new ArrayList<>();
        instrumentRepo.findAll().forEach(instruments::add);
        return instruments;
    }

    public Instrument getById(Long id) {
        return instrumentRepo.findById(id).get();
    }

    public Instrument save(Instrument instrument) {
        return instrumentRepo.save(instrument);
    }

    public boolean delete(Long id) {
        try {
            instrumentRepo.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
