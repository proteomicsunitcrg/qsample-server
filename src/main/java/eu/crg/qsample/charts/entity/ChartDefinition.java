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

    @OneToMany(mappedBy = "chart", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChartParameter> parameters;

    @OneToMany(mappedBy = "chart", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChartPageAssignment> pageAssignments;

    // getters and setters
}
