package com.music.mrs.ai.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.mrs.ai.command.SongVO;
import com.music.mrs.ai.mapper.ISongMapper;
import com.music.mrs.ai.mapper.SongMapper;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class SongService implements ISongService {

    private final OpenAiApiService openAiApiService;
    private final ISongMapper songMapper;
    
    
    @Autowired
    public SongService(OpenAiApiService openAiApiService, ISongMapper songMapper) {
        this.openAiApiService = openAiApiService;
        this.songMapper = songMapper;
    }

    public String processSongSelection(SongVO song) {
        String question;
        
        String value = song.getCategory();
        // value 값에 따라 다른 질문을 생성
        if (value.equals("happy")) {
            question = "유튜브 최신 한국 노래에서 행복한 노래 10개 보내줘. 가수, 노래 이름, 유튜브 video id를 부탁해";
        } else if (value.equals("sad")) {
            question = "유튜브 최신 한국 노래에서 슬픈 노래 10개 보내줘. 가수, 노래 이름, 유튜브 video id를 부탁해";
        } else {
            // 처리할 값에 대한 로직 추가
            return "Invalid value";
        }
        
        System.out.println("Processing song selection. Genre: " + song.getCategory());
        
        

        // OpenAI API에 요청을 보내고 응답을 받음
        System.out.println("Sending API request. Question: " + question);
        String response = openAiApiService.sendRequest(question);

        // 응답을 처리하고 결과를 반환
        System.out.println("Processing API response. Response: " + response);
        String result = processResponse(response);

        List<String> songInfoList = extractSongInfoList(response);
        System.out.println(songInfoList);
        // 새로운 값을 저장
        saveSongs(songInfoList);  // saveSongs 메서드 호출하여 노래 정보 저장
//        System.out.println("Saving new value. Title: " + song.getTitle());

        return result;
    }


	


    private String processResponse(String response) {
        // OpenAI API 응답을 처리하는 로직 추가
        // 예를 들어, 응답에서 추출한 정보를 가공하여 결과를 생성하는 등의 처리를 수행할 수 있습니다.
        // 이 예시에서는 응답 그대로 반환합니다.
    	if (response != null && !response.isEmpty()) {
            // 응답 처리 로직 추가
            return response;
        } else {
            // 응답이 없거나 오류가 발생한 경우에 대한 처리
            return "Error occurred";
        }
    }
    
    private List<String> extractSongInfoList(String response) {
        List<String> songInfoList = new ArrayList<>();
        if (response != null) {
            String[] lines = response.split("\n");
            for (String line : lines) {
                if (line.matches("\\d+\\.\\s.+?\\s-\\s.+?:\\s.+")) {
                    songInfoList.add(line);
                }
            }
        }
        return songInfoList;
    }
    
    
    public void saveSongs(List<String> songInfoList) {
        for (String songInfo : songInfoList) {
            String artist = null;
            String title = null;
            String videoId = null;

            // 가수, 노래 제목 추출
            int dashIndex = songInfo.indexOf("-");
            if (dashIndex != -1) {
                artist = songInfo.substring(0, dashIndex).trim();
                title = songInfo.substring(dashIndex + 1).trim();
            }

            // 비디오 ID 추출
            int videoIdStartIndex = songInfo.lastIndexOf(":");
            if (videoIdStartIndex != -1) {
                videoId = songInfo.substring(videoIdStartIndex + 1).trim();
            }

            // 로깅 추가
            System.out.println("Artist: " + artist);
            System.out.println("Title: " + title);
            System.out.println("Video ID: " + videoId);
            // log.info(artist);
            // log.info(title);
            // log.info(videoId)

            // SongVO 생성 및 저장
            if (artist != null && title != null && videoId != null) {
                SongVO song = new SongVO();
                song.setArtist(artist);
                song.setTitle(title);
                song.setVideoId(videoId);
                songMapper.saveSong(song);
            }
        }
    }
}