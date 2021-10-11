package eu.crg.qsample.modification;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;

@Service
public class ModificationService {

    @Autowired
    RequestFileRepository fileRepo;

    @Autowired
    ModificationRepository modRepo;

    @Autowired
    ModificationFileRepository modFileRepo;
    // { "modification": { "name": "Label:13C(6)15N(4) (R)" }, "value": "13838" }

    public void insertModificationsFromPipeline(ModificationFromPipeline modificationFromPipeline) {
        Optional <RequestFile> rFileOpt = fileRepo.findOneByChecksum(modificationFromPipeline.getFile().getChecksum());
        if (!rFileOpt.isPresent()) {
            throw new DataRetrievalFailureException("File not found");
        }
        for (ModificationFile mod: modificationFromPipeline.getData()) {
            if (mod.getModification().getType() == null) {
                mod.getModification().setType("total-numbers");
            }
            Optional <Modification> modOpt = modRepo.findOneByName(mod.getModification().getName());
            ModificationFile modFile = new ModificationFile();
            if (modOpt.isPresent()) { // mod already at BD, use existing entity
                modFile.setModification(modOpt.get());
            }
                else { // mod not at DB, save and use it
                Modification saved = modRepo.save(mod.getModification());
                modFile.setModification(saved);
            }
            Optional <ModificationFile> modFileOpt = modFileRepo.findOneByFileAndModification(rFileOpt.get(), modFile.getModification());
            if (!modFileOpt.isPresent()) {
                modFile.setFile(rFileOpt.get());
                modFile.setValue(mod.getValue());
                modFileRepo.save(modFile);
            } else {
                modFileOpt.get().setValue(mod.getValue());
                modFileRepo.save(modFileOpt.get());
            }
        }
    }
}
