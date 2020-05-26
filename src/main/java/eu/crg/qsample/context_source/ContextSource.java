package eu.crg.qsample.context_source;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.lang.Nullable;

import eu.crg.qsample.TraceColor.TraceColor;

@Entity
@Table(name = "contextSource")
public class ContextSource {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "context_source_seq")
    @SequenceGenerator(name = "context_source_seq", sequenceName = "context_source_seq", allocationSize = 1)
    private Long id;

    @Column(name = "abbreviated", length = 50)
    @NotNull
    private String abbreviated;

    @Column(name = "name", length = 50)
    @NotNull
    private String name;

    @Column(name = "apiKey", length = 50)
    @NotNull
    private UUID apiKey;

    @Column(name = "charge", length = 50)
    @Nullable
    private Long charge;

    @Column(name = "mz", length = 50)
    @Nullable
    private Float mz;

    @ManyToOne
	@JoinColumn(name = "trace_color_id")
    private TraceColor traceColor;

    // @ManyToOne
    // @JoinColumn(name = "node_id")
    // private Plot node;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAbbreviated() {
        return abbreviated;
    }

    public void setAbbreviated(String abbreviated) {
        this.abbreviated = abbreviated;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public UUID getApiKey() {
        return apiKey;
    }

    public void setApiKey(UUID apiKey) {
        this.apiKey = apiKey;
    }

    public Long getCharge() {
        return charge;
    }

    public void setCharge(Long charge) {
        this.charge = charge;
    }

    public Float getMz() {
        return mz;
    }

    public void setMz(Float mz) {
        this.mz = mz;
    }

    public ContextSource() {
    }

    public ContextSource(Long id, @NotNull String abbreviated, @NotNull String name, @NotNull UUID apiKey, Long charge,
            Float mz) {
        this.id = id;
        this.abbreviated = abbreviated;
        this.name = name;
        this.apiKey = apiKey;
        this.charge = charge;
        this.mz = mz;
    }
}