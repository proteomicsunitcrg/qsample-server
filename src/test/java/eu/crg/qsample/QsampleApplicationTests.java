package eu.crg.qsample;

import org.junit.jupiter.api.Test;
import org.junit.runner.JUnitCore;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import eu.crg.qsample.auth.AuthIntegrationTest;
import eu.crg.qsample.data.DataUnitTest;
import eu.crg.qsample.file.FileIntegrationTest;
import eu.crg.qsample.file.FileUnitTest;
import eu.crg.qsample.guideset.GuideSetUnitTest;
import eu.crg.qsample.wetlab.WetLabUnitTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
        DataUnitTest.class,
		FileUnitTest.class,
		FileIntegrationTest.class,
		GuideSetUnitTest.class,
		WetLabUnitTest.class,
		AuthIntegrationTest.class,
})
public class QsampleApplicationTests {
    @Test
    public void contextLoads() {
		JUnitCore.runClasses(QsampleApplicationTests.class);
    }
}