package com.ggiri.root.google.service;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GoogleRequest {
	
	private String clientId;    
    private String redirectUri; 
    private String clientSecret;   
    private String responseType;   
    private String scope;  
    private String code;
    private String accessType;  
    private String grantType;
    private String state;
    private String includeGrantedScopes;    
    private String loginHint;   
    private String prompt;
    
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getRedirectUri() {
		return redirectUri;
	}
	public void setRedirectUri(String redirectUri) {
		this.redirectUri = redirectUri;
	}
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}
	public String getResponseType() {
		return responseType;
	}
	public void setResponseType(String responseType) {
		this.responseType = responseType;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAccessType() {
		return accessType;
	}
	public void setAccessType(String accessType) {
		this.accessType = accessType;
	}
	public String getGrantType() {
		return grantType;
	}
	public void setGrantType(String grantType) {
		this.grantType = grantType;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIncludeGrantedScopes() {
		return includeGrantedScopes;
	}
	public void setIncludeGrantedScopes(String includeGrantedScopes) {
		this.includeGrantedScopes = includeGrantedScopes;
	}
	public String getLoginHint() {
		return loginHint;
	}
	public void setLoginHint(String loginHint) {
		this.loginHint = loginHint;
	}
	public String getPrompt() {
		return prompt;
	}
	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}
    
}
