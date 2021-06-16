package eu.crg.qsample.request.favorite_request;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import eu.crg.qsample.security.model.User;

@Entity
public class FavoriteRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "favorite_request_seq")
    @SequenceGenerator(name = "favorite_request_seq", sequenceName = "favorite_request_seq", allocationSize = 1)
    private Long id;

    @Column
    private String requestCode;

    @Column
    private Long agendoId;

    @ManyToMany
    @JsonIgnore
    private List<User> users;

    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRequestCode() {
        return requestCode;
    }

    public void setRequestCode(String requestCode) {
        this.requestCode = requestCode;
    }

    public Long getAgendoId() {
        return agendoId;
    }

    public void setAgendoId(Long agendoId) {
        this.agendoId = agendoId;
    }

    public FavoriteRequest() {
    }

    public FavoriteRequest(Long id, String requestCode, Long agendoId) {
        this.id = id;
        this.requestCode = requestCode;
        this.agendoId = agendoId;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "FavoriteRequest [agendoId=" + agendoId + ", id=" + id + ", requestCode=" + requestCode + ", users="
                + users + "]";
    }


    
}