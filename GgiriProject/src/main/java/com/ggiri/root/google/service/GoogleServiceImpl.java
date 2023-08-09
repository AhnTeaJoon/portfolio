package com.ggiri.root.google.service;

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
public class GoogleServiceImpl implements GoogleService {

	@Override
	public String getReturnAccessToken(String code) {
		
		String googleBaseURL = "https://accounts.google.com/o/oauth2/v2/auth";
		String googleClientId = "15714476982-d6tnk6tv8f7hptqjh6qrhqsm42aglq72.apps.googleusercontent.com";
		String googleClientSecret = "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";
		String googleRedirectURL = "http://localhost:8080/root/ggiriMember/google_callback";
		String googleTokenURL = "https://oauth2.googleapis.com/token";
		
		String access_token = "";
		String refresh_token = "";
		
		try {
				
			URL url = new URL(googleTokenURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + googleClientId);
			sb.append("&client_secret=" + googleClientSecret);
			sb.append("&redirect_uri=http://localhost:8080/root/ggiriMember/google_callback");
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
			
			System.out.println("access_token : " + access_token);
			
			br.close();
			bw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return access_token;
		
//		RestTemplate restTemplate = new RestTemplate();
//        Map<String, Object> params = new HashMap<>();
//        params.put("code", code);
//        params.put("client_id", googleClientId);
//        params.put("client_secret", googleClientSecret);
//        params.put("redirect_uri", googleRedirectURL);
//        params.put("grant_type", "authorization_code");
        
//        ResponseEntity<String> responseEntity = restTemplate.postForEntity(googleTokenURL, params, String.class);
        
//        if(responseEntity.getStatusCode() == HttpStatus.OK) {
//        	return responseEntity;
//        }
	}

	@Override
	public Map<String, Object> getUserInfo(String access_token) {
		System.out.println("googleAccessToken : " + access_token);
		Map<String, Object> resultMap = new HashMap<>();
		String reqURL = "https://www.googleapis.com/oauth2/v2/userinfo";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			conn.setRequestProperty("charset", "UTF-8");
			System.out.println(conn);
			
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
//			JsonElement element = parser.parse(result);
//			JsonObject profile = element.getAsJsonObject().get("--account").getAsJsonObject();
//			System.out.println("googleProfile : " + profile);
			

			JsonParser parser = new JsonParser();
			JsonObject jsonObject = (JsonObject)parser.parse(result);

			String email =jsonObject.get("email").toString();
			String name =jsonObject.get("name").toString();
			String id =jsonObject.get("id").toString();

//			String email = profile.getAsJsonObject().get("email").getAsString();
//			String name = profile.getAsJsonObject().get("name").getAsString();
			
			
			System.out.println("googleEmail : " + email);
			System.out.println("googleName : " + name);
			System.out.println("googleID : " + id);
			
			
			resultMap.put("email", email);
			resultMap.put("name", name);
			resultMap.put("id", id);
			//resultMap.put("name", name);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	@Override
	public void getLogout(String access_token) {
		// TODO Auto-generated method stub
		
	}
}
