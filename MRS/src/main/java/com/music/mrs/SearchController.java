package com.music.mrs;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.music.mrs.command.SearchResultVO;

import se.michaelthelin.spotify.SpotifyApi;
import se.michaelthelin.spotify.model_objects.specification.Track;
import se.michaelthelin.spotify.requests.data.search.simplified.SearchTracksRequest;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

@RestController
@SessionAttributes("spotifyApi")
public class SearchController {
	
	@Value("${client.id}")
	private String clientId;

	@Value("${client.secret}")
	private String clientSecret;

	@Value("${redirect.uri}")
	private String redirectUri;
	
	@PostConstruct
	public SpotifyApi spotifyApi() {
        // SpotifyApi 객체 생성 및 설정
        SpotifyApi spotifyApi = new SpotifyApi.Builder()
				.setClientId(clientId)
				.setClientSecret(clientSecret)
				.setRedirectUri(URI.create(redirectUri))
				.build();
        
        // 필요한 설정 등을 수행
        
        return spotifyApi;
    }

    @GetMapping("/search")
    public List<SearchResultVO> searchTracks(@RequestParam String query) {
        List<SearchResultVO> searchResults = new ArrayList<>();

        // Spotify API를 사용하여 검색 요청을 수행합니다.
        SearchTracksRequest searchTracksRequest = spotifyApi().searchTracks(query).build();
        try {
            Track[] tracks = searchTracksRequest.execute().getItems();
            for (Track track : tracks) {
                SearchResultVO searchResult = new SearchResultVO();
                searchResult.setTrackName(track.getName());
                searchResults.add(searchResult);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return searchResults;
    }
}
