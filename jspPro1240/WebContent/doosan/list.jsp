<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>두산베어스 커뮤니티 게시판</title>
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
	$("#btnWrite").click(function(){
		location.href="${path}/doosan/write.jsp";
	});
	$("#btnWrite2").click(function(){
		alert("로그인을 해주세요");
		location.href="${path}/doosan/login.jsp";
	});
});
function list(page){
	location.href="${path}/member_servlet/list.do?curPage="+page;
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
	color: blue;
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
	<h2>커뮤니티 게시판</h2>
	<form name="form1" method="post" action="${path}/member_servlet/search.do" style="margin-left: 800px;">
		<select name="search_option">
			<option value="writer">이름</option>
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="all">이름+제목+내용</option>
		</select>
		<input name="keyword"><button id="btnSearch">검색</button>
	</form>
	<c:if test="${sessionScope.userid==null}">
		<button id="btnWrite2" style="margin-left: 1386px;">글쓰기</button>
	</c:if>
	<c:if test="${sessionScope.userid!=null}">
		<button id="btnWrite" style="margin-left: 1386px;">글쓰기</button>
	</c:if>
	<table border="1" width="900px" style="margin-left: 550px;">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>첨부파일</th>
			<th>다운로드</th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<c:choose>
				<c:when test="${dto.show == 'y'}">
					<tr>
						<td>${dto.num}</td>
						<td>${dto.writer}</td>
						<td>
							<c:forEach var="i" begin="1" end="${dto.re_level}">&nbsp;&nbsp;</c:forEach>
							<a href="${path}/member_servlet/view.do?num=${dto.num}">${dto.subject}</a>
							<c:if test="${dto.comment_count > 0}">
								<span style="color:red;">(${dto.comment_count})</span>
							</c:if>
						</td>
						<td>${dto.reg_date}</td>
						<td>${dto.readcount}</td>
						<td align="center">
							<c:if test="${dto.filesize > 0 }">
								<a href="${path}/member_servlet/download.do?num=${dto.num}"><img src="../images/file.gif"></a>
							</c:if>
						</td>
						<td>${dto.down}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${dto.num}</td>
						<td colspan="6" align="center">삭제된 게시물입니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<tr>
			<td colspan="7" align="center">
				<c:if test="${page.curBlock > 1}">
					<a href="#" onclick="list('1')">[처음]</a>
				</c:if>
				<c:if test="${page.curBlock > 1 }">
					<a href="#" onclick="list('${page.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
					<c:choose>
						<c:when test="${num == page.curPage}">
							<span style="color:red;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.curBlock < page.totBlock}">
					<a href="#" onclick="list('${page.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${page.curPage < page.totPage }">
					<a href="#" onclick="list('${page.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
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