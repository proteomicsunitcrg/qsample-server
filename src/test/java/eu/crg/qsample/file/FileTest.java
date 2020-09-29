package eu.crg.qsample.file;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;
import eu.crg.qsample.wetlab.WetLabService;

import org.junit.Assert;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("unittest")
public class FileTest {

    @Autowired
    FileService fileService;

    @Autowired
    WetLabService wetLabService;

    @Autowired
    RequestFileRepository requestFileRepo;

    // ISolutionQC
    private UUID wetlabApiKeyCorrect = UUID.fromString("6170694b-6579-3100-0000-000000000000");
    private UUID wetlabApiKeyFake = UUID.fromString("6170694b-6679-3100-0000-000000000000");

    @Test
    public void getWetLabFileByChecksum() {
        Optional<WetLabFile> wlf = fileService.getFileByChecksum("check1232");
        Assert.assertEquals("Should be found", wlf.isPresent(), true);

        Optional<WetLabFile> wlfFAIL = fileService.getFileByChecksum("thisChecksumDoesntExist");
        Assert.assertEquals("Should not be found", wlfFAIL.isPresent(), false);
    }

    @Test
    public void insertWetLabFileExpectTrue() {
        // WetLab wetlab = wetLabService.getByApiKey(UUID.fromString("6170694b-6579-3100-0000-000000000000"));
        WetLabFile filerino = new WetLabFile(null, "ChecksumTest1", generateDate("2020-08-10 07:00:00"), "testFilename", null);
        fileService.insertFile(filerino, wetlabApiKeyCorrect);
        Optional <WetLabFile> inserted = fileService.getFileByChecksum("ChecksumTest");
        Assert.assertEquals(inserted.isPresent(), true);
    }


    @Test(expected = DataIntegrityViolationException.class)
    public void insertWetLabFileNoNewerBuDateExpectException() {
        WetLabFile filerino = new WetLabFile(null, "ChecksumTest2", generateDate("2015-08-10 07:00:00"), "testFilename", null);
        fileService.insertFile(filerino, wetlabApiKeyCorrect);
    }

    @Test(expected = DataRetrievalFailureException.class)
    public void insertWetLabFileWetLabDoesntExistExpectException() {
        WetLabFile filerino = new WetLabFile(null, "ChecksumTest3", generateDate("2021-08-10 07:00:00"), "testFilename", null);
        fileService.insertFile(filerino, wetlabApiKeyFake);
    }

    @Test(expected = DataIntegrityViolationException.class)
    public void insertWetLabFileWetLabChecksumAlreadyExistsExpectException() {
        WetLabFile filerino = new WetLabFile(null, "ChecksumTest1", generateDate("2021-08-10 07:00:00"), "testFilename", null);
        fileService.insertFile(filerino, wetlabApiKeyCorrect);
    }


    @Test
    public void insertRequestFileExpectTrue() {
        RequestFile requestFile = new RequestFile(null, "RequestFileChecksum1", generateDate("2021-08-10 07:00:00"), "requestFilename", "ZX1212");
        fileService.insertFileRequest(requestFile);
        Optional <RequestFile> inserted = requestFileRepo.findOneByChecksum("RequestFileChecksum1");
        Assert.assertEquals(inserted.isPresent(), true);
    }


    @Test(expected = DataIntegrityViolationException.class)
    public void insertRequestFileChecksumAlreadyExists() {
        RequestFile requestFile = new RequestFile(null, "RequestFileChecksum1", generateDate("2021-08-10 07:00:00"), "requestFilename", "ZX1212");
        fileService.insertFileRequest(requestFile);
    }




    private Date generateDate(String daterino) {
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startDate = null;
    try {
            startDate = formatter.parse(daterino);
            return startDate;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
            // TODO Auto-generated catch block
        }
    }

}
