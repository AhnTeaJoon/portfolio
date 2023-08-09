package com.ggiri.root.member.service;

import javax.servlet.http.HttpServletRequest;

public interface GgiriMessageService {	
		
	// 등록시 메세지
	public String getMessage(HttpServletRequest request, String msg, String url);

}
