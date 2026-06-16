package eu.crg.qsample.charts.entity;

import javax.persistence.*;

@Entity
@Table(
    name = "chart_page_assignments",
    uniqueConstraints = @UniqueConstraint(columnNames = {"chart_id", "page_name"})
)
public class ChartPageAssignment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chart_id", nullable = false)
    private ChartDefinition chart;

    @Column(name = "page_name", nullable = false, length = 100)
    private String pageName;

    @Column(name = "display_order", nullable = false)
    private Integer displayOrder = 0;

    @Column(name = "is_visible", nullable = false)
    private Boolean visible = true;

    // getters and setters

    public ChartDefinition getChart() {
            return chart;
    }

    public void setChart(ChartDefinition chart) {
        this.chart = chart;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public Integer getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }
}
