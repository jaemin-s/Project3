package com.music.mrs.ai.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Service
public class OpenAiApiService {
	private String openaiApiKey;

    @PostConstruct
    public void init() {
        try {
            // config.properties 파일의 경로를 설정합니다.
            String configFilePath = "properties/config.properties";

            // config.properties 파일을 읽어옵니다.
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream(configFilePath);
            Properties properties = new Properties();
            properties.load(inputStream);
            inputStream.close();

            // API 키를 가져옵니다.
            openaiApiKey = properties.getProperty("api.key");
        } catch (IOException e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
        }
    }


    public String sendRequest(String question) {
    	String endpoint = "https://api.openai.com/v1/chat/completions";
        String jsonPayload = "{\"messages\": [{\"role\": \"system\", \"content\": \"You are a helpful assistant.\"}, {\"role\": \"user\", \"content\": \""
                + question + "\"}], \"model\": \"gpt-3.5-turbo\"}";

        try {
            URL url = new URL(endpoint);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            String openaiApiKey = getOpenaiApiKey();
            conn.setRequestProperty("Authorization", "Bearer " + openaiApiKey);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            conn.getOutputStream().write(jsonPayload.getBytes(StandardCharsets.UTF_8));

            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // OpenAI API로부터 응답을 받아옵니다.
                BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                StringBuilder responseBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    responseBuilder.append(line);
                }
                reader.close();

                String responseJson = responseBuilder.toString();

                // 결과를 파싱하거나 처리하는 로직을 구현합니다.
                // 예를 들어, 결과를 HTML에 출력하거나 다른 처리를 수행할 수 있습니다.
                // OpenAI API로부터 받은 응답을 JSON 형식으로 파싱합니다.
                JsonObject responseObj = new Gson().fromJson(responseJson, JsonObject.class);

                // 응답에서 assistant의 응답 메시지를 가져옵니다.
                String assistantReply = responseObj.getAsJsonArray("choices").get(0).getAsJsonObject().getAsJsonObject("message")
                        .get("content").getAsString();

                return assistantReply;
            } else {
                // 응답이 실패한 경우 오류 메시지를 반환하거나 적절한 예외 처리를 수행합니다.
                return "Error occurred";
            }
        } catch (IOException e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
            return "Error occurred";
        }
    }
    
    private String getOpenaiApiKey() {
        // openaiApiKey 필드 대신 여기서 API 키를 가져오는 로직을 구현합니다.
        // 예를 들어, 설정 파일에서 읽어오거나 환경 변수로부터 가져올 수 있습니다.
        // 이 예시에서는 기존 init() 메서드에서 가져오던 로직을 사용합니다.
        return openaiApiKey;
    }
}
