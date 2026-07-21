package eu.crg.qsample.data;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.file.FileRepository;
import eu.crg.qsample.param.Param;
import eu.crg.qsample.param.ParamRepository;
import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.plot.PlotRepository;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

@ExtendWith(SpringExtension.class)
@SpringBootTest
@ActiveProfiles("unittest")
public class WetlabTriplicateBatchUnitTest {

    @Autowired
    DataService dataService;

    @Autowired
    WetLabRepository wetLabRepo;

    @Autowired
    FileRepository fileRepo;

    @Autowired
    ParamRepository paramRepo;

    @Autowired
    ContextSourceRepository csRepo;

    @Autowired
    PlotRepository plotRepo;

    @Autowired
    DataRepository dataRepo;

    /**
     * Same week/year, 6 replicates arriving as two batches of 3 (R1-R3, R4-R6).
     * getTraceData must return one averaged point per batch, not one per week.
     */
    @Test
    @Transactional
    public void sixReplicatesInSameWeekProduceTwoTriplicateBatches() {
        WetLab wetlab = wetLabRepo.save(new WetLab(null, UUID.randomUUID(), "Triplicate batch test wetlab", null));

        // Reuse any pre-existing Param instead of inserting a new one: other test classes sharing
        // this JVM's named H2 instance may leave rows behind without cleaning them up, and a fresh
        // auto-generated id can collide with one of those leftovers.
        Param param = paramRepo.findAll().stream()
                .findFirst()
                .orElseGet(() -> {
                    Param p = new Param();
                    p.setApiKey(UUID.randomUUID());
                    p.setName("Triplicate batch test param");
                    return paramRepo.save(p);
                });

        ContextSource cs = new ContextSource();
        cs.setApiKey(UUID.randomUUID());
        cs.setAbbreviated("TB");
        cs.setName("Triplicate batch test context");
        cs = csRepo.save(cs);

        Plot plot = new Plot(null, UUID.randomUUID(), Arrays.asList(cs), param);
        plot = plotRepo.save(plot);

        Date now = new Date();
        Date startDate = new Date(0);
        Date endDate = new Date(now.getTime() + 1000);

        float[] batch1Values = { 10f, 20f, 30f };
        float[] batch2Values = { 40f, 50f, 60f };

        for (int i = 0; i < batch1Values.length; i++) {
            saveReplicate(wetlab, param, cs, i + 1, now, batch1Values[i]);
        }
        for (int i = 0; i < batch2Values.length; i++) {
            saveReplicate(wetlab, param, cs, batch1Values.length + i + 1, now, batch2Values[i]);
        }

        List<PlotTracePointWetlab> points = dataService
                .getTraceData(startDate, endDate, plot.getId(), wetlab.getApiKey())
                .stream()
                .flatMap(trace -> trace.getPlotTracePoints().stream())
                .sorted((a, b) -> a.getName().compareTo(b.getName()))
                .collect(Collectors.toList());

        assertEquals(2, points.size());

        PlotTracePointWetlab firstBatch = points.get(0);
        PlotTracePointWetlab secondBatch = points.get(1);

        assertEquals("W5Y2026-B1", firstBatch.getName());
        assertEquals(20.0d, firstBatch.getValue(), 0.001d);
        assertEquals(8.164d, firstBatch.getStd(), 0.001d);
        assertEquals(3, firstBatch.getTriplicats().size());

        assertEquals("W5Y2026-B2", secondBatch.getName());
        assertEquals(50.0d, secondBatch.getValue(), 0.001d);
        assertEquals(8.164d, secondBatch.getStd(), 0.001d);
        assertEquals(3, secondBatch.getTriplicats().size());
    }

    /**
     * A week with only a single triplicate (3 replicates) must keep the plain "W{week}Y{year}"
     * name, with no "-B1" suffix, since there is nothing to disambiguate it from.
     */
    @Test
    @Transactional
    public void threeReplicatesInSameWeekProduceUnsuffixedSinglePoint() {
        WetLab wetlab = wetLabRepo.save(new WetLab(null, UUID.randomUUID(), "Single batch test wetlab", null));

        Param param = paramRepo.findAll().stream()
                .findFirst()
                .orElseGet(() -> {
                    Param p = new Param();
                    p.setApiKey(UUID.randomUUID());
                    p.setName("Single batch test param");
                    return paramRepo.save(p);
                });

        ContextSource cs = new ContextSource();
        cs.setApiKey(UUID.randomUUID());
        cs.setAbbreviated("SB");
        cs.setName("Single batch test context");
        cs = csRepo.save(cs);

        Plot plot = new Plot(null, UUID.randomUUID(), Arrays.asList(cs), param);
        plot = plotRepo.save(plot);

        Date now = new Date();
        Date startDate = new Date(0);
        Date endDate = new Date(now.getTime() + 1000);

        float[] values = { 10f, 20f, 30f };
        for (int i = 0; i < values.length; i++) {
            saveReplicate(wetlab, param, cs, i + 1, now, values[i]);
        }

        List<PlotTracePointWetlab> points = dataService
                .getTraceData(startDate, endDate, plot.getId(), wetlab.getApiKey())
                .stream()
                .flatMap(trace -> trace.getPlotTracePoints().stream())
                .collect(Collectors.toList());

        assertEquals(1, points.size());
        assertEquals("W5Y2026", points.get(0).getName());
        assertEquals(20.0d, points.get(0).getValue(), 0.001d);
        assertEquals(3, points.get(0).getTriplicats().size());
    }

    private void saveReplicate(WetLab wetlab, Param param, ContextSource cs, int replicate, Date creationDate, float value) {
        WetLabFile file = new WetLabFile(wetlab, replicate, 2026, 5);
        file.setChecksum("tb-r" + replicate + "-" + UUID.randomUUID().toString().substring(0, 8));
        file.setFilename("R" + replicate + "_W05.raw");
        file.setCreationDate(creationDate);
        file = fileRepo.save(file);

        Data data = new Data(param, cs, file);
        data.setValue(value);
        data.setCalculatedValue(value);
        dataRepo.save(data);
    }
}
