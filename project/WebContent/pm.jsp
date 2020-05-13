<%@page import="dbmanager.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbmanager.*" %>
<%
if(session.getAttribute("login") == null){
	response.getWriter().append("<script>alert('회원가입해주세요.');history.go(-1);</script>");	 //이전  페이지로 되돌린다.
}
DBManager dbManager = new DBManager();
String checkmatch = "매칭시작"; //버튼의 클래스를 설정한다 클래스를 가지고 컨트롤 실행
String checkCLass = "";
int isMatch = dbManager.isMatch(session.getAttribute("idx").toString()); //등록된 회원일 경우 1반환
if(isMatch > 0) { //등록된 회원이면
	checkmatch = "매칭종료"; //문자열 매칭종료저장
	checkCLass = "match"; //문자열 match저장
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" contenet="LOL 매칭 싸이트입니다.">
    <meta name="kewords" content="LOL, 파티매칭, 리그오브레전드, PM.PP">
    <meta name="author" cotnent="jang woo young">
    <title>PM - PM.PP</title>
    <link href="http://fonts.googleapis.com/css?family=Varela" rel="stylesheet"/>
    <link href="css/default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
    .information-wrap + .login_form {
    	display: none;
    }
    .null {
    	display: none;
    }
    .null.information-wrap + .login_form {
    	display:block;
    }
    #bm{margin-left:-90px;}
    </style>
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>
</head>
<body class="pm-page">
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
<div id="logo2">
    <img src="picture/logo.png" alt="오류" width="500px;">
</div>
<div id="wrapper">
    <div id="header-wrapper">
        <div id="header" class="container">
            <div id="logo">
                <a href="main.jsp"><img src="picture/logo3.png" height="65" width="200" alt="오류"></a>
            </div>
            <div id="menu">
                <ul>
                    <li class="m1"><a href="main.jsp" accesskey="1">Main</a></li>
                    <li class="current_page_item"><a href="pm.jsp" accesskey="2" title="">PM</a></li>
                    <li class="m1"><a href="p-borad.jsp" accesskey="3" title="">P-board</a></li>
                    <li class="m1"><a href="free-borad.jsp" accesskey="4" title="">Free board</a></li>
                    <li class="m1"><a href="infor.jsp" accesskey="5" title="">Information</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="banner">
        <div class="container">
            <div class="title">
                <div class="pricing-table basic">
	        		<span class="table-head">
                <img src="tear/<%= session.getAttribute("tier") %>.png" alt="오류"><br/> 
	      			<%=session.getAttribute("tier")%>
	        		</span>
		      	<span class="price">
		    		 User
		      	</span>
                    <span class="table-row">사용자 계정: 
                    <%	if(session.getAttribute("login") != null && session.getAttribute("login").equals(true)) { %>
						<%= session.getAttribute("name") %>
                    <% } %>
                    </span>
            <span class="price">
               게임 닉네임
            </span>
                    <span class="table-row">게임 닉네임:
                    <%	if(session.getAttribute("login") != null && session.getAttribute("login").equals(true)) { %>
						<%= session.getAttribute("nickname") %> 
                    <% } %>
                    </span>
                    <div class="purchase" id="bm"> /* 매칭버튼 */
                        <a href="#"  class="buy <%= checkCLass %>"><%= checkmatch %></a>
                    </div>
                </div>
                <div class="pricing-table2 premium">
	        		<span class="table-head">

	        		</span>
	        		<span class="price">
	        			매칭중인 리스트
	        		</span>
                    <table>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>사용자</th>
                            <th>게임 닉네임</th>
                            <th>티어(등급)</th>
                        </tr>
                        </thead>
                        <tbody class="match-list">
                        <!-- 
                        <tr>
                            <td>번호</td>
                            <td>가입할 때 쓴이름</td>
                            <td>게임 닉네임</td>
                            <td>선택한 티어등급</td>
                        </tr>
                         -->
                        <!-- 
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="copyright" class="container">
    <p>&copy; 2016-2017 PM.PP. Data based on League of legends Korea.</p>
    <P>기업 : PMPP | 주소 : 대한민국 충청남도 찬안시 서북구 천안공주대학교 | 등록번호 : 서울, 아12345 | 등록일 : 2016년 12월 18일 | 발행인 : (주)피엠지지 장우영 </P>
</div>
</body>
</html>
