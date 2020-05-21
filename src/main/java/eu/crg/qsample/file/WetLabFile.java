package eu.crg.qsample.file;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "wetLabFile")
public class WetLabFile extends File {

    @ManyToOne
	@JoinColumn(name = "wetLabType", insertable = false, updatable = false)
    private WetLabType type;

    public WetLabFile(Long id, String checksum, Date creation_date, String filename, WetLabType type) {
        super(id, checksum, creation_date, filename);
        this.type = type;
    }

    public WetLabType getType() {
        return type;
    }

    public void setType(WetLabType type) {
        this.type = type;
    }

    public WetLabFile() {
    }


}