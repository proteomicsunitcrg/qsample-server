package eu.crg.qsample.guideset;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.DataRepository;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

@Service
public class GuideSetService {
    @Autowired
    WetLabRepository wetlabRepo;

    @Autowired
    FileRepository fileRepository;

    @Autowired
    ParamRepository paramRepo;

    @Autowired
    ContextSourceRepository csRepo;

    @Autowired
    GuideSetRepository guideSetRepo;

    @Autowired
    DataRepository dataRepo;

    public GuideSet setGuideset(UUID wetlabApiKey, List<WetLabFile> files) {
        Optional<WetLab> wetlabOpt = wetlabRepo.findOneByApiKey(wetlabApiKey);
        if (wetlabOpt.isPresent()) {
            GuideSet guideSet = new GuideSet(null, UUID.randomUUID(), files);
            guideSetRepo.save(guideSet);
            wetlabOpt.get().setGuideSet(guideSet);
            wetlabRepo.save(wetlabOpt.get());
            return guideSet;
        } else {
            return null;
        }

    }

    public GuideSet getGuidesetByWetlabApiKey(UUID wetlabApiKey) {
        Optional<WetLab> wetlab = wetlabRepo.findOneByApiKey(wetlabApiKey);
        return wetlab.get().getGuideSet();
    }

    public boolean deleteGuideset(GuideSet guideSet) {
        Optional<WetLab> wetlab = wetlabRepo.findOneByGuideSetId(guideSet.getId());
        wetlab.get().setGuideSet(null);
        guideSetRepo.deleteById(guideSet.getId());
        return true;
    }

}