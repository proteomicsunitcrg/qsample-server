package eu.crg.qsample.wetlab;

import java.util.Optional;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import eu.crg.qsample.exceptions.NotFoundException;
import eu.crg.qsample.wetlab.WetLabFile;
import org.junit.Assert;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("unittest")
public class WetLabUnitTest {

    @Autowired
    WetLabService wetlabService;

    @Test
    public void getWetLabByApiKeyFound() {
        WetLab wetlab = wetlabService.getByApiKey(UUID.fromString("6170694b-6579-3100-0000-000000000000"));
        // System.out.println(wetlab.getName());
    }

    @Test(expected = NotFoundException.class)
    public void getWetLabByApiKeyNotFound() { // This UUID not exist
        WetLab wetlab = wetlabService.getByApiKey(UUID.fromString("6170694b-6679-3100-0000-000000000000"));
        // System.out.println(wetlab.getName());
    }


}
