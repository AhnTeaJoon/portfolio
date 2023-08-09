package com.ggiri.root.google.service;

import java.util.Map;


public interface GoogleService {

	public String getReturnAccessToken(String code);
	public Map<String, Object> getUserInfo(String access_token);
	public void getLogout(String access_token);
	
}
