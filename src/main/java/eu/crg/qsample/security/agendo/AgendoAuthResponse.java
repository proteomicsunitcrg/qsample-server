package eu.crg.qsample.security.agendo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AgendoAuthResponse {

    @JsonProperty("success")
    private boolean success;

    @JsonProperty("user")
    private AgendoAuthUser user;

    public AgendoAuthResponse(boolean success, AgendoAuthUser user) {
        this.success = success;
        this.user = user;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public AgendoAuthUser getUser() {
        return user;
    }

    public void setUser(AgendoAuthUser user) {
        this.user = user;
    }

    public AgendoAuthResponse() {
    }


}