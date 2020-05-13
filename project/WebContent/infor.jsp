<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>INFORMATION - PM.PP</title>
    <link href="http://fonts.googleapis.com/css?family=Varela" rel="stylesheet"/>
      <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>
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
    #ddd{margin-left:50px;}
    #dddd{margin-right:100px;}
    #to {margin-top:240px; text-align: center;}
    #wrapper{background:#B2CCFF;}
    #tab{background: white;}
    #taa{font-size:34px; margin-bottom:20px; color:#003399}
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
<div id="logo2">
     <img src="picture/inogo.png" alt="오류" width="500px;">
   </div>
<div id="wrapper">
    	<div id="header-wrapper">
    	<div id="header" class="container">
    		<div id="logo">
    			<a href="main.html"><img src="picture/logo3.png"  height="65" width="200" alt="오류"></a>
    		</div>
    		<div id="menu">
    			<ul>
    				<li class="m1"><a href="main.jsp" accesskey="1">Main</a></li>
    				<li class="m1"><a href="pm.jsp" accesskey="2" title="">PM</a></li>
    				<li class="m1"><a href="p-borad.jsp" accesskey="3" title="">P-board</a></li>
    				<li class="m1"><a href="free-borad.jsp" accesskey="4" title="">Free board</a></li>
    				<li class="current_page_item"><a href="infor.jsp" accesskey="5" title="">Information</a></li>
    			</ul>
    		</div>
    	</div>


    	</div>
<div>
  <div id="to"> <iframe width="700" height="400" src="https://www.youtube.com/embed/OlOB9Ja4EG0" frameborder="0" allowfullscreen></iframe>
<h1>입롤의 신 - 카밀, God of Ip-LoL - Camille (Feat. CuVee)</h1>
    <table >
      <caption id="taa">News and Information list</caption>
      <tr>
        <td id="tab">1. 뉴스 아프리카 프릭스, 정글러 '스피릿' ''모글리'과 서포터 '투신' 영입</td>
      </tr>
      <tr>
        <td id="tab">2. 뉴스 [IEM 경기 2016] 콩두, 2:1로 임모탈스제압.'한국팀 결승전 성사'</td>
      </tr>
      <tr>
        <td id="tab">3. 라이엇이 인증한 'LOL꿀팁'..."알고 계셧나요?"</td>
      </tr>
      <tr>
        <td id="tab">4. '룰러' 박재혁 선수, "결승전은 콩두 몬스터와 맞붙고 싶다."</td>
      </tr>

    </table>
    <img src="images/n1.png" alt="오류">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/n2.png" alt="오류"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/n3.png" alt="오류"> <br/>
    <br/>
    <img src="images/n4.png" alt="오류"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/n5.png" alt="오류">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="images/n6.png" alt="오류">
    <br/>
    <br/>
    <br/>
 </div>
</div>
    		</div>
<div id="copyright" class="container">
    <p>&copy; 2016-2017 PM.PP. Data based on League of legends Korea.</p>
    <P>기업 : PMPP | 주소 : 대한민국 충청남도 찬안시 서북구 천안공주대학교 | 등록번호 : 서울, 아12345 | 등록일 : 2016년 12월 18일 | 발행인 : (주)피엠지지 장우영 </P>
</div>
</body>
</html>