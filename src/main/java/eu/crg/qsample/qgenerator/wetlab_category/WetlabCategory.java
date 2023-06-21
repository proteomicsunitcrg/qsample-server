package eu.crg.qsample.qgenerator.wetlab_category;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "wetlab_category")
public class WetlabCategory {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name", length = 200)
    @NotNull
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public WetlabCategory() {
    }

    public WetlabCategory(Long id, @NotNull String name) {
        this.id = id;
        this.name = name;
    }
}
