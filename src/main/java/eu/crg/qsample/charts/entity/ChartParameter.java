package eu.crg.qsample.charts.entity;

import javax.persistence.*;

@Entity
@Table(
    name = "chart_parameters",
    uniqueConstraints = @UniqueConstraint(columnNames = {"chart_id", "param_key"})
)
public class ChartParameter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chart_id", nullable = false)
    private ChartDefinition chart;

    @Column(name = "param_key", nullable = false, length = 100)
    private String paramKey;

    @Column(name = "param_value", columnDefinition = "TEXT")
    private String paramValue;

    @Column(name = "param_type", nullable = false, length = 50)
    private String paramType = "string";

    @Column(length = 255)
    private String description;

    // getters and setters
    public String getParamKey() {
        return paramKey;
    }

    public String getParamValue() {
        return paramValue;
    }

    public String getParamType() {
        return paramType;
    }

    public Long getId() {
        return id;
    }

    public ChartDefinition getChart() {
        return chart;
    }

    public String getDescription() {
        return description;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setChart(ChartDefinition chart) {
        this.chart = chart;
    }

    public void setParamKey(String paramKey) {
        this.paramKey = paramKey;
    }

    public void setParamValue(String paramValue) {
        this.paramValue = paramValue;
    }

    public void setParamType(String paramType) {
        this.paramType = paramType;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
