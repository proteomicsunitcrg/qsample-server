package eu.crg.qsample.security.payload.responses;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class JwtResponse {
	@SerializedName("accessToken")
	private String token;
	private String type = "Bearer";
	private Long id;
	private String username;
	private List<String> roles;

	public JwtResponse(String accessToken, Long id, String username, List<String> roles) {
		this.token = accessToken;
		this.id = id;
		this.username = username;
		this.roles = roles;
	}

	public String getAccessToken() {
		return token;
	}

	public void setAccessToken(String accessToken) {
		this.token = accessToken;
	}

	public String getTokenType() {
		return type;
	}

	public void setTokenType(String tokenType) {
		this.type = tokenType;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<String> getRoles() {
		return roles;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Token: " + this.token + "Id: " + this.id + "Username: " + this.username;
	}
}