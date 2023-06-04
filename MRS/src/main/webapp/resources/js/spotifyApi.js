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

// header
const header = {
    "Authorization" : `Bearer ${accessToken}`,
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
        })
}

//player/play : 트랙리스트 넣기
function startResumePlayback(urisArray) {
    let data = {};
    if(uris.length>0){
       data = JSON.stringify({
            "uris" : urisArray
       }) 
    }

    fetch('https://api.spotify.com/v1/me/player/play',{
                method : "put",
                headers : header,
                body : data
            }).then();
}


//player/next : 다음 곡 재생
function skipToNext(){
    fetch('https://api.spotify.com/v1/me/player/next',{
        method : "post",
        headers : header
    }).then();
}

//player/previous : 이전 곡 재생
function skipToPrevious(){
    fetch('https://api.spotify.com/v1/me/player/previous',{
        method : "post",
        headers : header
    }).then();
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
function getTheUsersQueue(){
    fetch('https://api.spotify.com/v1/me/player/queue',{
        headers : header
    }).then(res => res.json())
    .then(data => {
        console.log(data);
        return data;
    });
}

//search
function searchForItem(query){
    if(arguments.length===0){
        query="";
    }
    let params = "?q="+query+"&type=tracks&market=KR&limit=10";
    fetch('https://api.spotify.com/v1/search'+params,{
        headers : header
    }).then(res=>res.json())
    .then(data => {
        console.log(data);
        return data;
    });
}


//recommendations : 추천 곡 받기
function recommendations(seedArtists,seedTracks){
    let param = "?market=KR&min_popularity=40&seed_artists="+seedArtists+"&seed_tracks="+seedTracks;
    let trackList = [];
    fetch('https://api.spotify.com/v1/recommendations'+param,{
        headers : header
    }).then(res => res.json())
    .then(data => {
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
    });
}



