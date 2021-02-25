package eu.crg.qsample.quantification.model;

import java.util.List;

import eu.crg.qsample.file.File;
import eu.crg.qsample.quantification.Quantification;

public class QuantificationFromPipeline {

    private File file;

    private List<Quantification> quant;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public List<Quantification> getQuant() {
        return quant;
    }

    public void setQuant(List<Quantification> quant) {
        this.quant = quant;
    }

    public QuantificationFromPipeline() {
    }

    public QuantificationFromPipeline(File file, List<Quantification> quant) {
        this.file = file;
        this.quant = quant;
    }


}
