package eu.crg.qsample.charts.entity;

import eu.crg.qsample.wetlab.WetLab;

import javax.persistence.*;

@Entity
@Table(name = "wetlab_chart_configs")
public class WetlabChartConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "wetlab_id", nullable = false)
    private WetLab wetlab;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chart_id", nullable = false)
    private ChartDefinition chart;

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

    public ChartDefinition getChart() {
        return chart;
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

    public void setChart(ChartDefinition chart) {
        this.chart = chart;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }
}
