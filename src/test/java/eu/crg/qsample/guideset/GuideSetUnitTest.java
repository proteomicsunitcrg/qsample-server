package eu.crg.qsample.guideset;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabRepository;

import org.junit.Assert;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("unittest")
public class GuideSetUnitTest {

    @Autowired
    GuideSetService guideSetService;

    @Autowired
    WetLabRepository wetlabRepository;

    final private Long correctGuideSetId = 45l;


    @Test
    public void testAverageMethod() {
        Float expected = 38.886665f;
        Assert.assertEquals(expected, guideSetService.getAverage(getFloatSampleList()));
    }

    @Test
    public void testSTDMethod() {
        Float expected = 48.240482f;
        Assert.assertEquals(expected, guideSetService.getSTD(getFloatSampleList()));
    }

    // @Test
    // public void deleteGuidesetExpectCorrect() {
    //     WetLab wetlab = wetlabRepository.findById(1l).get();
    //     // GuideSet gd = new GuideSet()
    //     boolean res = guideSetService.deleteGuideset(wetlab.getGuideSet());
    //     // Assert.assertEquals(true, res);
    // }

    private List<Float> getFloatSampleList() {
        List<Float> floatList = new ArrayList<>();
        floatList.add(12f);
        floatList.add(23f);
        floatList.add(12f);
        floatList.add(-1f);
        floatList.add(142f);
        floatList.add(45.32f);
        return floatList;
    }


}
