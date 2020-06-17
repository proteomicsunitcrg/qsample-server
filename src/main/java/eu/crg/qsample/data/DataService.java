package eu.crg.qsample.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.model.DataFromPipeline;
import eu.crg.qsample.data.model.DataValues;
import eu.crg.qsample.data.model.ParameterData;
import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.file.File;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.plot.PlotRepository;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

@Service
public class DataService {

    @Autowired
    PlotRepository plotRepo;

    @Autowired
    WetLabRepository wetLabRepo;

    @Autowired
    DataRepository dataRepo;

    @Autowired
    FileRepository fileRepo;

    @Autowired
    ParamRepository paramRepo;

    @Autowired
    ContextSourceRepository csRepo;

    public List<PlotTrace> getTraceData(Date startDate, Date endDate, Long plotId, UUID wetLabApiKey) {
        Optional<Plot> plot = plotRepo.findById(plotId);
        Optional<WetLab> wetlab = wetLabRepo.findOneByApiKey(wetLabApiKey);
        List<ContextSource> contextSources = new ArrayList<>();
        List<Data> data = new ArrayList<>();

        TraceHashMap<String, PlotTrace> traces = new TraceHashMap<>();

        if (!wetlab.isPresent()) {
            throw new NotFoundException("Wetlab doesnt found");
        }
        if (!plot.isPresent()) {
            throw new NotFoundException("Plot doesnt found");
        }

        List<WetLabFile> files = fileRepo.findAllByCreationDateBetweenAndTypeId(startDate, endDate,
                wetlab.get().getId());
        data = dataRepo.findByFileInAndContextSourceInAndParamId(files, plot.get().getContextSource(),
                plot.get().getParam().getId());
        for (Data d : data) {
            if (!traces.containsKey(d.getContextSource().getAbbreviated())) {
                traces.put(d.getContextSource().getAbbreviated(),
                        generatePlotTraceFromContextSource(d.getContextSource()));
            }
            traces.get(d.getContextSource().getAbbreviated()).getPlotTracePoints()
                    .add(generatePlotTracePointFromData(d));
        }
        List<PlotTrace> plotTracesList = traces.toList();
        return plotTracesList;
    }

    private PlotTrace generatePlotTraceFromContextSource(ContextSource contextSource) {
        PlotTrace plotTrace = new PlotTrace();
        plotTrace.setAbbreviated(contextSource.getAbbreviated());
        plotTrace.setTraceColor(contextSource.getTraceColor());
        plotTrace.setPlotTracePoints(new ArrayList<>());
        return plotTrace;
    }

    private PlotTracePoint generatePlotTracePointFromData(Data d) {
        return new PlotTracePoint(d.getFile(), d.getCalculatedValue(), d.getStd(), d.getNonConformityStatus());
    }

    public void insertDataFromPipeline(DataFromPipeline dataFromPipeline) {
        System.out.println("hola");
        Optional <WetLabFile> file = fileRepo.findOneByChecksum(dataFromPipeline.getFile().getChecksum());
        if (file.isEmpty()) {
            System.out.println("File not found");
            throw new DataRetrievalFailureException("File not found");
        }

        dataFromPipeline.setFile(file.get());
        for (ParameterData parameterData: dataFromPipeline.getData()) {
            if (parameterData.getValues().size() == 0) {
                System.out.println("Parameter = 0");
                continue;
            }
            System.out.println("Hasta aqui");
            Optional <Param> param = paramRepo.findById(parameterData.getParameter().getId());
            if(param.isEmpty()) {
                System.out.println("Param not found");
                continue;
            }
            parameterData.setParameter(param.get());
            for (DataValues dataValue: parameterData.getValues()) {
                Optional <ContextSource> cs = null;
                cs = csRepo.findById(dataValue.getContextSource());
                if (cs.isEmpty()) {
                    continue;
                }

                Data d = new Data(param.get(), cs.get(), file.get());
                d.setValue(dataValue.getValue());
                d.setCalculatedValue(dataValue.getValue());
                d.setStd(dataValue.getStd());
                dataRepo.save(d);
            }

        }
    }

}