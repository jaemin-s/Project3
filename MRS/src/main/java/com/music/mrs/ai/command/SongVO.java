package com.music.mrs.ai.command;


import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SongVO {
	 	private int song_id;
	    private String title;
	    private String artist;
	    private String videoId;
	    private String category;
	    
	    
	    private List<String> newSongList;

	    public List<String> getNewSongList() {
	        return newSongList;
	    }

	    public void setNewSongList(List<String> newSongList) {
	        this.newSongList = newSongList;
	    }
}
