package eu.crg.qsample.wetlab;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.lang.Nullable;

import eu.crg.qsample.file.File;
import eu.crg.qsample.guideset.GuideSet;

@Entity
public class WetLabFile extends File {

    @ManyToOne
	@JoinColumn(name = "wetLabType", insertable = true, updatable = false)
    private WetLab type;

    public WetLabFile(Long id, String checksum, Date creation_date, String filename, WetLab type) {
        super(id, checksum, creation_date, filename);
        this.type = type;
    }

    public WetLab getType() {
        return type;
    }

    public void setType(WetLab type) {
        this.type = type;
    }

    public WetLabFile() {
    }

}