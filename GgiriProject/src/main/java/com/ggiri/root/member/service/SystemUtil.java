package com.ggiri.root.member.service;

public class SystemUtil {
	
	public static boolean EmptyCheck(String kakaoToken) {
		if(kakaoToken != null) {
			return false;
		}
		return true;
	}
}
