package eu.crg.qsample.data;

import java.util.ArrayList;
import java.util.Arrays;
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
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
import eu.crg.qsample.guideset.GuideSetService;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.plot.PlotRepository;
import eu.crg.qsample.request.Request;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@Service
public class DataService {

    private final Log logger = LogFactory.getLog(this.getClass());

    @Autowired
    PlotRepository plotRepo;

    @Autowired
    WetLabRepository wetLabRepo;

    @Autowired
    DataRepository dataRepo;

    @Autowired
    FileRepository fileRepo;

    @Autowired
    RequestFileRepository requestFileRepo;

    @Autowired
    ParamRepository paramRepo;

    @Autowired
    ContextSourceRepository csRepo;

    @Autowired
    GuideSetService guideSetService;

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

    public List<PlotTrace> getTraceDataRequest(Long csId, Long paramId, String requestCode) {
        Optional <ContextSource> cs = csRepo.findById(csId);
        if (!cs.isPresent()) {
            throw new NotFoundException("Context Source with id: " + csId + " not found");
        }
        Optional <Param> param = paramRepo.findById(paramId);
        if (!param.isPresent()) {
            throw new NotFoundException("Param with id: " + csId + " not found");
        }
        List<Data> data = new ArrayList<>();
        TraceHashMap<String, PlotTrace> traces = new TraceHashMap<>();
        Optional <List<RequestFile>> files = fileRepo.findAllByRequestCodeContains(requestCode);
        if (!files.isPresent()) {
            throw new NotFoundException("Files not foudn with request code: " + requestCode);
        }
        List<RequestFile> allFiles = files.get();
        allFiles = parseFileNameForPlot(allFiles);
        data = dataRepo.findByFileInAndContextSourceAndParam(files.get(), cs.get(), param.get());
        for(Data d: data) {
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

    /**
     * Remove the request code from the filename
     * @param files
     * @return
     */
    private List<RequestFile> parseFileNameForPlot(List<RequestFile> files) {
        for (RequestFile file: files) {
            List<String> items= new ArrayList<>(Arrays.asList(file.getFilename().split("\\s*_\\s*"))); // https://stackoverflow.com/questions/5755477/java-list-add-unsupportedoperationexception
            if (items.get(0).equals(file.getRequestCode())) {
                items.remove(0);
                items.remove(0);
                file.setFilename(String.join("_", items));
            }
        }
        return files;
    }

    /**
     * WETLAB
     * @param dataFromPipeline
     */
    public void insertDataFromPipeline(DataFromPipeline dataFromPipeline) {
        Optional<WetLabFile> file = fileRepo.findOneByChecksum(dataFromPipeline.getFile().getChecksum());
        if (!file.isPresent()) {
            System.out.println("File not found");
            throw new DataRetrievalFailureException("File not found");
        }

        dataFromPipeline.setFile(file.get());
        for (ParameterData parameterData : dataFromPipeline.getData()) {
            if (parameterData.getValues().size() == 0) {
                continue;
            }
            Optional<Param> param = paramRepo.findById(parameterData.getParameter().getId());
            if (!param.isPresent()) {
                continue;
            }
            parameterData.setParameter(param.get());
            for (DataValues dataValue : parameterData.getValues()) {
                Optional<ContextSource> cs = null;
                cs = csRepo.findById(dataValue.getContextSource());
                if (!cs.isPresent()) {
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

    /**
     * REQUEST
     * @param dataFromPipeline
     */
    public void insertDataFromPipelineRequest(DataFromPipeline dataFromPipeline) {
        logger.info("Trying to insert data for file with checksum: " + dataFromPipeline.getFile().getChecksum());
        System.out.println("adeu");
        Optional<RequestFile> file = requestFileRepo.findOneByChecksum(dataFromPipeline.getFile().getChecksum());
        if (!file.isPresent()) {
            logger.error("File whit checksum: " + dataFromPipeline.getFile().getChecksum() + " not found in the database");
            System.out.println("File not found");
            throw new DataRetrievalFailureException("File not found");
        }

        dataFromPipeline.setFile(file.get());
        for (ParameterData parameterData : dataFromPipeline.getData()) {
            if (parameterData.getValues().size() == 0) {
                System.out.println("Parameter = 0");
                continue;
            }
            System.out.println("Hasta aqui");
            Optional<Param> param = paramRepo.findById(parameterData.getParameter().getId());
            if (!param.isPresent()) {
                logger.error("Parameter with id: " + parameterData.getParameter().getId() + " not found in the database");
                System.out.println("Param not found");
                continue;
            }
            parameterData.setParameter(param.get());
            for (DataValues dataValue : parameterData.getValues()) {
                Optional<ContextSource> cs = null;
                cs = csRepo.findById(dataValue.getContextSource());
                if (!cs.isPresent()) {
                    continue;
                }

                Data d = new Data(param.get(), cs.get(), file.get());
                d.setValue(dataValue.getValue());
                d.setCalculatedValue(dataValue.getValue());
                d.setStd(dataValue.getStd());
                logger.info("Saving data: " + d.toString());
                dataRepo.save(d);
            }

        }
    }

}