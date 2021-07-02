package eu.crg.qsample.request.favorite_request;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import eu.crg.qsample.security.model.User;

@Entity
@Table(name = "favorite_request_users")
public class FavoriteRequestsUsers {

    private Long id;
    private FavoriteRequest favoriteRequest;
    private User user;

    //additional
    private boolean notify;


    @Id
    @GeneratedValue
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne
    public FavoriteRequest getFavoriteRequest() {
        return favoriteRequest;
    }

    public void setFavoriteRequest(FavoriteRequest favoriteRequest) {
        this.favoriteRequest = favoriteRequest;
    }

    @ManyToOne
    @JsonIgnore
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "notify")
    public boolean isNotify() {
        return notify;
    }

    public void setNotify(boolean notify) {
        this.notify = notify;
    }

    public FavoriteRequestsUsers() {
    }

    public FavoriteRequestsUsers(Long id, FavoriteRequest favoriteRequest, User user, boolean notify) {
        this.id = id;
        this.favoriteRequest = favoriteRequest;
        this.user = user;
        this.notify = notify;
    }



}