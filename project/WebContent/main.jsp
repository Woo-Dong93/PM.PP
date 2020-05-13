<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%  response.setCharacterEncoding("EUC-KR");
    request.setCharacterEncoding("EUC-KR"); 
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" contenet="LOL ��Ī ����Ʈ�Դϴ�.">
    <meta name="kewords" content="LOL, ��Ƽ��Ī, ���׿��극����, PM.PP">
    <meta name="author" cotnent="jang woo young">
    <title>��Ƽ ��Ī - PM.PP</title>
    <link href="http://fonts.googleapis.com/css?family=Varela" rel="stylesheet"/>
    <link href="css/default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all"/>
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
    </style>
</head>
<body>
<div id="ppp">
	<%
		//if(session.getAttribute("login") != null && session.getAttribute("login").equals(true)) {
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
	 %>
	<div class="information-wrap <%= session.getAttribute("login") %>">
		<div>ID: <span class="id"><%= session.getAttribute("id") %></span></div>
		<div>Name: <span class="name"><%= session.getAttribute("name") %></span></div>
		<div>Tier: <span class="tier"><%= session.getAttribute("tier") %></span></div>
		<div>Nickname: <span class="nickname"><%= session.getAttribute("nickname") %></span></div>
		<div><button class="logout">�α׾ƿ�</button></div>
	</div>
	<%	//}	%>
    <form action="" method="post" class="login_form">
        <input type="text" id="pp1" name="id" placeholder="���̵�"><br/>
        <input type="password" id="pp1" name="pwd" placeholder="��й�ȣ"><br>
        <input type="submit" value="�α���" id="lob" class="btn btn-login">
        <input type="button" value="ȸ������" id="lob2" onclick="window.open('Membership.jsp')">
    </form>
</div>
<div id="wrapper">
    <div id="header-wrapper">
        <div id="header" class="container">
            <div id="logo">
                <a href="main.jsp"><img src="picture/logo3.png" height="65" width="200" alt="����"></a>
            </div>
            <div id="menu">
                <ul>
                    <li class="current_page_item"><a href="main.jsp" accesskey="1">Main</a></li>
                    <li class="m1"><a href="pm.jsp" accesskey="2" title="">PM</a></li>
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
                <img src="./picture/blog.png" width="800" height="250" alt="����">
                <h2>Welcome to the World of Games</h2>
            </div>
            <ul class="actions">
                <li><a href="pm.jsp" class="button">PM-Start</a></li>
            </ul>
        </div>
    </div>
    <div id="extra" class="container">
    		<div class="title">
    			<h2>Game Information</h2>
    			<span class="byline">Introduce the Game information and News</span> </div>
    		<div id="three-column">
    			<div>
    				<div><span id="dddd"><a href="http://www.leagueoflegends.co.kr/?m=news&cate=update&mod=view&schwrd=&p=1&idx=253604#patch-items" target="_blank"><img src="images/im.png"  alt="����" width="400" id="ddd"></a></span>
                    <a href="http://www.op.gg/r/detail/55405/news" target="_blank"><img src="images/in2.png"  alt="����" width="400" height="275"></a>
    				</div>
    			</div>

      

    		</div>
    		<ul class="actions">
    			<li><a href="infor.jsp" class="button">INFORMATON</a></li>
    		</ul>
    	</div>

    </div>
<div id="copyright" class="container">
    <p>&copy; 2016-2017 PM.PP. Data based on League of legends Korea.</p>
    <P>��� : PMPP | �ּ� : ���ѹα� ��û���� ���Ƚ� ���ϱ� õ�Ȱ��ִ��б� | ��Ϲ�ȣ : ����, ��12345 | ����� : 2016�� 12�� 18�� | ������ : (��)�ǿ����� ��쿵 </P>
</div>
</body>
</html>
