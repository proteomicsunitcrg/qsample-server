package eu.crg.qsample.qgenerator.qctype;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QCtypeService {

  @Autowired QCtypeRepository qctypeRepo;

  public List<QCtype> getAll() {
    List<QCtype> qctypes = new ArrayList<>();
    qctypeRepo.findAll().forEach(qctypes::add);
    return qctypes;
  }

  public QCtype getById(Long id) {
    return qctypeRepo.findById(id).get();
  }

  public QCtype save(QCtype qctype) {
    return qctypeRepo.save(qctype);
  }

  public boolean delete(Long id) {
    try {
      qctypeRepo.deleteById(id);
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  public QCtype getByName(String name) {
    return qctypeRepo.findOneByName(name);
  }
}
