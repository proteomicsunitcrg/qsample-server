package eu.crg.qsample.file.fileinfo;

import eu.crg.qsample.file.RequestFile;

public class FileInfoFromPipeline {

    private RequestFile file;

    private FileInfo info;

    public RequestFile getFile() {
        return file;
    }

    public void setFile(RequestFile file) {
        this.file = file;
    }

    public FileInfo getInfo() {
        return info;
    }

    public void setInfo(FileInfo info) {
        this.info = info;
    }

    public FileInfoFromPipeline() {
    }

    public FileInfoFromPipeline(RequestFile file, FileInfo info) {
        this.file = file;
        this.info = info;
    }




}
