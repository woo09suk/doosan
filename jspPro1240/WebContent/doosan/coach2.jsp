<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선택한 초성이 포함된 코치들 입니다.</title>
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
	<%
	String coaches=request.getParameter("coaches");
	String name="";
	switch(coaches){
	case "a":
		name="ㄱ";%>
		<img src="../images/강동우.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>강동우</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>81</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1974년 04월 20일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 타격코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>177cm/78kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>칠성초-경상중-경북고-단국대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2014</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>		
  		</table><br><br>
  		<img src="../images/강석천.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>강석천</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>86</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1967년 12월 07일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 감독</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>185cm/87kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>신탄진초-한밭중-대전고-인하대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2015</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/고토.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>고토</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>89</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1969년 05월 14일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 타격코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>185cm/85kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>日츄코교-요미우리 자이언츠</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2018</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/공필성.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>공필성</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>70</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1967년 10월 10일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 작전 및 주루코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>178cm/74kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>제황초–진해남중–마산상고–경성대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2015</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>  		
  		<img src="../images/구강현.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>구강현</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>91</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1985년 04월 02일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 수비코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>182cm/83kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>감천초-대동중-부산고-송원대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2015</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/권명철.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>권명철</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>82</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1969년 10월 28일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 투수코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/90kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>서화초-동인천중-인천고-인하대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2011</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/김강.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>김강</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>92</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1988년 10월 16일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 타격코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>188cm/92kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>화정초-무등중-광주제일고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2012</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>2012 2차 드래프트</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/김진수.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>김진수</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>80</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1979년 04월 19일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 배터리코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>180cm/90kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>양정초-개성중-경남고-대불</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2011</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/김태균.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>김태균</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>79</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1971년 08월 19일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 주루코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>176cm/76kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>수영초 - 부산고 - 중앙대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2018</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/김태형.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>김태형</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>88</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1967년 09월 12일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 감독</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>173cm/76kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>화계초-신일중-신일고-단국대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2014</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
		<% 
		break;
	case "b":
		name="ㄴ";%>
		<h2 style="text-align: center;">ㄴ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "c":
		name="ㄷ";%>
		<h2 style="text-align: center;">ㄷ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "d":
		name="ㄹ";%>
		<h2 style="text-align: center;">ㄹ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "e":
		name="ㅁ";%>
		<h2 style="text-align: center;">ㅁ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "f":
		name="ㅂ";%>
		<img src="../images/박철우.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>박철우</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>87</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1964년 04월 12일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 벤치코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>181cm/91kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>월산초-전남중-제일고-동국대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2015</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<%
		break;
	case "g":
		name="ㅅ";%>
		<h2 style="text-align: center;">ㅅ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "h":
		name="ㅇ";%>
		<img src="../images/유지훤.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>유지훤</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>74</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1955년 10월 04일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 재활코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>174cm/72kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>대신초-대동중-대광고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2014</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/유태현.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>유태현</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>102</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1982년 04월 27일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 트레이닝코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>175cm/73kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>효성동초-청천중-부평고-한국체대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2016</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/이강철.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>이강철</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>71</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1966년 05월 24일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 수석코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>180cm/78kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>광주서림초-무등중-광주제일고-동국대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2017</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/이광우.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>이광우</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>83</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1965년 03월 14일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 트레이닝코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>182cm/83kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>군산상고-원광대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2014</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/이병국.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>이병국</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>101</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1980년 07월 13일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 트레이닝코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>186cm/93kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>숭의초-대헌중-동산고-경희대-경희대학원</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2015</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/이용호.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>이용호</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>85</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1970년 05월 06일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 투수코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>180cm/86kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>서울영일초-우신중-서울고-건국대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2017</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "i":
		name="ㅈ";%>
		<img src="../images/장원진.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>장원진</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>76</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1969년 06월 15일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 재활코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>188cm/97kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>신흥초-상인천중-인천고-인하대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2011</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/정재훈.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>정재훈</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>73</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1980년 01월 01일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 투수코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>179cm/81kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>역삼초-휘문중-휘문고-성균관대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2003</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/조경택.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>조경택</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>72</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1970년 11월 25일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 재활코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/95kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>중앙초-원주중-원주고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2015</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/조성환.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>조성환</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>77</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1976년 12월 23일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 수비코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>180cm/83kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>백운초-충암중-충암고-원광대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2018</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/조웅천.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>조웅천</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>84</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1971년 03월 17일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 투수코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/82kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>광주남초-무등중-순천상고</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2017</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/조인성.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>조인성</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>75</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1975년 05월 25일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 배터리코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/99kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>수유초-신일중-신일고-연세대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2018</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "j":
		name="ㅊ";%>
		<img src="../images/천종민.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>천종민</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>103</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1984년 10월 30일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>1군 트레이닝코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>183cm/92kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>사직초-청주남중-오창고-한남대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2017</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/최경환.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>최경환</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>90</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1972년 05월 12일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 타격코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>181cm/81kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>남부초-성남중-성남고-경희대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2017</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
  		<img src="../images/최해명.png" class="profile" width="434px" height="434px"><br>
		<table>
			<tr>
    			<td>코치명</td> 
    			<td>최해명</td>
    		</tr>
  			<tr>
  				<td>등번호</td>
  				<td>78</td>
  			</tr>
  			<tr>
  				<td>생년월일</td>
  				<td>1964년 12월 25일</td>
  			</tr>
  			<tr>
  				<td>포지션</td>
  				<td>2군 수비코치</td>
  			</tr>
  			<tr>
  				<td>신장/체중</td>
  				<td>173cm/75kg</td>
  			</tr>
  			<tr>
  				<td>경력</td>
  				<td>포항초-포항중-포철공고-연세대</td>
  			</tr>
  			<tr>
  				<td>입단년도</td>
  				<td>2014</td>
  			</tr>
  			<tr>
  				<td>지명순위</td>
  				<td>-</td>
  			</tr>  			
  		</table><br><br>
		<%
		break;
	case "k":
		name="ㅋ";%>
		<h2 style="text-align: center;">ㅋ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "l":
		name="ㅌ";%>
		<h2 style="text-align: center;">ㅌ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "m":
		name="ㅍ";%>
		<h2 style="text-align: center;">ㅍ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
		<%
		break;
	case "n":
		name="ㅎ";%>
		<h2 style="text-align: center;">ㅎ으로 시작하는 초성을 가진 코칭스태프가 없습니다.</h2>
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