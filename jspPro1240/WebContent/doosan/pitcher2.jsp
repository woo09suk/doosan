<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선택한 초성이 포함된 투수들 입니다.</title>
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
.profile{
	float: left;
	margin-right: 15px;
}
table {
        border-collapse: collapse;
        width:600px;
        margin-right: auto;
}
td {
        color: black;
        background-color: #9978AD;
        height: 50px;
        width: 200px;
        text-align: center; 
        vertical-align: middle;
        font-weight: bold;
}
table, td {
        border: 2px solid black;
}
</style>
</head>
<body>
<div id="slidemenu">
<a href="http://www.doosanbearswefan.shop/shop/main/index.php" target="_blank">
<img src="../images/두산베어스.jpg" width="200" height="200"></a>
</div>
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
	<h1 style="color: green; text-align: center;">선수 사진을 클릭할 시 해당 선수의 KBO 기록을 보러 가실 수 있습니다.</h1><br>
	<%
	String pitchers=request.getParameter("pitchers");
	String name="";
	switch(pitchers){
	case "a":
		name="ㄱ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=66201" target="_blank">
		<img src="../images/고봉재.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>고봉재</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>38</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1993년 05월 14일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우언우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>185cm/86kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>감천초-대동중-경남고-호원대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>16두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>16 두산 2차 3라운드 25순위</td>
  			</tr>		
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68220" target="_blank">
  		<img src="../images/곽빈.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>곽빈</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>20</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1999년 05월 28일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>187cm/95kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>학동초-자양중-배명고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 1차</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=77263" target="_blank">
  		<img src="../images/김강률.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>김강률</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>27</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1988년 08월 28일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>187cm/95kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>문촌초(일산리틀)-장성중-경기고-두산-상무</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>07두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>07 두산 2차 4라운드 26순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=67246" target="_blank">
  		<img src="../images/김명신.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>김명신</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>46</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1993년 11월 29일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>178cm/90kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>남도초-대구중-경북고-경성대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>17두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>17 두산 2차 2라운드 20순위</td>
  			</tr>  			
  		</table><br><br>  		
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68200" target="_blank">
  		<img src="../images/김민규.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>김민규</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>00</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1999년 05월 07일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/90kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>(광진구리틀)-잠신중-휘문고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 2차 3라운드 30순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=73248" target="_blank">
  		<img src="../images/김승회.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>김승회</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>16</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1981년 02월 11일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>177cm/85kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>역삼초-배명중-배명고-탐라대-두산-롯데-SK</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>03두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>03 두산 2차 5라운드 40순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=61962" target="_blank">
  		<img src="../images/김정후.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>김정후</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>31</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1988년 09월 26일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>178cm/95kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>고명초-건대부중-경동고-단국대-상무-SK</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>11상무</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>13 SK 10라운드 87순위</td>
  			</tr>  			
  		</table><br><br>
		<% 
		break;
	case "b":
		name="ㄴ";%>
		<h2 style="text-align: center;">ㄴ으로 시작하는 초성을 가진 투수가 없습니다.</h2>
		<%
		break;
	case "c":
		name="ㄷ";%>
		<h2 style="text-align: center;">ㄷ으로 시작하는 초성을 가진 투수가 없습니다.</h2>
		<%
		break;
	case "d":
		name="ㄹ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=65543" target="_blank">
  		<img src="../images/린드블럼.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>린드블럼</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>34</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1987년 06월 15일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>195cm/105kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>미국 Harrison(고)-미국 Purdue(대)-롯데</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>15롯데</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>15 롯데 자유선발</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "e":
		name="ㅁ";%>
		<h2 style="text-align: center;">ㅁ으로 시작하는 초성을 가진 투수가 없습니다.</h2>
		<%
		break;
	case "f":
		name="ㅂ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68201" target="_blank">
  		<img src="../images/박성모.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>박성모</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>64</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1995년 02월 22일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>186cm/86kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>군산남초-군산남중-군산상고-인하대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 2차 7라운드 70순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68249" target="_blank">
  		<img src="../images/박신지.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>박신지</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>49</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1999년 07월 16일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>185cm/75kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>목암초(의정부시리틀)-영동중-경기고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 2차 1라운드 10순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=63292" target="_blank">
  		<img src="../images/박종기.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>박종기</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>18</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1995년 01월 21일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>177cm/68kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>우암초-청주중-청주고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>15두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>13 두산 육성선수</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=67266" target="_blank">
  		<img src="../images/박치국.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>박치국</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>66</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1998년 03월 10일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우언우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>177cm/78kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>인천숭의초-신흥중-제물포고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>17두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>17 두산 2차 1라운드 10순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68207" target="_blank">
  		<img src="../images/배창현.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>배창현</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>107</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1998년 12월 09일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/78kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>본리초-대구중-경북고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 2차 5라운드 50순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=62263" target="_blank">
  		<img src="../images/변진수.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>변진수</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>17</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1993년 04월 01일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우언우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>178cm/78kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>사파초-충암중-충암고-두산-경찰</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>12두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>12 두산 2라운드 13순위</td>
  			</tr>  			
  		</table><br><br>
  		<%
		break;
	case "g":
		name="ㅅ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68208" target="_blank">
  		<img src="../images/신현수.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>신현수</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>108</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1999년 06월 10일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>189cm/109kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>군산남초-군산중-대전고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 2차 8라운드 80순위</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "h":
		name="ㅇ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=66160" target="_blank">
  		<img src="../images/유재유.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>유재유</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>63</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1997년 03월 03일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>181cm/86kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>갈산초-양천중-충암고-LG</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>16LG</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>16 LG 2차 1라운드 7순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=79229" target="_blank">
  		<img src="../images/유희관.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>유희관</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>29</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1986년 06월 01일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>180cm/88kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>방배초-이수중-장충고-중앙대-두산-상무</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>09두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>09 두산 2차 6라운드 42순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=66291" target="_blank">
  		<img src="../images/이영하.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>이영하</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>50</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1997년 11월 01일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>192cm/91kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>영일초-강남중-선린인터넷고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>17두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>16 두산 1차</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=77211" target="_blank">
  		<img src="../images/이용찬.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>이용찬</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>45</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1989년 01월 02일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>185cm/85kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>신원초-양천중-장충고-두산-상무</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>07두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>07 두산 1차</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=76329" target="_blank">
  		<img src="../images/이현승.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>이현승</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>3</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1983년 10월 11일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>179cm/87kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>서화초-대헌중-동산고-인하대-현대-우리-히어로즈-두산-상무</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>06현대</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>02 현대 2차 3라운드 26순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=61214" target="_blank">
  		<img src="../images/이현호.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>이현호</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>11</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1992년 07월 14일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>185cm/80kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>인천숭의초-동인천중-제물포고-두산-상무</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>11두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>11 두산 2라운드 11순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=60441" target="_blank">
  		<img src="../images/임진우.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>임진우</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>19</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1987년 05월 13일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>186cm/98kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>삼전초-배명중-배명고-고려대-삼성-경찰-삼성</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>10삼성</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>10 삼성 1라운드 5순위</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "i":
		name="ㅈ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=60255" target="_blank">
  		<img src="../images/장민익.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>장민익</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>26</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1991년 02월 05일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>207cm/99kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>순천북초-이수중-효천고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>10두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>10 두산 1라운드 7순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=74513" target="_blank">
  		<img src="../images/장원준.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>장원준</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>28</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1985년 07월 31일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>184cm/85kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>경력: 부산수영초-대동중-부산고-(영남사이버대)-롯데-경찰-롯데</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>04롯데</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>04 롯데 1차</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68209" target="_blank">
  		<img src="../images/정우석.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>정우석</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>109</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1999년 10월 05일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>188cm/90kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>이수초-휘문중-신일고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 2차 9라운드 90순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68242" target="_blank">
  		<img src="../images/정철원.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>정철원</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>42</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1999년 03월 27일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>190cm/95kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>역북초-송전중-안산공고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 2차 2라운드 20순위</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "j":
		name="ㅊ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=74543" target="_blank">
  		<img src="../images/최대성.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>최대성</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>30</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1985년 05월 17일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/106kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>동삼초-부산중-부산고-롯데-KT</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>04롯데</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>04 롯데 2차 2라운드 9순위</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "k":
		name="ㅋ";%>
		<h2 style="text-align: center;">ㅋ으로 시작하는 초성을 가진 투숙가 없습니다.</h2>
		<%
		break;
	case "l":
		name="ㅌ";%>
		<h2 style="text-align: center;">ㅌ으로 시작하는 초성을 가진 투수가 없습니다.</h2>
		<%
		break;
	case "m":
		name="ㅍ";%>
		<h2 style="text-align: center;">ㅍ으로 시작하는 초성을 가진 투수가 없습니다.</h2>
		<%
		break;
	case "n":
		name="ㅎ";%>
		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=64255" target="_blank">
  		<img src="../images/한주성.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>한주성</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>55</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1995년 02월 26일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>184cm/90kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>영랑초-자양중-덕수고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>14두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>14 두산 1차</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=63248" target="_blank">
  		<img src="../images/함덕주.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>함덕주</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>1</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1995년 01월 13일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>마무리투수(좌투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>181cm/78kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>일산초-원주중-원주고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>13두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>13 두산 5라운드 43순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68260" target="_blank">
  		<img src="../images/현도훈.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>현도훈</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>60</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1993년 01월 13일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(우투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>188cm/89kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>풍양초-신일중-일본 교토고쿠사이고-일본 큐슈교리츠대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 육성선수</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=78247" target="_blank">
  		<img src="../images/홍상삼.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>홍상삼</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>47</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1990년 02월 13일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>중계투수(우투좌타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>188cm/85kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>영일초-충암중-충암고-두산-경찰</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>08두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>08 두산 2차 3라운드 20순위</td>
  			</tr>  			
  		</table><br><br>
  		<a href="https://www.koreabaseball.com/Record/Player/PitcherDetail/Basic.aspx?playerId=68240" target="_blank">
  		<img src="../images/후랭코프.png" class="profile" width="434px" height="434px"></a><br>
		<table>
			<tr>
    			<td>선수명</td> 
    			<td>후랭코프</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>40</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1988년 08월 27일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>선발투수(우투우타)</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>195cm/95kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>미국 North Carolina at Wilmington(대)</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>18두산</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>18 두산 자유선발</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	}
	%>
	<footer style="clear: both;">
	<div style="text-align:center;">Copyright 2018 by Goya. All rights reserved</div>	
	<p style="margin:auto; ">
		<a href="https://www.facebook.com/Bearspotv" target="_blank"><img class="sns" src="../images/facebook.jpg" style="margin-left: 850px;"></a>
		<a href="https://twitter.com/hashtag/%EB%B2%A0%EC%96%B4%EC%8A%A4%ED%8F%AC%ED%8B%B0%EB%B9%84?src=hash" target="_blank"><img class="sns" src="../images/twitter.png"></a>
		<a href="https://www.instagram.com/explore/tags/%EB%B2%A0%EC%96%B4%EC%8A%A4%ED%8F%AC%ED%8B%B0%EB%B9%84/" target="_blank"><img class="sns" src="../images/instagram.jpg"></a>
		<a href="https://www.youtube.com/channel/UCsebzRfMhwYfjeBIxNX1brg" target="_blank"><img class="sns" src="../images/youtube.jpg"></a>
	</p>	
	</footer>
</div>
</body>
</html>