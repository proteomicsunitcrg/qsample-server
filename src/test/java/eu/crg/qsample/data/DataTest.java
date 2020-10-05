package eu.crg.qsample.data;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.databind.ser.std.FileSerializer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.context_source.ContextSourceRepository;
import eu.crg.qsample.data.model.DataFromPipeline;
import eu.crg.qsample.data.model.DataValues;
import eu.crg.qsample.data.model.ParameterData;
import eu.crg.qsample.file.FileService;
import eu.crg.qsample.wetlab.WetLabFile;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("unittest")
public class DataTest {

    @Autowired
    DataService dataService;

    @Autowired
    FileService fileService;

    @Autowired
    ContextSourceRepository csRepo;


    private Long csCorrectId = 1l;
    private Long csErrorId = 23l;

    private Long paramCorrectId = 1l;
    private Long paramErrorId = 23l;

    private String fileWetlabCorrectChecksum = "check1";
    private String fileWetlabErrorChecksum = "errorLMAO";

    private Float numberFloat = 23f;

    @Test
    public void insertDataWetlabCorrect() {
        DataValues dv = new DataValues(csCorrectId, numberFloat, numberFloat, numberFloat);
        List <DataValues> dvList = new ArrayList<>();
        dvList.add(dv);
        ParameterData pd = new ParameterData(paramCorrectId, dvList);
        List <ParameterData> pdList = new ArrayList<>();
        pdList.add(pd);
        DataFromPipeline dfp = new DataFromPipeline(fileWetlabCorrectChecksum, pdList);
        dataService.insertDataFromPipeline(dfp);
    }

    /**
     * This fails because the data for this file  with this param and cs already exists,
     * So an exception in expected
     */
    @Test(expected = DataIntegrityViolationException.class)
    public void insertDataWetlabRepeatedExpectException() {
        DataValues dv = new DataValues(csCorrectId, numberFloat, numberFloat, numberFloat);
        List <DataValues> dvList = new ArrayList<>();
        dvList.add(dv);
        ParameterData pd = new ParameterData(paramCorrectId, dvList);
        List <ParameterData> pdList = new ArrayList<>();
        pdList.add(pd);
        DataFromPipeline dfp = new DataFromPipeline(fileWetlabCorrectChecksum, pdList);
        dataService.insertDataFromPipeline(dfp);
    }

    /**
     * This fails because the file doesnt exists
     */
    @Test(expected = DataRetrievalFailureException.class)
    public void insertDataWetlabFileDoesntExistsExpectException() {
        DataValues dv = new DataValues(csCorrectId, numberFloat, numberFloat, numberFloat);
        List <DataValues> dvList = new ArrayList<>();
        dvList.add(dv);
        ParameterData pd = new ParameterData(paramCorrectId, dvList);
        List <ParameterData> pdList = new ArrayList<>();
        pdList.add(pd);
        DataFromPipeline dfp = new DataFromPipeline(fileWetlabErrorChecksum, pdList);
        dataService.insertDataFromPipeline(dfp);
    }

    @Test(expected = NullPointerException.class)
    public void insertDataWetlabDataIsNull() {
        DataValues dv = new DataValues(csCorrectId, numberFloat, numberFloat, numberFloat);
        List <DataValues> dvList = new ArrayList<>();
        dvList.add(dv);
        ParameterData pd = new ParameterData(paramErrorId, dvList);
        List <ParameterData> pdList = new ArrayList<>();
        pdList.add(pd);
        DataFromPipeline dfp = new DataFromPipeline(fileWetlabCorrectChecksum, null);
        dataService.insertDataFromPipeline(dfp);
    }


}
