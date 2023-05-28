package com.music.mrs.ai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.mrs.ai.command.SongVO;
import com.music.mrs.ai.service.ISongService;
import com.music.mrs.ai.service.SongService;

/*
 	CREATE TABLE Members (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL
);


CREATE TABLE Songs (
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  artist VARCHAR(100) NOT NULL,
  video_id VARCHAR(50)
);


CREATE TABLE SongSelections (
  selection_id INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT NOT NULL,
  song_id INT NOT NULL,
  selection_date DATETIME NOT NULL,
  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);


CREATE TABLE MusicCategories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);

CREATE TABLE Playlists (
  playlist_id INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT NOT NULL,
  playlist_name VARCHAR(50) NOT NULL,
  FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
  
 */


@Controller
public class SongController {
	
	
    private final ISongService songService;

    @Autowired
    public SongController(ISongService songService) {
        this.songService = songService;
    }

    @PostMapping("/song-selection")
    public @ResponseBody String handleSongSelection(@RequestBody Map<String, String> request) {
    	
    	String value = request.get("value");
    	
        SongVO song = new SongVO();
        
        song.setCategory(value);
        
        // 서비스 클래스의 메소드를 호출하여 OpenAI API 요청 및 응답 처리
        String result = songService.processSongSelection(song);
        
        // 처리 결과를 반환
        return result;
    }
}
