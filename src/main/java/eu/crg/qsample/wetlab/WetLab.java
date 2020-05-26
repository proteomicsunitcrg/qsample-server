package eu.crg.qsample.wetlab;

import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import eu.crg.qsample.plot.Plot;

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

    public WetLab() {
    }

    public WetLab(Long id, UUID apiKey, String name) {
        this.id = id;
        this.apiKey = apiKey;
        this.name = name;
    }

    public List<Plot> getPlot() {
        return plot;
    }

    public void setPlot(List<Plot> plot) {
        this.plot = plot;
    }

    public WetLab(Long id, @NotNull UUID apiKey, @NotNull String name, List<Plot> plot) {
        this.id = id;
        this.apiKey = apiKey;
        this.name = name;
        this.plot = plot;
    }


}