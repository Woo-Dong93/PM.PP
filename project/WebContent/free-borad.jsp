<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dbmanager.*" %>
<%
		
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("UTF-8");
	 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" contenet="LOL 매칭 싸이트입니다.">
<meta name="kewords" content="LOL, 파티매칭, 리그오브레전드, PM.PP">
<meta name="author" cotnent="jang woo young">
<title>자유게시판 - PM.PP</title>
<link href="http://fonts.googleapis.com/css?family=Varela"
	rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>
<style type="text/css">
/*게시판 css*/
#wrapper {
	background: #434443;
}
ul {
	list-style: none;
}
img {
	border: none;
}
a {
	text-decoration: none;
}
#contents {
	margin: 0;
	padding: 0;
	font-family: '돋움', dotum, Helvetica, sans-serif;
	background: #434443;
}
#contents {
	width: 100%;
	height: 100%;
	font-size: 12px;
	margin: 0 auto;
	right
}
#contents {
	width: 70%; /* < 사이즈 조절은 여기서 수정 */
	min-height: 600px;
	margin-top: 170px;
}
#b_table {
	color: #fff;
	padding: 10px;
}
#b_table table {
	width: 100%;
	text-align: center;
}
#b_table table caption {
	text-align: left;
	padding: 20px 10px 10px 10px;
	font-size: 3em;
	font-weight: bold;
	letter-spacing: -1.2pt;
}
#b_table table caption:after {
	content: "";
	display: block;
	clear: both;
}
#b_table th, #b_table td {
	color: #fff;
}
.first_bg {
	background: url(images/first_bg.gif) no-repeat;
	height: 29px;
	width: 9px;
}
.last_bg {
	background: url(images/last_bg.gif) no-repeat;
	height: 29px;
	width: 9px;
}
.middle_bg {
	background: url(images/middle_bg.gif) repeat-x;
	height: 29px;
}
.bg_padding {
	padding: 0 30px;
}
.board_list_border {
	padding: 18px 0 18px 0;
	border-bottom: 1px solid #6d6d6d;
}
.board_list_border span {
	float: left;
}

#paeng {
	text-align: center;
	padding-top: 20px;
	position: relative;
}
#pageng a {
	
}
.pageng_a {
	color: #fff;
	padding: 3px 5px 3px 5px;
}
.pageng_a:hover, .pageng_a:active, .pageng_a:focus {
	color: #fff;
	background: #242323;
	padding: 3px 5px 3px 5px;
	text-decoration: none;
}
.cursor_btn {
	position: relative;
	top: 3px;
}
.btn {
	*zoom: 1;
	cursor: pointer;
	position: relative;
	float: right;
}
.btn li {
	float: left;
	height: 33px;
	font-weight: bold;
}
.btn_left {
	background: url(images/btn_left.gif) no-repeat;
	width: 6px;
}
.btn_right {
	background: url(images/btn_right.gif) no-repeat;
	width: 6px;
}
.btn_middle {
	position: relative;
	background: url(images/btn_middle.gif) repeat-x;
}
.btn_middle span {
	position: relative;
	top: 10px;
}
.btn_middle span a {
	color: #fff;
	text-decoration: none;
	display: block;
	padding: 0 10px;
}
#search_bar {
	width: 225px;
	margin: 0 auto;
	background: #232323;
	padding: 10px;
	margin-top: 30px;
}
#search {
	
}
#search:after {
	content: "";
	display: block;
	clear: both;
}
#search input {
	border: 1px solid #232323;
	height: 18px;
	width: 120px
}
#search li {
	float: left;
}
.search_go {
	position: relative;
	display: block;
	width: 40px;
	height: 19px;
	background: url(images/btn_middle.gif) repeat-x;
}
.search_go a {
	position: relative;
	top: 5px;
	left: 8px;
	color: #fff;
}
.search_go:hover a, .search_go:active a, .search_go:focus a {
	color: #fff;
	text-decoration: none;
}
#blogo {
	position: absolute;
	top: 140px;
	left: 45%;
	width: 300px;
	margin-left: -50px;
}
.no-line {
	text-decoration: none;
	color: #fff;
}
.information-wrap + .login_form {
    	display: none;
    }
    .null {
    	display: none;
    }
    .null.information-wrap + .login_form {
    	display:block;
    }
</style>
</head>
<body>
	<div id="ppp">
		<%
		//if(session.getAttribute("login") != null && session.getAttribute("login").equals(true)) {
	 %>
	<div class="information-wrap <%= session.getAttribute("login") %>">
		<div>ID: <span class="id"><%= session.getAttribute("id") %></span></div>
		<div>Name: <span class="name"><%= session.getAttribute("name") %></span></div>
		<div>Tier: <span class="tier"><%= session.getAttribute("tier") %></span></div>
		<div>Nickname: <span class="nickname"><%= session.getAttribute("nickname") %></span></div>
		<div><button class="logout">로그아웃</button></div>
	</div>
	<%	//}	%>
    <form action="" method="post" class="login_form">
        <input type="text" id="pp1" name="id" placeholder="아이디"><br/>
        <input type="password" id="pp1" name="pwd" placeholder="비밀번호"><br>
        <input type="submit" value="로그인" id="lob" class="btn btn-login">
        <input type="button" value="회원가입" id="lob2" onclick="window.open('Membership.jsp')">
    </form>
	</div>
	<div id="wrapper">
		<div id="header-wrapper">
			<div id="header" class="container">
				<div id="logo">
					<a href="main.jsp"><img src="picture/logo3.png" height="65"
						width="200" alt="오류"></a>
				</div>
				<div id="menu">
					<ul>
						<li class="m1"><a href="main.jsp" accesskey="1">Main</a></li>
						<li class="m1"><a href="pm.jsp" accesskey="2" title="">PM</a></li>
						<li class="m1"><a href="p-borad.jsp" accesskey="3" title="">P-board</a></li>
						<li class="current_page_item"><a href="free-borad.jsp" accesskey="4" title="">Free board</a></li>
						<li class="m1"><a href="infor.jsp" accesskey="5" title="">Information</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="contents">
			<img src="picture/blogo2.png" alt="오류" id="blogo">
			<div id="b_table">
				<table cellpadding="0" cellspacing="0">
					<caption>자유게시판</caption>
					<tbody>
					<tr id="tr1">
						<td class="first_bg"></td>
						<td class="middle_bg">번호</td>
						<td class="middle_bg bg_padding">제목</td>
						<td class="middle_bg bg_padding">작성자</td>
						<td class="middle_bg bg_padding">작성일</td>
						<td class="middle_bg">조회수</td>
						<td class="last_bg"></td>
					</tr>
					<% 
						int i = 0;
						DBManager dbManager = new DBManager();
						List<Bbs> bbs = dbManager.getBbsList("bbs_free");
						if(bbs != null){
							for( Bbs content : bbs ) {
					%>
					<tr>
						<td class="board_list_border"></td>
						<td class="board_list_border"><%= ++i %></td>
						<td class="board_list_border"><a class="no-line" href="f-borad_write.jsp?no=<%= content.getBbs_idx() %>&bbs_name=bbs_free"><%= content.getTitle() %></a></td>
						<td class="board_list_border"><%= content.getWriter() %></td>
						<td class="board_list_border"><%= content.getReg_date() %></td>
						<td class="board_list_border"><%= content.getHit() %></td>
						<td class="board_list_border"></td>
					</tr>
					<%		}
						} %>
					<!--tr>
						<td class="board_list_border"></td>
						<td class="board_list_border">1</td>
						<td class="board_list_border">안녕하세요. 방가방가</td>
						<td class="board_list_border">강민</td>
						<td class="board_list_border">2016-12-15</td>
						<td class="board_list_border">1</td>
						<td class="board_list_border"></td>
					</tr-->
					</tbody>
				</table>

				<!--페이징-->
				<!-- 
				<div id="paeng">
					<form action="">
						<a href="#" class="cursor_btn"><img src="images/pre_btn.gif"
							alt="" /></a> <a href="#" class="pageng_a">1</a> <a href="#"
							class="pageng_a">2</a> <a href="#" class="pageng_a">3</a> <a
							href="#" class="pageng_a">4</a> <a href="#" class="pageng_a">5</a>
						<a href="#" class="pageng_a">6</a> <a href="#" class="pageng_a">7</a>
						<a href="#" class="pageng_a">8</a> <a href="#" class="pageng_a">9</a>
						<a href="#" class="cursor_btn"><img src="images/next_btn.gif"
							alt="" /></a>
					</form>
				</div>
				 -->
				<!--페이징 End-->
				<!--btn-->
				<ul class="btn">
					<li class="btn_left"></li>
					<li class="btn_middle"><span><a href="f-borad_write.jsp">글쓰기</a></span></li>

					<li class="btn_right"></li>
				</ul>
				<!--btn_End-->
			</div>
		</div>
		<!--변경될 게시판_End-->
	</div>
	<!--//콘테이너 영역 끝-->
	<div id="copyright" class="container">
		<p>&copy; 2016-2017 PM.PP. Data based on League of legends Korea.</p>
		<P>기업 : PMPP | 주소 : 대한민국 충청남도 찬안시 서북구 천안공주대학교 | 등록번호 : 서울, 아12345 | 등록일 : 2016년 12월 18일 | 발행인 : (주)피엠지지 장우영</P>
	</div>
</body>
</html>
