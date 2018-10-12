<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>두산베어스 회원가입</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	slidemenu();
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});
function slidemenu(){
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
h2{
	color: aqua;
	text-align: center;
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
	<h2>회원가입</h2>
	<div style="text-align: center; margin-left: 600px;">
		<form name="form1" method="post" action="${path}/member_servlet/join.do">
		<fieldset >
		<table width="700px">
  			<tr>
    			<td>아이디</td>
    			<td><input name="userid" id="userid" size=50></td>
  			</tr>
  			<tr>
    			<td>비밀번호</td>
    			<td><input type="password" name="passwd" id="passwd" size=50></td>
  			</tr>
  			<tr>
    			<td>이름</td>
    			<td><input name="name" id="name" size=50></td>
  			</tr>
  			<tr>
    			<td>이메일</td>
    			<td><input name="email" id="email" size=50></td>
  			</tr>
  			<tr>
    			<td>핸드폰번호</td>
    			<td><input name="hp" id="hp" size=50></td>
  			</tr>
  			<tr>
    			<td>주소</td>
    			<td><input name="address" id="address" size=50></td>
  			</tr>
  			<tr>
    			<td colspan="2" align="center"><input type="button" value="확인" id="btnSave"></td>
  			</tr>
  		</table>
  		</fieldset>
		</form>
	</div>
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