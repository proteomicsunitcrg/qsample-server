package eu.crg.qsample.modification;

import java.util.List;

import eu.crg.qsample.file.File;

public class ModificationFromPipeline {

    private File file;

    private List<ModificationFile> data;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public List<ModificationFile> getData() {
        return data;
    }

    public void setData(List<ModificationFile> data) {
        this.data = data;
    }

    public ModificationFromPipeline() {
    }

    public ModificationFromPipeline(File file, List<ModificationFile> data) {
        this.file = file;
        this.data = data;
    }


}
