package eu.crg.qsample.plot;

import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.apache.tomcat.util.descriptor.web.ContextService;

import eu.crg.qsample.context_source.ContextSource;
import eu.crg.qsample.param.Param;

@Entity
@Table(name = "plot")
public class Plot {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "plot_seq")
    @SequenceGenerator(name = "plot_seq", sequenceName = "plot_seq", allocationSize = 1)
    private Long id;

    @Column(name = "apiKey", length = 50)
    @NotNull
    private UUID apiKey;

    // @Column (name = "contextSource")
    @ManyToMany
    private List <ContextSource> contextSource;


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "param_id", referencedColumnName = "id")
    private Param param;

    public Plot() {
    }

    public Plot(Long id, @NotNull UUID apiKey, List<ContextSource> contextSource, @NotNull Param param) {
        this.id = id;
        this.apiKey = apiKey;
        this.contextSource = contextSource;
        this.param = param;
    }

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

    public List<ContextSource> getContextSource() {
        return contextSource;
    }

    public void setContextSource(List<ContextSource> contextSource) {
        this.contextSource = contextSource;
    }

    public Param getParam() {
        return param;
    }

    public void setParam(Param param) {
        this.param = param;
    }


}