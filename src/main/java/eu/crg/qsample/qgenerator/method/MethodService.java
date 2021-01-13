package eu.crg.qsample.qgenerator.method;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MethodService {

    @Autowired
    MethodRepository methodRepo;

    public List<Method> getAll() {
        List<Method> instruments = new ArrayList<>();
        methodRepo.findAll().forEach(instruments::add);
        return instruments;
    }

    public Method getById(Long id) {
        return methodRepo.findById(id).get();
    }

    public Method save(Method instrument) {
        return methodRepo.save(instrument);
    }

    public boolean delete(Long id) {
        try {
            methodRepo.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
