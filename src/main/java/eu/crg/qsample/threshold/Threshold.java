package eu.crg.qsample.threshold;

import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import eu.crg.qsample.param.Param;
import eu.crg.qsample.threshold.params.ThresholdParams;
import eu.crg.qsample.wetlab.WetLab;

@Entity
@Table(name = "threshold")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Threshold {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "threshold_seq")
    @SequenceGenerator(name = "threshold_seq", sequenceName = "threshold_seq", allocationSize = 1)
    protected Long id;

    @Column(name = "apiKey", updatable = true, nullable = false, unique = true, columnDefinition = "CHAR(50)")
    // @org.hibernate.annotations.Type(type = "org.hibernate.type.UUIDBinaryType")
    @Type(type = "uuid-char")
    private UUID apiKey;

    @Enumerated(EnumType.STRING)
    @Column(name = "non_conformity_direction", columnDefinition = "varchar(255)")
    private Direction nonConformityDirection;

    @ManyToOne
    @JoinColumn(name = "param_id", nullable = false)
    protected Param param;

    @ManyToOne(optional = true)
    @JoinColumn(name = "wetlab_id")
    protected WetLab wetLab;

    @Column(name = "steps")
    protected int steps;

    @OneToMany(mappedBy = "threshold", cascade = CascadeType.ALL)
    protected List<ThresholdParams> thresholdParams;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UUID getApiKey() {
        return apiKey;
    }

    public void setApiKey(UUID apiKey) {
        this.apiKey = apiKey;
    }

    public Direction getNonConformityDirection() {
        return nonConformityDirection;
    }

    public void setNonConformityDirection(Direction nonConformityDirection) {
        this.nonConformityDirection = nonConformityDirection;
    }

    public Param getParam() {
        return param;
    }

    public void setParam(Param param) {
        this.param = param;
    }

    public WetLab getWetlab() {
        return wetLab;
    }

    public void setWetlab(WetLab wetLab) {
        this.wetLab = wetLab;
    }

    public int getSteps() {
        return steps;
    }

    public void setSteps(int steps) {
        this.steps = steps;
    }

    public Threshold() {
    }

    public Threshold(Long id, UUID apiKey, Direction nonConformityDirection, Param param, WetLab wetLab,
            int steps) {
        this.id = id;
        this.apiKey = apiKey;
        this.nonConformityDirection = nonConformityDirection;
        this.param = param;
        this.wetLab = wetLab;
        this.steps = steps;
    }

    public List<ThresholdParams> getThresholdParams() {
        return thresholdParams;
    }

    public void setThresholdParams(List<ThresholdParams> thresholdParams) {
        this.thresholdParams = thresholdParams;
    }

    public Threshold(Long id, UUID apiKey, Direction nonConformityDirection, Param param, WetLab wetLab, int steps,
            List<ThresholdParams> thresholdParams) {
        this.id = id;
        this.apiKey = apiKey;
        this.nonConformityDirection = nonConformityDirection;
        this.param = param;
        this.wetLab = wetLab;
        this.steps = steps;
        this.thresholdParams = thresholdParams;
    }

}
