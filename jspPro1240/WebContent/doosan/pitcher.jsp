<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투수 소개 페이지입니다.</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	var currentPosition=parseInt($("#slidemenu").css("top"));
	$(window).scroll(function(){
		var position=$(window).scrollTop();
		console.log("스크롤바의 좌표: "+position);
		$("#slidemenu").stop().animate({
			"top" : position+currentPosition+"px"
		},100);
	});
	$("#btnLogout").click(function(){
		location.href="${path}/member_servlet/logout.do";
	});
});
function check() {
	var pitchers = document.input.pitchers.value;
	if(pitchers == "") {
		alert("초성을 선택해주세요.");
		document.input.pitchers.focus();
		return;
    }
	document.input.submit();
}
</script>
<style type="text/css">
#slidemenu{
	position: absolute; 
	width: 200px;
	top: 210px;
	right: 10px;
}
body { background-color: #9978AD; }
header {
	background-color: #C8AED1;
}
header img.logo { 
	width: 100px; 
	height: 100px; 
	margin: 5px; 
	float: left;
}
header div.mainTop {
	font-size: 70px;
	font-weight: bolder;
	text-align: center;
}
#mainTop{
	color: #462456;
}
#member{
	font-size: 20px;
	font-weight: normal;
}
#btnLogout{
	font-size: 20px;
	font-weight: normal;
}
header div.divLine {
	border-bottom: solid;
	border-bottom-width: 3px;
	border-bottom-color: #302E56;
}
ol {
    list-style: none;
    text-align: center;
    padding: 10px 0;
}
ol li {
	display: inline;
    padding: 0px 100px 0px 100px;
    letter-spacing: 5px;
    font-weight: bold;
    font-size: 20px;
}
ol li a {
      text-decoration: none; color: #462456;
}
ol li a:hover {
      text-decoration: none;
      text-shadow: 5px 5px 10px #462456;
}
a img.sns{
	width: 50px; 
	height: 50px;
	margin: auto;
}
</style>
</head>
<body>
<div id="slidemenu">
<a href="http://www.doosanbearswefan.shop/shop/main/index.php" target="_blank">
<img src="../images/두산베어스.jpg" width="200" height="200"></a>
</div>
<form name="input" method="post" action="pitcher2.jsp">
<div id="doosan">
	<header>
		<div class="mainTop">
			<a href="main.jsp"><img class="logo" src="../images/doosanLogo.jpg"></a>
			<a href="main.jsp" id="mainTop">DOOSAN BEARS</a>
			<a href="member.jsp" id="member">회원가입</a>
			<c:if test="${sessionScope.userid==null}">
				<a href="login.jsp" id="member">로그인</a>
			</c:if>
			<c:if test="${sessionScope.userid!=null}">
				<a href="${path}/member_servlet/add.do?userid=${sessionScope.userid}" id="member">${sessionScope.userid}님</a>
			</c:if>
			<c:if test="${sessionScope.userid!=null}">
				<button type="button" id="btnLogout">로그아웃</button>
			</c:if>
		</div>
		<div class="divLine"></div>
		<ol>
			<li><a href="coach.jsp">코칭스태프</a></li>
 			<li><a href="pitcher.jsp">투수</a></li>
 			<li><a href="community.jsp">커뮤니티</a></li>
		</ol>
		<div class="divLine"></div>
	</header>
	<h1 style="text-align: center;"> 원하는 투수의 성의 초성을 선택하세요. </h1>
	<select style="margin-left: 900px;" name="pitchers" multiple size="10">
		<option value="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄱ</option>
		<option value="b">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ</option>
		<option value="c">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄷ</option>
		<option value="d">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄹ</option>
		<option value="e">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅁ</option>
		<option value="f">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅂ</option>
		<option value="g">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅅ</option>
		<option value="h">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</option>
		<option value="i">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅈ</option>
		<option value="j">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅊ</option>
		<option value="k">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅋ</option>
		<option value="l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅌ</option>
		<option value="m">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅍ</option>
		<option value="n">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅎ</option>
	</select>
	<input type="button" value="검색" style="margin: 2px; width: 65px; height: 30px; font-size: 15px" onclick="check()">
	
</div>
</form>
	<footer style="clear: both; vertical-align: bottom;" >
	<div style="text-align:center;">Copyright 2018 by Goya. All rights reserved</div>	
	<p style="margin:auto; ">
		<a href="https://www.facebook.com/Bearspotv" target="_blank"><img class="sns" src="../images/facebook.jpg" style="margin-left: 850px;"></a>
		<a href="https://twitter.com/hashtag/%EB%B2%A0%EC%96%B4%EC%8A%A4%ED%8F%AC%ED%8B%B0%EB%B9%84?src=hash" target="_blank"><img class="sns" src="../images/twitter.png"></a>
		<a href="https://www.instagram.com/explore/tags/%EB%B2%A0%EC%96%B4%EC%8A%A4%ED%8F%AC%ED%8B%B0%EB%B9%84/" target="_blank"><img class="sns" src="../images/instagram.jpg"></a>
		<a href="https://www.youtube.com/channel/UCsebzRfMhwYfjeBIxNX1brg" target="_blank"><img class="sns" src="../images/youtube.jpg"></a>
	</p>	
	</footer>
</body>
</html>