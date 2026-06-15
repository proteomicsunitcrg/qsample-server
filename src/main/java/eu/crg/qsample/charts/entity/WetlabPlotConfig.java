package eu.crg.qsample.charts.entity;

import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.wetlab.WetLab;

import javax.persistence.*;

@Entity
@Table(
    name = "wetlab_plot_configs",
    uniqueConstraints = @UniqueConstraint(columnNames = {"wetlab_id", "plot_id"})
)
public class WetlabPlotConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "wetlab_id", nullable = false)
    private WetLab wetlab;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "plot_id", nullable = false)
    private Plot plot;

    @Column(name = "is_enabled", nullable = false)
    private Boolean enabled = true;

    @Column(name = "order_index", nullable = false)
    private Integer orderIndex = 0;

    public Long getId() {
        return id;
    }

    public WetLab getWetlab() {
        return wetlab;
    }

    public Plot getPlot() {
        return plot;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setWetlab(WetLab wetlab) {
        this.wetlab = wetlab;
    }

    public void setPlot(Plot plot) {
        this.plot = plot;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }
}
