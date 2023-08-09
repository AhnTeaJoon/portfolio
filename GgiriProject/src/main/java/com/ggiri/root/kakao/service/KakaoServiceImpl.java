package com.ggiri.root.kakao.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service
public class KakaoServiceImpl implements KakaoService{
	
	@Override
	public String getReturnAccessToken(String code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=0bc794d215c15ba457b2eb709fecd070");
			sb.append("&redirect_uri=http://localhost:8080/root/ggiriMember/kakao_callback");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			System.out.println("response : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);
			
			br.close();
			bw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return access_token;
	}
	
	@Override
	public Map<String, Object> getUserInfo(String access_token) {
		Map<String, Object> resultMap = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			conn.setRequestProperty("charset", "UTF-8");
			
			int responseCode = conn.getResponseCode();
			String errorCode = conn.getResponseMessage();
			System.out.println("errorCode : " + errorCode);
			System.out.println("responseCode : " + responseCode);

			String response;
			InputStream stream = conn.getErrorStream();
			if (stream != null) {
				try (Scanner scanner = new Scanner(stream)) {
					scanner.useDelimiter("\\Z");
					response = scanner.next();
				}
				System.out.println("error response : " + response);
			}
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			System.out.println("response body : " + result);
			System.out.println("result type : " + result.getClass().getName());
			
//			ObjectMapper objectMapper = new ObjectMapper();
//			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});
//			Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
//			Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");
//			String nickname = properties.get("nickname").toString();
//			String email = properties.get("email").toString();
			
			JsonParser parser = new JsonParser();
			JsonObject jsonObject = (JsonObject)parser.parse(result);
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String id = jsonObject.get("id").toString();
			
			System.out.println("email : " + email);
			System.out.println("nickname : " + nickname);
			System.out.println("id : " + id);
			
			resultMap.put("email", email);
			resultMap.put("nickname", nickname);
			resultMap.put("id", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		SessionConfigVO kakaoresult = gkm.findKakao(resultMap);
//		
//		if(kakaoresult == null) {
//			gkm.kakaoinsert(resultMap);
//			
//			return gkm.findKakao(resultMap);
//		} else {
//			return kakaoresult;
//		}
		return resultMap;
	}
	
	@Override
	public void getLogout(String access_token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {

			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			int responseCode = conn.getResponseCode();
			
			if(responseCode == 400) {
				throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
			}
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			System.out.println(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
