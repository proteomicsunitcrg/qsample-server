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
}
