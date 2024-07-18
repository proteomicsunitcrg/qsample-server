package eu.crg.qsample.guideset;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.Data;
import eu.crg.qsample.data.DataRepository;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.threshold.Threshold;
import eu.crg.qsample.threshold.params.ThresholdParams;
import eu.crg.qsample.threshold.params.ThresholdParamsId;
import eu.crg.qsample.threshold.params.ThresholdParamsRepository;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;
import eu.crg.qsample.threshold.*;


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

    @Autowired
    ThresholdRepository thresholdRepository;

    @Autowired
    ThresholdParamsRepository thresholdParamsRepository;

    public GuideSet setGuideset(UUID wetlabApiKey, List<WetLabFile> files) {
        HashMap<ContextSource, List<Float>> hash = new HashMap<ContextSource, List<Float>>();
        Optional<WetLab> wetlabOpt = wetlabRepo.findOneByApiKey(wetlabApiKey);
        if (wetlabOpt.isPresent()) {
            GuideSet guideSet = new GuideSet(null, UUID.randomUUID(), files);
            guideSetRepo.save(guideSet);
            wetlabOpt.get().setGuideSet(guideSet);
            wetlabRepo.save(wetlabOpt.get());

            List<Param> parameters = paramRepo.findAll();
            for (Param param: parameters) {
                List<Data> filesData = dataRepo.findByFileInAndParam(files, param);
                Threshold thres = new Threshold(null, UUID.randomUUID(), Direction.UP, param, wetlabOpt.get(), 3);
                for (Data data: filesData) {
                    if(hash.containsKey(data.getContextSource())) {
                        hash.get(data.getContextSource()).add(data.getCalculatedValue());
                    } else {
                        List<Float> listerino = new ArrayList<Float>();
                        listerino.add(data.getCalculatedValue());
                        hash.put(data.getContextSource(),listerino);
                    }
                }
                thresholdRepository.save(thres);
                thres = thresholdRepository.findOneByParamAndWetLab(param, wetlabOpt.get()).get();
                for(Map.Entry<ContextSource, List<Float>> entry: hash.entrySet()) {
                    thresholdParamsRepository.save(new ThresholdParams(new ThresholdParamsId(thres.getId(), entry.getKey().getId()), getSTD(entry.getValue()), getAverage(entry.getValue()), entry.getKey(), true));
                }
            }
            // System.out.println(hash.toString());


            return guideSet;
        } else {
            return null;
        }
    }
    // TODO remove this
    public Float getAverage(List<Float> list) {
        Float d = (float)list.stream().mapToDouble(a -> a).average().orElse(0.0);
        return d;
    }

    public Float getSTD(List<Float> list) {
        Float mean = getAverage(list);
        double temp = 0;
        for (Float val: list) {
            temp += Math.pow(val - mean, 2);
        }
        Float meanOfDiffs = (float) temp / (float)list.size();
        return (float)Math.sqrt(meanOfDiffs);
    }

    public GuideSet getGuidesetByWetlabApiKey(UUID wetlabApiKey) {
        Optional<WetLab> wetlab = wetlabRepo.findOneByApiKey(wetlabApiKey);
        return wetlab.get().getGuideSet();
    }

    public boolean deleteGuideset(GuideSet guideSet) {
        Optional<WetLab> wetlab = wetlabRepo.findOneByGuideSetId(guideSet.getId());
        wetlab.get().setGuideSet(null);
        guideSetRepo.deleteById(guideSet.getId());
        Optional <List<Threshold>> wetLabThresh = thresholdRepository.findByWetLab(wetlab.get());
        if (wetLabThresh.isPresent()) {
            for (Threshold thres: wetLabThresh.get()) {
                thresholdParamsRepository.deleteAll(thres.getThresholdParams());
                thresholdRepository.delete(thres);
            }
        }
        return true;
    }

}
