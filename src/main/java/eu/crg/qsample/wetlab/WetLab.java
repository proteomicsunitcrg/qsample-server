package eu.crg.qsample.wetlab;

import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

import eu.crg.qsample.guideset.GuideSet;
import eu.crg.qsample.plot.Plot;
import eu.crg.qsample.qgenerator.wetlab_category.WetlabCategory;

@Entity
@Table(name = "wetlab")
public class WetLab {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "wetLab_seq")
    @SequenceGenerator(name = "wetLab_seq", sequenceName = "wetLab_seq", allocationSize = 1)
    private Long id;

    @Column(name = "apiKey", updatable = true, nullable = false, unique = true, columnDefinition = "BINARY(16)")
    @NotNull
    private UUID apiKey;

    @Column(name = "name", length = 50)
    @NotNull
    private String name;

    @ManyToMany
    private List<Plot> plot;

    @OneToOne(orphanRemoval = true)
    private GuideSet guideSet;

    @ManyToOne
    private WetlabCategory category;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public WetlabCategory getWetlabCategory() {
        return category;
    }

    public void setWetlabCategory(WetlabCategory category) {
        this.category = category;
    }


    public WetLab() {
    }

    public WetLab(Long id, UUID apiKey, String name, WetlabCategory category) {
        this.id = id;
        this.apiKey = apiKey;
        this.name = name;
        this.category = category;
    }

    public List<Plot> getPlot() {
        return plot;
    }

    public void setPlot(List<Plot> plot) {
        this.plot = plot;
    }

    public WetLab(Long id, @NotNull UUID apiKey, @NotNull String name, List<Plot> plot, WetlabCategory category) {
        this.id = id;
        this.apiKey = apiKey;
        this.name = name;
        this.plot = plot;
        this.category = category;
    }

    @JsonIgnore
    public GuideSet getGuideSet() {
        return guideSet;
    }

    public void setGuideSet(GuideSet guideSet) {
        this.guideSet = guideSet;
    }

    public WetLab(Long id, @NotNull UUID apiKey, @NotNull String name, List<Plot> plot, GuideSet guideSet, WetlabCategory category) {
        this.id = id;
        this.apiKey = apiKey;
        this.name = name;
        this.plot = plot;
        this.guideSet = guideSet;
        this.category = category;
    }

}
