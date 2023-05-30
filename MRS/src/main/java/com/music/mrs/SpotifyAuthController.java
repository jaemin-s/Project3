package com.music.mrs;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import se.michaelthelin.spotify.SpotifyApi;
import se.michaelthelin.spotify.model_objects.credentials.AuthorizationCodeCredentials;
import se.michaelthelin.spotify.requests.authorization.authorization_code.AuthorizationCodeRequest;
import se.michaelthelin.spotify.requests.authorization.authorization_code.AuthorizationCodeUriRequest;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URI;


//SpotifyAccessTokenRequest 클래스:
//이 클래스는 Spotify API를 사용하여 액세스 토큰을 요청하는 유틸리티 클래스입니다.
//requestAccessToken() 메서드를 통해 사용자 인증 및 액세스 토큰을 얻는 작업을 수행합니다.
//이 클래스는 독립적으로 작동하며, 액세스 토큰을 요청하고 얻은 결과를 콘솔에 출력하는 역할을 합니다.
//주로 테스트, 개발 단계에서 사용되며, 얻은 액세스 토큰을 다른 곳에 전달하거나 저장할 필요가 있을 때 활용할 수 있습니다.

@Controller
@SessionAttributes("spotifyApi")
public class SpotifyAuthController {

	@Value("${client.id}")
	private String clientId;

	@Value("${client.secret}")
	private String clientSecret;

	@Value("${redirect.uri}")
	private String redirectUri;

	private SpotifyApi spotifyApi;

	@PostConstruct
	public void initialize() {
		// SpotifyApi 객체를 생성하고 클라이언트 ID, 리디렉션 URI를 설정합니다.
		spotifyApi = new SpotifyApi.Builder()
				.setClientId(clientId)
				.setClientSecret(clientSecret)
				.setRedirectUri(URI.create(redirectUri))
				.build();
	}

	@GetMapping("/login")
	public String login(HttpSession session) {
		// 사용자 인증을 위한 인증 URL을 생성합니다.
		AuthorizationCodeUriRequest authorizationCodeUriRequest = spotifyApi.authorizationCodeUri()
				.scope("user-read-private,user-read-email")
				.show_dialog(true)
				.state("some-state-value")
				.build();

		String authorizationUrl = authorizationCodeUriRequest.execute().toString();

		// 세션에 SpotifyApi 객체를 저장합니다.
		session.setAttribute("spotifyApi", spotifyApi);

		// 생성된 인증 URL로 리다이렉트합니다.
		return "redirect:" + authorizationUrl;
	}

	@GetMapping("/callback")
	public ModelAndView callback(@RequestParam("code") String code,
			@RequestParam("state") String state,
			HttpSession session) {
		// 세션에서 SpotifyApi 객체를 가져옵니다.
		SpotifyApi spotifyApi = (SpotifyApi) session.getAttribute("spotifyApi");

		try {
			// 액세스 토큰 요청을 생성하고 실행합니다.
			AuthorizationCodeRequest authorizationCodeRequest = spotifyApi.authorizationCode(code).build();
			System.out.println(authorizationCodeRequest);

			AuthorizationCodeCredentials authorizationCodeCredentials = authorizationCodeRequest.execute();
			System.out.println(authorizationCodeCredentials);




			// 받은 액세스 토큰을 처리합니다.
			String accessToken = authorizationCodeCredentials.getAccessToken();
			System.out.println(accessToken);
			String refreshToken = authorizationCodeCredentials.getRefreshToken();
			System.out.println(refreshToken);
			int expiresIn = authorizationCodeCredentials.getExpiresIn();
			System.out.println(expiresIn);

			// TODO: 액세스 토큰을 저장하고 필요한 처리를 수행합니다.

			// 사용자 정보를 세션에 저장합니다.
            session.setAttribute("accessToken", accessToken);
            session.setAttribute("refreshToken", refreshToken);
            session.setAttribute("expiresIn", expiresIn);
			
			// 처리 결과를 ModelAndView에 담아 리다이렉트합니다.
			ModelAndView modelAndView = new ModelAndView("redirect:/success");
			modelAndView.addObject("message", "Authentication successful!");
			return modelAndView;
		} catch (Exception e) {
			// 예외 처리
			ModelAndView modelAndView = new ModelAndView("redirect:/error");
			modelAndView.addObject("message", "Authentication failed!");
			return modelAndView;
		}
	}

	@GetMapping("/resources/img/Spotify_Icon_RGB_Black.png")
	public ResponseEntity<Resource> getImageResource(HttpServletRequest request) throws IOException {
		Resource resource = new ClassPathResource("/resources/img/Spotify_Icon_RGB_Black.png");

		if (resource.exists()) {
			return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(resource);
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	// 인증 성공 시 처리할 엔드포인트
	@GetMapping("/success")
	public ModelAndView success(@RequestParam("message") String message) {
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("message", message);
		return modelAndView;
	}

	// 인증 실패 시 처리할 엔드포인트
	@GetMapping("/error")
	public ModelAndView error(@RequestParam("message") String message) {
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("message", message);
		return modelAndView;
	}
}
