<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>(FREE)글쓰기 - PM.PP</title>

    <link href="http://fonts.googleapis.com/css?family=Varela" rel="stylesheet" />
    <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/script.js"></script>
    <style>
    /*게시판 css*/
            #wrapper{background:#434443};
    				ul{list-style:none;}
    				img{border:none;}
    				a{text-decoration:none;}
    				#contents{width:100%; height:100%;background:#434443; font-size:12px; }
    				#contents{width:70%;/* < 사이즈 조절은 여기서 수정 */background:#434443; min-height:768px;
            margin:0; padding:0; font-family:'돋움',dotum,Helvetica,sans-serif; margin:0 auto; margin-top:170px;}
    				#b_table{color:#fff; padding:10px;}
    				#b_table table{width:100%; text-align:left; }
    				#b_table table input{height:19px;border:1px solid #d5d2d2;background:#f6f6f6}
    				#b_table table input:hover{height:19px; background:#fff;}
    				#b_table table textarea{border:1px solid #d5d2d2;background:#f6f6f6}
    				#b_table table textarea:hover{border:1px solid #d5d2d2;background:#fff;}
    				#b_table table caption{text-align:left; padding:20px 10px 10px 10px; font-size:3em; font-weight:bold; letter-spacing :-1.2pt;}
    				#b_table table caption:after{content:""; display:block; clear:both;}
    				#b_table th, #b_table td{color:#fff;}
    				.bg_padding{ padding:0 30px;}
    				.board_list_border{padding:18px 0 18px 0; border-bottom:1px solid #6d6d6d;}
    				.board_list_border span{float:left;}
    				.btn{*zoom:1; cursor:pointer; position:relative; float:right; padding:5px;}
    				.btn li{float:left; height:33px; font-weight:bold; }
    				.btn_left{background:url(images/btn_left.gif) no-repeat; width:6px;  }
    				.btn_right{background:url(images/btn_right.gif) no-repeat; width:6px;  }
    				.btn_middle{position:relative;background:url(images/btn_middle.gif) repeat-x; }
    				.btn_middle span{position:relative; top:10px; }
    				.btn_middle span a{color:#fff; text-decoration:none; display:block; padding:0 10px;}
            #blogo{position: absolute; top:120px; left:45%; width:300px; margin-left:-50px;}
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
<%
	request.setCharacterEncoding("UTF-8");
	DBManager dbmManager = new DBManager();
	Bbs bbscontent = null;
	
	//등록
	if(request.getParameter("order") != null && request.getParameter("order").equals("insert")){
		Bbs bbs = new Bbs();
		bbs.setWriter(session.getAttribute("idx").toString());
		bbs.setTitle(request.getParameter("title"));
		bbs.setContent(request.getParameter("content"));

		dbmManager.insertBbs(request.getParameter("bbs_name"), bbs);
		%>
		<script>document.location = "free-borad.jsp"</script>
		<%
	}
	//삭제
	if(request.getParameter("order") != null && request.getParameter("order").equals("del")){
		dbmManager.delBbs(request.getParameter("bbs_name"), request.getParameter("no").toString());
		%>
		<script>alert('삭제하였습니다.');document.location = "free-borad.jsp"</script>
		<%
	}
	//예외처리
	if( request.getParameter("no") != null && request.getParameter("bbs_name") != null) {
		bbscontent = dbmManager.viewBbs(request.getParameter("bbs_name"), request.getParameter("no"));
		if(bbscontent == null) {
			bbscontent = new Bbs();
			bbscontent.setTitle("");
			bbscontent.setContent("");
		}
	} else {
		bbscontent = new Bbs();
		bbscontent.setTitle("");
		bbscontent.setContent("");
	}
%>
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
    			<a href="main.html"><img src="./picture/logo3.png"  height="65" width="200" alt="오류"></a>
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
      <form name="bbs_form" id="bbs_form" method="post">
      	<input name="order" type="hidden" value="" id="order">
      	<input name="bbs_name" type="hidden" value="bbs_free">
        <img src="./picture/blogo2.png" alt="오류" id="blogo">
        <div id="contents">
          <div id="b_table">
            <table cellpadding="0" cellspacing="0">
              <caption>자유게시판(글쓰기)</caption>
              <tbody>
                <tr>
                  <th style="background:#f7f7f7; color:#000;padding:10px; width:50px;">제목</th>
                  <td style="background:#f7f7f7; color:#000;"><input type="text" name="title" value="<%= bbscontent.getTitle() %>" style="width:99%;"/></td>
                </tr>
                <tr>
                  <td colspan="2" style="background:#f7f7f7; color:#000;"><img src="./images/add.gif" alt="" /></td>
                <tr>
                <tr>
                  <td colspan="2" style="background:#f7f7f7; color:#000;">
                    <textarea name="content" style="width:99%; height:400px;"><%= bbscontent.getContent() %></textarea>
                  </td>
                </tr>
              </tbody>
            </table>
            <!--btn-->
            <ul class="btn">
              <li class="btn_left"></li>
              <li class="btn_middle"><span><a href="free-borad.jsp">목록</a></span></li>
              <li class="btn_right"></li>
            </ul>
            
            <ul class="btn">
              <li class="btn_left"></li>
              <li class="btn_middle"><span><a href="#" id="bbs_del" onclick="del()">삭제</a></span></li>
              <li class="btn_right"></li>
            </ul>
            <!-- 
            <ul class="btn">
              <li class="btn_left"></li>
              <li class="btn_middle"><span><a href="#" id="bbs_update">수정</a></span></li>
              <li class="btn_right"></li>
            </ul>
             -->
            <ul class="btn">
              <li class="btn_left"></li>
              <li class="btn_middle"><span><a href="#" id="bbs_write" onclick="insert()">글쓰기</a></span></li>
              <li class="btn_right"></li>
            </ul>
            <!--btn_End-->
</form>
          </div>
        </div>
        <!--변경될 게시판_End-->
		</div>
		<!--//콘테이너 영역 끝-->
    <div id="copyright" class="container">
    	<p>&copy; 2016-2017 PM.PP. Data based on League of legends Korea.</p>
      <P>기업 : PMPP | 대한민국 충청남도 찬안시 서북구 천안공주대학교 | 등록번호 : 서울, 아12345 | 등록일 : 2016년 12월 18일 | 발행인 : (주)피엠지지 장우영</P>
    </div>
    <script>
    	function insert(){
    		document.getElementById("order").value = "insert";
    		document.getElementById("bbs_form").submit();
    	}
    	function del(){
    		document.getElementById("order").value = "del";
    		document.getElementById("bbs_form").submit();
    	}
    </script>
  </body>
</html>
