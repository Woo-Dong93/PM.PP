<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  response.setCharacterEncoding("EUC-KR");
    request.setCharacterEncoding("EUC-KR"); 
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="description" content="회원가입 페이지입니다.">
        <meta name="kewords" content="장우영,공주대,컴퓨터공학과">
        <meta name="author" cotnent="jang woo young">
        <title>회원가입</title>
        <script type="text/javascript">
            /* 이메일 주소 추가*/
            function email_change() {
                if (document.join.email.options[document.join.email.selectedIndex].value == '0') {
                    document.join.email2.disabled = true;
                    document.join.email2.value = "";
                }
                if (document.join.email.options[document.join.email.selectedIndex].value == '9') {
                    document.join.email2.disabled = false;
                    document.join.email2.value = "";
                    document.join.email2.focus();
                } else {
                    document.join.email2.disabled = true;
                    document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
                }
            }
            /*패스워드 중복확인*/
            function checkPwd() {
                var f1 = document.forms[0];
                var pw1 = f1.pwd.value;
                var pw2 = f1.pwd_check.value;
                if (pw1 != pw2) {
                    document.getElementById('checkPwd').style.color = "red";
                    document.getElementById('checkPwd').innerHTML = "* 동일한 비밀번호를 입력하세요.&nbsp &nbsp &nbsp &nbsp &nbsp ";
                }
                else {
                    document.getElementById('checkPwd').style.color = "black";
                    document.getElementById('checkPwd').innerHTML = "* 비밀번호가 확인 되었습니다. &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp";
                }
            }
            /*전화번호 - 있는지 검사*/
            function chkPone() {
                var txtpone = document.getElementById("input_pone").value;
                var result = txtpone.indexOf("-");
                if (result == -1) {
                    alert("인증번호가 발송되었습니다.")
                }
                else {
                    alert("- 를 포함하셨습니다.")
                }
            }
            /*인증번호 1234*/
            function number() {
                var pone = document.getElementById("input_4p").value;
                if (pone == "1234") {
                    alert("인증이 완료되셨습니다.")
                }
                else {
                    alert("인증에 실패하셨습니다.")
                }
            }
        </script>
        <style>
            #DS{height:40px; width:250px; margin-left:-487px; margin-bottom:20px; font-size:20px;}
            a {
                text-decoration: none;
            }
            @import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
            .container {
                text-align: center;
            }
            .header {
                font-family: 'Jeju Gothic', sans-serif;
            }
            small {
                color: #A6A6A6;
            }
            .input1 {
                width: 600px;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.4285;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0, 0.75);
                margin-bottom: 30px;

            }
            .input2 {
                width: 600px;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.4285;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0, 0.75);
                margin-right: 105px;
                margin-bottom: 30px;
            }
            .input3 {
                width: 600px;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.4285;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0, 0.75);
                margin-bottom: 30px;
                margin-left: 50px;
            }
            .input4 {
                width: 200px;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.4285;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0, 0.75);
                margin-right: 105px;
                margin-bottom: 30px;
                margin-left: 25px;
            }
            .input5 {
                width: 320px;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.4285;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0, 0.75);
                margin-right: 105px;
                margin-bottom: 30px;
            }
            .input6 {
                width: 120px;
                height: 47px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.4285;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0, 0.75);
                margin-bottom: 30px;
                margin-left: -100px;
            }
            .c {
                margin: 0;
                padding: 0;
            }
            .h1 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-right: 690px;

            }
            .h11 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-right: 660px;

            }
            .h12 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-right: 670px;

            }
            .h2 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-left: -675px;
            }
            .h3 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-left: -640px;
            }
            .h4 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-left: -710px;
            }
            .h5 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-left: -660px;
            }
            .h6 {
                font-size: 17px;
                color: #333;
                font-family: 'Jeju Gothic', sans-serif;
                margin-left: -650px;
            }
            .h7 {
                font-size: 2em;
                width: 36px;
                margin-left: -100px;
                height: 50px;
                margin-right: 5px;
                border-color: white;
                background-color: white;
                border-style: dashed;
            }
            .btn1 {
                color: #fff;
                margin-top: 0px;
                background-color: #5cb85c;
                border-color: #4cae4c;
                font-size: 20px;
                text-align: center;
                border-radius: 4px;
                width: 100px;
                height: 50px;

            }
            .btn2 {
                color: #fff;
                margin-top: 0px;
                background-color: #5cb85c;
                border-color: #4cae4c;
                font-size: 20px;
                text-align: center;
                border-radius: 4px;
                width: 150px;
                height: 50px;

            }
            .btn3 {
                color: #fff;
                margin-top: 0px;
                background-color: #6B66FF;
                border-color: #B5B2FF;
                font-size: 20px;
                text-align: center;
                border-radius: 4px;
                width: 100px;
                height: 50px;

            }
            .vuga {
                font-size: 14px;
                color: gray;
                margin-top: -25px;
                margin-left: -290px;
            }
            .vuga1 {
                font-size: 14px;
                color: gray;
                margin-top: -25px;
                margin-left: -610px;
            }
            .vuga2 {
                font-size: 14px;
                color: gray;
                margin-top: -25px;
                margin-left: -370px;
            }
            .vuga3 {
                font-size: 14px;
                color: gray;
                margin-top: -25px;
                margin-left: -470px;
            }
            .vuga4 {
                font-size: 14px;
                color: gray;
                margin-top: -25px;
                margin-left: -550px;
            }
            #checkPwd {
                font-size: 15px;
                margin-top: -25px;
                margin-left: -470px;
                color: gray;
            }
            #r1 {
                font-family: 'Jeju Gothic', sans-serif;
                font-size: 1em;
                margin-left: -570px;
                margin-top: -10px
            }
            /* 체크박스는 외부 디자인 이용*/
            input[type=checkbox].css-checkbox {
                position: absolute;
                z-index: -1000;
                left: -1000px;
                overflow: hidden;
                clip: rect(0 0 0 0);
                height: 1px;
                width: 1px;
                margin: -1px;
                padding: 0;
                border: 0;
            }
            /* 체크박스는 외부 디자인 이용*/
            input[type=checkbox].css-checkbox + label.css-label {
                padding-left: 23px;
                height: 18px;
                display: inline-block;
                line-height: 18px;
                background-repeat: no-repeat;
                background-position: 0 0;
                font-size: 18px;
                vertical-align: middle;
                cursor: pointer;
                font-family: 'Jeju Gothic', sans-serif;
                margin-right: 520px;
                margin-top: 15px;
                margin-bottom: 30px;
            }
            /* 체크박스는 외부 디자인 이용*/
            input[type=checkbox].css-checkbox:checked + label.css-label {
                background-position: 0 -18px;
            }
            /* 체크박스는 외부 디자인 이용*/
            label.css-label {
                background-image: url(http://csscheckbox.com/checkboxes/u/csscheckbox_e7d0bf58d1556e5a8ef49f2491d9a183.png);
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }
        </style>
        <script src="./js/jquery-1.12.4.min.js"></script>
    	<script src="./js/script.js"></script>
    </head>
    <body>
    <div class="full">
        <div class="container">
            <div class="header">
                <h1>회원가입(Join)
                    <small>PM.PP</small>
                </h1>
            </div>
            <div>
                <form action="insertMember.do" method="post" name="join">
                    <div>
                        <label class="h1" for="input_ID">아이디</label>
                        <p class="c"><input type="text" class="input1" id="input_ID" name="id" placeholder="아이디" required pattern="[A-Za-z0-9]{4,10}" maxlength="10" autofocus>
                            <input type="button" class="btn1 btn-check-id" value="중복검사">
                        </p>
                        <p class="vuga">* 영문자, 숫자만 입력가능, 최소 4글자이상 최대 10글자이하 입력가능</p>
                    </div>
                    <div>
                        <label class="h2" for="input_pw">비밀번호</label>
                        <p class="c"><input type="password" class="input2" id="input_pw" name="pwd" placeholder="비밀번호" required pattern="[A-Za-z0-9]{7,13}" maxlength="13"></p>
                        <p class="vuga">* 영문자, 숫자만 입력가능, 최소7글자이상 최대13글자이하 입력가능</p>
                    </div>
                    <div>
                        <label class="h3" for="input_pw2">비밀번호 확인</label>
                        <p class="c"><input type="password" class="input2" id="input_pw2" name="pwd_check" placeholder="비밀번호 확인" required pattern="[A-Za-z0-9]{7,13}" maxlength="13" onkeyup="checkPwd()"></p>
                        <div id="checkPwd">* 비밀번호을 중복되게 입력해주세요.</div>
                    </div>
                    <div>
                        <label class="h4" for="input_name">이름</label>
                        <p class="c"><input type="text" class="input2" id="input_name" name="name" placeholder="이름을 입력해 주세요." required pattern="[A-Za-z가-힣]{1,5}" maxlength="5"></p>
                        <p class="vuga2">* 영문자, 한글만 입력가능, 최소1글자 최대5글자 입력가능</p>
                    </div>
                    <div>
                        <label class="h11" for="input_name2">게임 닉네임</label>
                        <p class="c">
                            <input type="text" class="input2" id="input_name2" name="game_name" placeholder="게임 닉네임을 입력해 주세요." required pattern="[A-Za-z가-힣]{1,10}" maxlength="10">
                        </p>
                        <p class="vuga2">* 영문자, 한글만 입력가능, 최소1글자 최대10글자 입력가능</p>
                    </div>
                    <div>
                        <label class="h12" for=DS>티어(등급)</label>
                        <p class="c">
                            <select name="tear" id="DS" class="dropdown-select">
                                <option value="challenger">챌린저</option>
                                <option value="diamond1">다이아몬드 1티어</option>
                                <option value="diamond2">다이아몬드 2티어</option>
                                <option value="diamond3">다이아몬드 3티어</option>
                                <option value="diamond4">다이아몬드 4티어</option>
                                <option value="diamond5">다이아몬드 5티어</option>
                                <option value="platinum1">플레티넘 1티어</option>
                                <option value="platinum2">플레티넘 2티어</option>
                                <option value="platinum3">플레티넘 3티어</option>
                                <option value="platinum4">플레티넘 4티어</option>
                                <option value="platinum5">플레티넘 5티어</option>
                                <option value="gold1">골드 1티어</option>
                                <option value="gold2">골드 2티어</option>
                                <option value="gold3">골드 3티어</option>
                                <option value="gold4">골드 4티어</option>
                                <option value="gold5">골드 5티어</option>
                                <option value="silver1">실버 1티어</option>
                                <option value="silver2">실버 2티어</option>
                                <option value="silver3">실버 3티어</option>
                                <option value="silver4">실버 4티어</option>
                                <option value="silver5">실버 5티어</option>
                                <option value="bronze1">브론즈 1티어</option>
                                <option value="bronze2">브론즈 2티어</option>
                                <option value="bronze3">브론즈 3티어</option>
                                <option value="bronze4">브론즈 4티어</option>
                                <option value="bronze5">브론즈 5티어</option>
                            </select></p>
                    </div>
                    <div name="a1">
                        <label class="h1" for="input_email">이메일</label>
                        <p name="a2" class="c"><input type="text" class="input4" id="input_email" name="email1" required pattern="[A-Za-z]{1,13}" maxlength="13">
                            <input class="h7" type="text" size="1" value="@" disabled>
                            <input class="input5" name="email2" type="text" id="dommain" required>
                            <select name="email" onchange="email_change()" class="input6">
                                <option value="">선택하세요</option>
                                <option value="9">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="gmail.com">gmail.com</option>
                            </select>
                        </p>
                        <p id="r1"><input type="radio" value="agree" name="agree">수신동의 &nbsp<input type="radio" value="noagree" name="agree">수신거부</p>
                    </div>
                    <div>
                        <label class="h5" for="input_pone">휴대폰 인증</label>
                        <p class="c">
                            <input type="text" class="input3" id="input_pone" name="pone" placeholder="-없이 입력해 주세요." required pattern="[0-9]{11,11}" maxlength="11">
                            <input type="button" class="btn2" value="인증번호 전송" onclick="chkPone()">
                        </p>
                        <p class="vuga3">* 숫자만 입력가능, (-)없이 입력해주세요.</p>
                    </div>
                    <div>
                        <label class="h6" for="input_4p">인증번호입력</label>
                        <p class="c">
                            <input type="number" class="input3" id="input_4p" name="4p" placeholder="인증번호" required pattern="[0-9]{4,4}" maxlength="4">
                            <input type="button" class="btn2" value="인증번호 입력" onclick="number()">
                        </p>
                        <p class="vuga4">* 숫자 4개를 입력해주세요.</p>
                    </div>
                    <div>
                        <label class="h2" for="input_agree">약관 동의</label>
                        <p class="c">
                            <input type="checkbox" style="width:0.6px; height:0.6px;" class="css-checkbox" id="input_agree" name="agree" required>
                            <label for="input_agree" class="css-label"><a href="#">이용약관</a>에 동의합니다.</label>
                        </p>
                    </div>
                    <input type="submit" class="btn3" value="가입하기"></input>
                    <input type="reset" class="btn3" value="다시작성"></input>
                </form>
            </div>
        </div>
    </div>
    </body>
</html>