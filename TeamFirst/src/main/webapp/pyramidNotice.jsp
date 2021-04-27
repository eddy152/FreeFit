<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>pyramidNotice</title>
<script>

// 비주얼섹션 배경 동영상 및 동영상 위젯 자동재생 환경 설정
var section_youtube_list = [];
var yt_player = {};
var vimeo_player = [];
var site_video_list = [];
var video_autoplay_youtube_list = [];
function onYouTubeIframeAPIReady() {
$.each(section_youtube_list,function(_e, _data){
	yt_player[_data.slide_code] = new SITE_SECTION_YOUTUBE();
	yt_player[_data.slide_code].init(_data.type,_data.code,_data.id, _data.slide_code);
});
$.each(video_autoplay_youtube_list, function(k, v){
	site_video_list[v].play();
})
}

$(function() {
$('body').smoothScroll({
	delegateSelector: 'a',
	speed: 1200,
	easing: 'easeInOutExpo'
});
		$('.pms_check').remove();
				var recentScrollUrl = IMWEB_SESSIONSTORAGE.get('RECENT_PROD_SCROLL_URL');
if(recentScrollUrl && recentScrollUrl !== document.location.href){
	IMWEB_SESSIONSTORAGE.remove('RECENT_PROD_SCROLL');
	IMWEB_SESSIONSTORAGE.remove('RECENT_PROD_SCROLL_URL');
}
	});
</script>

</head>
<body>
test1
</body>
</html>