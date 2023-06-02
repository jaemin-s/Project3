package com.music.mrs.command;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 *  CREATE TABLE user (
	email VARCHAR(250) primary key,
	display_name VARCHAR(250) NOT NULL    
);
 * 
 */


@Getter
@Setter
@ToString
public class UserVO {
	
	@JsonProperty("display_name")
	private String displayName;
	
	@JsonProperty("display_email")
	private String email;
	
	public UserVO( ) {	}
	
}
