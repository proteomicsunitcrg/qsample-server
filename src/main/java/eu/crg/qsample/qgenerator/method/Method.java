package eu.crg.qsample.qgenerator.method;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "method")
public class Method {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "method_seq")
    @SequenceGenerator(name = "method_seq", sequenceName = "method_seq", allocationSize = 1)
    private Long id;

    @Column(name = "name", length = 300)
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

    public Method() {
    }

    public Method(Long id, @NotNull String name) {
        this.id = id;
        this.name = name;
    }
}
