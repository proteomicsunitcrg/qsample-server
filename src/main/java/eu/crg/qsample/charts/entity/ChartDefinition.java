package eu.crg.qsample.charts.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "chart_definitions")
public class ChartDefinition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String name;

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "chart_type", nullable = false, length = 50)
    private String chartType;

    @Column(nullable = false, length = 50)
    private String library = "plotly";

    @Column(name = "data_source_key", nullable = false, length = 100)
    private String dataSourceKey;

    @Column(name = "is_active", nullable = false)
    private Boolean active = true;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Column(name = "provider_type")
    private String providerType;

    @Column(name = "constraint_flag")
    private String constraintFlag;

    @OneToMany(mappedBy = "chart", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChartParameter> parameters;

    @OneToMany(mappedBy = "chart", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChartPageAssignment> pageAssignments;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getChartType() {
        return chartType;
    }

    public String getLibrary() {
        return library;
    }

    public String getDataSourceKey() {
        return dataSourceKey;
    }

    public Boolean getActive() {
        return active;
    }

    public List<ChartParameter> getParameters() {
        return parameters;
    }

    public List<ChartPageAssignment> getPageAssignments() {
        return pageAssignments;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setChartType(String chartType) {
        this.chartType = chartType;
    }

    public void setLibrary(String library) {
        this.library = library;
    }

    public void setDataSourceKey(String dataSourceKey) {
        this.dataSourceKey = dataSourceKey;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public void setParameters(List<ChartParameter> parameters) {
        this.parameters = parameters;
    }

    public void setPageAssignments(List<ChartPageAssignment> pageAssignments) {
        this.pageAssignments = pageAssignments;
    }

    public String getProviderType() {
    	return providerType;
    }

    public void setProviderType(String providerType) {
    	this.providerType = providerType;
    }

    public String getConstraintFlag() {
        return constraintFlag;
    }

    public void setConstraintFlag(String constraintFlag) {
        this.constraintFlag = constraintFlag;
    }
}
