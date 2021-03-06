<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>두산베어스 커뮤니티 게시판 게시글 상세화면</title>
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
	comment_list();
	$("#btnLogout").click(function(){
		location.href="${path}/member_servlet/logout.do";
	});
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/member_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/member_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/member_servlet/pass_check.do";
		document.form1.submit();
	});
});
function comment_add(){
	var param="board_num=${dto.num}&writer="
	+$("#writer").val()+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/member_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}
function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/member_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
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
a img.doosanBears{
	width: 500px; 
	height: 500px; 
	margin: 50px 100px 100px 300px;
	float: left;
}
a img.kbo{
	width: 500px; 
	height: 500px; 
	margin: 50px 300px 100px 100px;
	float: right; 
}
a img.sns{
	width: 50px; 
	height: 50px;
	margin: auto; 
}
h2{
	color: maroon;
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
			<a href="${path}/doosan/main.jsp"><img class="logo" src="../images/doosanLogo.jpg"></a>
			<a href="${path}/doosan/main.jsp" id="mainTop">DOOSAN BEARS</a>
			<a href="${path}/doosan/member.jsp" id="member">회원가입</a>
			<c:if test="${sessionScope.userid==null}">
				<a href="${path}/doosan/login.jsp" id="member">로그인</a>
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
			<li><a href="${path}/doosan/coach.jsp">코칭스태프</a></li>
 			<li><a href="${path}/doosan/pitcher.jsp">투수</a></li>
 			<li><a href="${path}/doosan/community.jsp">커뮤니티</a></li>
		</ol>
		<div class="divLine"></div>
	</header>
	<h2>커뮤니티 게시판 게시글 상세화면</h2>
	<form name="form1" method="post" style="margin-left: 600px;">
		<table width="700px">
			<tr>
				<td>날짜</td>
				<td>${dto.reg_date}</td>
				<td>조회수</td>
				<td>${dto.readcount}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="3">${dto.writer}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${dto.subject}</td>
			</tr>
			<tr>
				<td>본문</td>
				<td colspan="3">${dto.content}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="3">
					<input type="password" name="passwd" id="passwd">
					<c:if test="${param.message == 'error' }">
						<span style="color:red">비밀번호가 일치하지 않습니다.</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3">
					<c:if test="${dto.filesize > 0 }">${dto.filename}(${dto.filesize} bytes )
						<a href="${path}/member_servlet/download.do?num=${dto.num}">[다운로드]</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="hidden" name="num" value="${dto.num}">
					<input type="button" value="수정/삭제" id="btnEdit">
					<input type="button" value="답변" id="btnReply">
					<input type="button" value="목록" id="btnList">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<table width="700px" style="margin-left: 600px;">
		<tr>
			<td><input id="writer" placeholder="이름"></td>
			<td rowspan="2"><button id="btnSave" type="button">확인</button></td>
		</tr>
		<tr>
			<td><textarea rows="5" cols="80" placeholder="내용을 입력하세요" id="content"></textarea></td>
		</tr>
	</table>
	<div id="commentList"></div>
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