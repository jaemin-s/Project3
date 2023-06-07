/*
getPlaybackState() : 재생상태 받아오기, return playerbackState
getAvailableDevices() : diveces 받아오기, return divece_id(String)
startResumePlayback(urisArray) : 특정 곡들 재생 준비, void, player/play
skipToNext() : 다음 곡 재생, void
skipToPrevious() : 이전 곡 재생, void
seekToPosition(position) : 재생 시간 이동, void, default : 0ms
playerRepeat() : 반복 재생모드 순환 track >> context >> off >> track
setPlaybackVolum(vol) : 볼륨 설정, void, default : 0
togglePlaybackShuffle() : 랜덤 모드 토글, void
getTheUsersQueue() : 재생중인 목록 확인, currntly_playing,queue
searchForItem(query) : 검색, return data
recommendations(seedArtists,seedTracks) : 곡과 가수로 추천곡 받기
 */

//player/play : 

const accessToken = document.querySelector('input[name=token]').value;

// header
const header = {
    "Authorization" : `Bearer `+accessToken,
    "Content-Type" : "application/json"
}



//player [get] : 재생상태 받아오기
function getPlaybackState(){
    fetch('https://api.spotify.com/v1/me/player',{
        headers : header
    }).then(res=>res.json())
    .then(data=>{
        console.log(data);
        return data;
    });
}

//player [put] : device 변경
async function transferPlayback(deviceId){
	console.log(deviceId);
    fetch('https://api.spotify.com/v1/me/player',{
    	method : "put",
        headers : header,
        body : JSON.stringify({"device_ids" : [deviceId]})
    });
}


//player/devices : devices 받아오기
function getAvailableDevices(){
    fetch('https://api.spotify.com/v1/me/player/devices',{
			headers : header
		}).then(res=>res.json())
        .then(data => {
            data.devices.forEach(device => {
                if(device.name === "Sim Player"){
                    console.log("device id : "+device.id);
                    return device.id;
                }
            });
            console.log("Sim Player is not found");
            return "";
        });
}

//player/play : 트랙리스트 넣기
async function startResumePlayback(urisArray) {
    let data = {};
    if(urisArray.length>0){
       data = JSON.stringify({
            "uris" : urisArray
       }); 
    }

    fetch('https://api.spotify.com/v1/me/player/play',{
                method : "put",
                headers : header,
                body : data
            });
}


//player/next : 다음 곡 재생
async function skipToNext(){
    fetch('https://api.spotify.com/v1/me/player/next',{
        method : "post",
        headers : header
    });
}

//player/previous : 이전 곡 재생
async function skipToPrevious(){
    fetch('https://api.spotify.com/v1/me/player/previous',{
        method : "post",
        headers : header
    });
}

//player/seek : 재생 시간 이동
function seekToPosition(position){
    if(arguments.length=0){
        position=0;
    }
    fetch('https://api.spotify.com/v1/me/player/seek?position_ms='+position,{
        method : "put",
        headers : header
    }).then(console.log('position: '+position));
}

//player/repeat : 반복 재생 모드 설정 track,context,off
function playerRepeat(){
    const preRepeatState = getPlaybackState().repeat_state;
    let newRepeatState ="";
    if(preRepeatState === 'track'){
        newRepeatState = 'context';
    }else if(preRepeatState === 'context'){
        newRepeatState = 'off';
    }else{
        newRepeatState = 'track';
    }
    fetch('https://api.spotify.com/v1/me/player/repeat'+newRepeatState,{
        method : 'put',
        headers : header
    }).then(res=> {
        console.log('이전 반복 재생 모드: '+preRepeatState);
        console.log('바뀐 반복 재생 모드: '+newRepeatState);
    });

}

//player/volume
function setPlaybackVolum(vol){
    if(arguments.length===0){
        vol = 0;
    }
    fetch('https://api.spotify.com/v1/me/player/volume?volume_percent='+vol,{
        method : 'put',
        headers : header
    }).then(console.log('volume: '+vol));
}

//player/shuffle
function togglePlaybackShuffle(){
    let shuffleState = getPlaybackState().shuffle_state;
    fetch('https://api.spotify.com/v1/me/player/shuffle?state='+!shuffleState,{
        method : 'put',
        headers : header
    }).then(console.log('바뀐 랜덤 모드'+!shuffleState));
}

//player/queue
async function getTheUsersQueue(){
    const res = await fetch('https://api.spotify.com/v1/me/player/queue',{
        headers : header
    });
    const data = await res.json();
        console.log(data);
        return data;
}

//search
async function searchForItem(query){
    if(arguments.length===0){
        query="";
    }
    let params = "?q="+query+"&type=track&market=KR&limit=10";
    let res = await fetch('https://api.spotify.com/v1/search'+params,{
        headers : header});
    let data = await res.json();    
    console.log(data);
    
    return data;
}

async function recommendations(seedArtists,seedTracks){
    let param = "?market=KR&min_popularity=40&seed_artists="+seedArtists+"&seed_tracks="+seedTracks;
    let trackList = [];
    const res = await fetch('https://api.spotify.com/v1/recommendations'+param,{
        headers : header
    });
    const data = await res.json();
    [...data.tracks].forEach(track => {
        trackList.push({
            "uri" : track.uri,
            "track_name" : track.name,
            "track_id" : track.id,
            "artists_name" : track.artists[0].name,
            "artists_id" : track.artists[0].id,
            "image" : track.album.images[0].url
        });
    });
    console.log(trackList);
    return trackList;
}

//현재 시간 변경
const $timeP = document.querySelector("#time p"); //현재 시간 p
const $totalTimeP = document.querySelector("#total-time p"); //트랙 길이 p
let currentTime = 0;
let isStop = true;
let setTime = setInterval(function(){
		if(!isStop){
			currentTime++;
			$timeP.textContent = addZero(Math.floor(currentTime/60))+":"+addZero(Math.floor(currentTime%60));
			document.getElementById('range-val').value = Math.floor(currentTime);
		}
	},1000);
	
document.getElementById('range-val').addEventListener('mouseup',()=>{
	console.log(document.getElementById('range-val').value);
	seekToPosition((document.getElementById('range-val').value)*1000);
});
	
function addZero(i){//0더해주는 함수
	if(i<10) return "0"+i;
	else return i;
}
//SDK준비
window.onSpotifyWebPlaybackSDKReady = () => {
    const token = accessToken;
    player = new Spotify.Player({
        name: 'Sim Player',
        getOAuthToken: cb => { cb(token); },
        volume: 0.5
    });

    // Ready
    player.addListener('ready', ({ device_id }) => {
        console.log('Ready with Device ID', device_id);
        transferPlayback(device_id);
    });

    // Not Ready
    player.addListener('not_ready', ({ device_id }) => {
        console.log('Device ID ha   s gone offline', device_id);    
    });
    
    player.connect();
    player.activateElement();    
        
	let previousTrackId = null;
    //재생 상태 변경 감지
    player.addListener('player_state_changed', ({
        position,
        duration,
        paused,
        track_window: { current_track }

    }) => {
        //재생목록 디테일에 출력
        getTheUsersQueue().then(data =>{
            console.log("queue 가져오기");
  			//현재 재생목록 출력
            [...document.querySelector('.playlist ul.comments-body').children].forEach(child =>child.remove());
            document.querySelector('.playlist ul.comments-body').insertAdjacentHTML('beforeend',`
            <li>
                <div class="comments-image" data-url="`+data.currently_playing.album.images[0].url+`"><img src="`+data.currently_playing.album.images[0].url+`"></img></div>
                <div class="comments-title" data-track-id="`+data.currently_playing.id+`" data-track-uri="`+data.currently_playing.uri+`">`+data.currently_playing.name+`</div>
                <div class="comments-artists" data-artists-id="`+data.currently_playing.artists[0].id+`">`+data.currently_playing.artists[0].name+`</div>
            </li>
            `);
            //대기열 목록 출력
            [...data.queue].forEach(track=>{
                document.querySelector('.playlist ul.comments-body').insertAdjacentHTML('beforeend',`
            <li>
                <div class="comments-image" data-url="`+track.album.images[0].url+`"><img src="`+track.album.images[0].url+`"></img></div>
                <div class="comments-title" data-track-id="`+track.id+`" data-track-uri="`+track.uri+`">`+track.name+`</div>
                <div class="comments-artists" data-artists-id="`+track.artists[0].id+`">`+track.artists[0].name+`</div>
            </li>
            `);
            })
            //컨트롤러 및 디테일 페이지 정보 넣기
            document.querySelector('.cover-img').setAttribute('src', data.currently_playing.album.images[0].url);
            document.querySelector('.singer-name').textContent = data.currently_playing.artists[0].name;
            document.querySelector('.song-title').textContent = data.currently_playing.name;
            document.querySelector('.teamTitle').textContent =
            data.currently_playing.artists[0].name+" - "+data.currently_playing.name;
		 });

	//컨트롤러 시간 표시
    $timeP.textContent = addZero(Math.floor((position/1000)/60)) +":"+addZero(Math.floor((position/1000)%60));
    $totalTimeP.textContent = addZero(Math.floor((duration/1000)/60))+":"+addZero(Math.floor((duration/1000)%60));

	currentTime = position/1000;
	document.getElementById('range-val').max = Math.floor(duration/1000);
	
    //재생버튼 변경
    if(paused){ //정지중이면
    	isStop = true;
        document.getElementById("controller-play").style.display = "block";
        document.getElementById("controller-pause").style.display = "none";
        document.getElementById("airImg").setAttribute('src', "./img/air.png");
        document.querySelector(".side-back").style.backgroundImage = 'url("./img/animation3.png")';
    }else { //재생중이면
    	isStop = false;
        document.getElementById("controller-play").style.display = "none";
        document.getElementById("controller-pause").style.display = "block";
        document.getElementById("airImg").setAttribute('src', "./img/air2.png");
        document.querySelector(".side-back").style.backgroundImage = 'url("./img/animation2.gif")';
    }

    });//end player.addListener('player_state_changed'	
    
         const currentTrackId = current_track.id;

         if (currentTrackId !== previousTrackId) {
         previousTrackId = currentTrackId;
         
         fetch('/mrs/plus', {
             method: 'POST',
             headers: {
                 'Content-Type': 'application/json'
             },
             body: JSON.stringify({

                 'currentTrack': current_track.id

             })

         }).then((response) => {
             console.log('current_track 전송 성공');
             fetch('/mrs/getrmno', {
                 method: 'POST',
                 headers: {
                     'Content-Type': 'application/json'
                 },
                 body: JSON.stringify({
                     'currentTrack': current_track.id
                 })
             }).then(response => response.json())
             .then(data => {
                 const rmno = data.rmno;
                 // 브라우저 저장소에 rmno 데이터를 저장하고, detail.jsp 페이지를 엽니다.
                 localStorage.setItem('rmno', rmno);
                 
                 /* console.log('이거 되는지 확인'+getList(1,true)); */
                     
                 getList(1,true);
                  
                 
             }).catch(error => {
                 console.error('Error:', error);
             });
         })
        }

        //컨트롤러 및 디테일 페이지 정보 넣기
        document.querySelector('.cover-img').setAttribute('src',current_track.album.images[0].url);
        document.querySelector('.singer-name').textContent = current_track.artists[0].name;
        document.querySelector('.song-title').textContent = current_track.name;
        document.querySelector('.teamTitle').textContent =
        current_track.artists[0].name+" - "+current_track.name;

}//end window.onSpotifyWebPlaybackSDKReady

<<<<<<< HEAD
	//재생 위치 변경
	const $rangeVal = document.getElementById("range-val");
	$rangeVal.mouseup = seekToPosition(($rangeVal.value)*1000);
	
	//시간 지나가게 만들기
	function goTime() {
		 const going = setInterval(() => {
		 	if($rangeVal.value == $rangeVal.max) {
				clearInterval(going);
				$rangeVal.value = 0;
				return;
			}
			$rangeVal.value = ($rangeVal.value)+1;
	        
		  }, 1000);
	}
	
	//시간 멈추기
	function stopTime() {
		clearInterval(going);
	}
	
	//현재 시간 변경
	const $timeP = document.querySelector("#time p");
	
	$rangeVal.addEventListener("input", function() {
	    let value = $rangeVal.value;
	    let minutes = Math.floor(value / 60);
	    let seconds = value % 60;
	    let formattedTime = minutes.toString().padStart(2, "0") + ":" + seconds.toString().padStart(2, "0");
	
	    $timeP.textContent = formattedTime;
	});
	
	const $totalTimeP = document.querySelector("#total-time p");
	
	$rangeVal.addEventListener("input", function() {
	    let mValue = $rangeVal.max;
	    let mMinutes = Math.floor(mValue / 60);
	    let mSeconds = mValue % 60;
	    let mFormattedTime = minutes.toString().padStart(2, "0") + ":" + seconds.toString().padStart(2, "0");
	
	    $totalTimeP.textContent = mFormattedTime;
	});
=======

>>>>>>> 9e96f80da9f2c865b4878e81ff27b8c9d996a5ab

