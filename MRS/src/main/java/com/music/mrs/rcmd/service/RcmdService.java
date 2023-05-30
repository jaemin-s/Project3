package com.music.mrs.rcmd.service;

import java.util.Base64;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RcmdService implements IRcmdService {@Override
	public String getToken() {
		
		String clientId = "61195beb56f14da19d09a1b3b6216b90";
		String redirectUri = "http://localhost:8181/callback";
	
	
		return null;
	}

//	@Override
//	public String getToken() {
//		String requestUri = "https://accounts.spotify.com/api/token";
//		
//		String clientId = "61195beb56f14da19d09a1b3b6216b90";
//		String clientSecret = "6155485147264bcd9c52ec7c008a3142";
//		
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Authorization", "Basic " + (Base64.getEncoder( ).encodeToString((clientId + ':' + clientSecret).getBytes())));
//		headers.add("Content-Type", "application/x-www-form-urlencoded");
//		
//		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
//		param.add("grant_type", "client_credentials");
//		
//		RestTemplate template = new RestTemplate();
//		HttpEntity<Object> requestEntity = new HttpEntity<Object>(param,headers);
//		ResponseEntity<Map> responeseEntity = template.exchange(requestUri, HttpMethod.POST, requestEntity, Map.class);
//		
//		Map<String, String> responseData = (Map<String, String>)responeseEntity.getBody();
//		log.info("token: {}",(String)responseData.get("access_token"));
//		return (String)responseData.get("access_token");
//	}
	
	

	
}
