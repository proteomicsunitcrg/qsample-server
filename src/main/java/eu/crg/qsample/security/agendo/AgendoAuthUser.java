package eu.crg.qsample.security.agendo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AgendoAuthUser {
    @JsonProperty("id")
    private Long id;
    @JsonProperty("name")
    private String name;
    @JsonProperty("email")
    private String email;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public AgendoAuthUser(Long id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    public AgendoAuthUser() {
    }

}