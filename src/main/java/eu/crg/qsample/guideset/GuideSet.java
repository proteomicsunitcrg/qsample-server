package eu.crg.qsample.guideset;

import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import eu.crg.qsample.wetlab.WetLab;
import eu.crg.qsample.wetlab.WetLabFile;

@Entity
@Table(name = "guide_set")
public class GuideSet {

    @Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "guide_set_seq")
	@SequenceGenerator(name = "guide_set_seq", sequenceName = "guide_set_seq", allocationSize = 1)
	private Long id;


    @Column(name = "apiKey", updatable = true, nullable = false, unique = true, columnDefinition = "BINARY(16)")
	@org.hibernate.annotations.Type(type = "org.hibernate.type.UUIDBinaryType")
    private UUID apiKey;

    @Column
    @OneToMany
    List<WetLabFile> files;

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

    public List<WetLabFile> getFiles() {
        return files;
    }

    public void setFiles(List<WetLabFile> files) {
        this.files = files;
    }

    public GuideSet(Long id, UUID apiKey, List<WetLabFile> files) {
        this.id = id;
        this.apiKey = apiKey;
        this.files = files;
    }

    public GuideSet() {
    }
}