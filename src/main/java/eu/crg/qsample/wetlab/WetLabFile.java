package eu.crg.qsample.wetlab;

import java.util.Date;

import javax.persistence.Column;
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

    @Column
    private int replicate;

    @Column
    private int year;

    @Column
    private int week;

    public int getReplicate() {
        return replicate;
    }

    public WetLabFile(WetLab type, int replicate, int year, int week) {
        this.type = type;
        this.replicate = replicate;
        this.year = year;
        this.week = week;
    }

    public WetLabFile(Long id, String checksum, Date creation_date, String filename, WetLab type, int replicate,
            int year, int week) {
        super(id, checksum, creation_date, filename);
        this.type = type;
        this.replicate = replicate;
        this.year = year;
        this.week = week;
    }

    public void setReplicate(int replicate) {
        this.replicate = replicate;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

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