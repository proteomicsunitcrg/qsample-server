package eu.crg.qsample.param;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "param")
public class Param {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "param_seq")
    @SequenceGenerator(name = "param_seq", sequenceName = "param_seq", allocationSize = 1)
    private Long id;

    @Column(name = "apiKey", length = 50)
    @NotNull
    private UUID apiKey;

    @Column(name = "name", length = 50)
    @NotNull
    private String name;

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

    public Param() {
    }

    public Param(Long id, @NotNull UUID apiKey, @NotNull String name) {
        this.id = id;
        this.apiKey = apiKey;
        this.name = name;
    }



}