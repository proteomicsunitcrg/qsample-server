package eu.crg.qsample.charts.entity;

import eu.crg.qsample.qgenerator.application.Application;

import javax.persistence.*;

@Entity
@Table(
    name = "application_chart_configs",
    uniqueConstraints = @UniqueConstraint(columnNames = {"application_id", "chart_id"})
)
public class ApplicationChartConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "application_id", nullable = false)
    private Application application;

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

    public Application getApplication() {
        return application;
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

    public void setApplication(Application application) {
        this.application = application;
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