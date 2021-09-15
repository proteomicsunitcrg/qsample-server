package eu.crg.qsample.data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.OptionalDouble;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;
import java.util.stream.Collectors;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Service;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.model.DataFromPipeline;
import eu.crg.qsample.data.model.DataValues;
import eu.crg.qsample.data.model.ParameterData;
import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.file.RequestFileRepository;
import eu.crg.qsample.guideset.GuideSetService;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.plot.PlotRepository;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

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

    public List<PlotTraceWetlab> getTraceData(Date startDate, Date endDate, Long plotId, UUID wetLabApiKey) {
        Optional<Plot> plot = plotRepo.findById(plotId);
        Optional<WetLab> wetlab = wetLabRepo.findOneByApiKey(wetLabApiKey);
        List<Data> data = new ArrayList<>();
        int order = 1;

        TraceHashMap<String, PlotTraceWetlab> traces = new TraceHashMap<>();

        if (!wetlab.isPresent()) {
            throw new NotFoundException("Wetlab doesnt found");
        }
        if (!plot.isPresent()) {
            throw new NotFoundException("Plot doesnt found");
        }
        List<WetLabFile> files = fileRepo.findAllByCreationDateBetweenAndTypeIdOrderByWeekAscYearAsc(startDate, endDate,
                wetlab.get().getId());
        for (WetLabFile wlFile : files) { // TODO impriove this
            List<WetLabFile> triplicats = new ArrayList<>();
            triplicats.add(wlFile);
            for (WetLabFile wlFile2 : files) {
                if (wlFile.getWeek() == wlFile2.getWeek() && wlFile.getYear() == wlFile2.getYear()
                        && wlFile.getChecksum() != wlFile2.getChecksum()) {
                    triplicats.add(wlFile2);
                }
            }
            for (ContextSource cs : plot.get().getContextSource()) {
                data = dataRepo.findByFileInAndContextSourceIdAndParamId(triplicats, cs.getId(),
                        plot.get().getParam().getId());
                List<Float> res = new ArrayList<>();
                for (Data d : data) {
                    res.add(d.getCalculatedValue());
                }
                double average = getAverage(res);
                double std = calculateSD(res);
                if (!traces.containsKey(cs.getAbbreviated())) {
                    traces.put(cs.getAbbreviated(), generatePlotTraceFromContextSourceWetlab(cs));
                }
                traces.get(cs.getAbbreviated()).getPlotTracePoints()
                        .add(generatePlotTracePointFromDataWetlab(wlFile, average, std, triplicats));
                order = order + 1;
            }
        }
        List<PlotTraceWetlab> plotTracesList = traces.toList();

        return removeDuplicatedTraces(plotTracesList);
    }

    private double getAverage(List<Float> list) {
        OptionalDouble average = list.stream().mapToDouble(a -> a).average();
        return average.isPresent() ? average.getAsDouble() : 0;

    }

    private static double calculateSD(List<Float> numArray) {
        double sum = 0.0, standardDeviation = 0.0;
        int length = numArray.size();

        for (Float num : numArray) {
            sum += num;
        }

        double mean = sum / length;

        for (Float num : numArray) {
            standardDeviation += Math.pow(num - mean, 2);
        }

        return Math.sqrt(standardDeviation / length);
    }

    private List<PlotTraceWetlab> removeDuplicatedTraces (List <PlotTraceWetlab> toConvert) {
        for (PlotTraceWetlab trace: toConvert) {
            Set<PlotTracePointWetlab> test = trace.getPlotTracePoints().stream().collect(Collectors.toCollection(
                () -> new TreeSet<>(Comparator.comparing(PlotTracePointWetlab::getName))
            ));
            List<PlotTracePointWetlab> lmao = new ArrayList<>(test);
            trace.setPlotTracePoints(lmao);
        }
        return toConvert;
    }

    private PlotTrace generatePlotTraceFromContextSource(ContextSource contextSource) {
        PlotTrace plotTrace = new PlotTrace();
        plotTrace.setAbbreviated(contextSource.getAbbreviated());
        plotTrace.setTraceColor(contextSource.getTraceColor());
        plotTrace.setPlotTracePoints(new ArrayList<>());
        return plotTrace;
    }

    private PlotTraceWetlab generatePlotTraceFromContextSourceWetlab(ContextSource contextSource) {
        PlotTraceWetlab plotTrace = new PlotTraceWetlab();
        plotTrace.setAbbreviated(contextSource.getAbbreviated());
        plotTrace.setTraceColor(contextSource.getTraceColor());
        plotTrace.setPlotTracePoints(new ArrayList<>());
        return plotTrace;
    }

    private PlotTracePoint generatePlotTracePointFromData(Data d) {
        return new PlotTracePoint(d.getFile(), d.getCalculatedValue(), d.getNonConformityStatus());
    }

    private PlotTracePointWetlab generatePlotTracePointFromDataWetlab(WetLabFile wf, double value, double std, List<WetLabFile> triplicats) {
        return new PlotTracePointWetlab("W" + wf.getWeek() + "Y" + wf.getYear(), value, std, wf.getWeek(), wf.getYear(), triplicats);
    }

    public List<PlotTrace> getTraceDataRequest(Long csId, Long paramId, String requestCode, String order) {
        Optional<ContextSource> cs = csRepo.findById(csId);
        if (!cs.isPresent()) {
            throw new NotFoundException("Context Source with id: " + csId + " not found");
        }
        Optional<Param> param = paramRepo.findById(paramId);
        if (!param.isPresent()) {
            throw new NotFoundException("Param with id: " + csId + " not found");
        }
        List<Data> data = new ArrayList<>();
        TraceHashMap<String, PlotTrace> traces = new TraceHashMap<>();
        Optional<List<RequestFile>> files = Optional.of(new ArrayList<RequestFile>());
        switch (order) {
            case "filename":
                files = fileRepo.findAllByRequestCodeOrderByFilename(requestCode);
                break;
            case "date":
                files = fileRepo.findAllByRequestCodeOrderByCreationDate(requestCode);
                break;
            default:
                files = fileRepo.findAllByRequestCodeOrderByFilename(requestCode);
                break;
        }
        if (!files.isPresent()) {
            throw new NotFoundException("Files not foudn with request code: " + requestCode);
        }
        List<RequestFile> allFiles = files.get();
        allFiles = parseFileNameForPlot(allFiles);
        switch (order) {
            case "filename":
                data = dataRepo.findByFileInAndContextSourceAndParamOrderByFileFilename(files.get(), cs.get(),
                        param.get());
                break;
            case "date":
                data = dataRepo.findByFileInAndContextSourceAndParamOrderByFileCreationDate(files.get(), cs.get(),
                        param.get());
                break;
            default:
                data = dataRepo.findByFileInAndContextSourceAndParamOrderByFileFilename(files.get(), cs.get(),
                        param.get());
                break;
        }
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

    /**
     * Remove the request code from the filename
     *
     * @param files
     * @return
     */
    private List<RequestFile> parseFileNameForPlot(List<RequestFile> files) {
        for (RequestFile file : files) {
            List<String> items = new ArrayList<>(Arrays.asList(file.getFilename().split("\\s*_\\s*"))); // https://stackoverflow.com/questions/5755477/java-list-add-unsupportedoperationexception
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
     *
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
                dataRepo.save(d);
            }

        }
    }

    /**
     * REQUEST
     *
     * @param dataFromPipeline
     */
    public void insertDataFromPipelineRequest(DataFromPipeline dataFromPipeline) {
        logger.info("Trying to insert data for file with checksum: " + dataFromPipeline.getFile().getChecksum());
        Optional<RequestFile> file = requestFileRepo.findOneByChecksum(dataFromPipeline.getFile().getChecksum());
        if (!file.isPresent()) {
            logger.error(
                    "File whit checksum: " + dataFromPipeline.getFile().getChecksum() + " not found in the database");
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
                logger.error(
                        "Parameter with id: " + parameterData.getParameter().getId() + " not found in the database");
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
                logger.info("Saving data: " + d.toString());
                dataRepo.save(d);
            }

        }
    }

}