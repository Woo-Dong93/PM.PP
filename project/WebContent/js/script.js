 jQuery(function(){
	//로그인
	$('.btn-login').on('click', function(ev){ //.btn-login 클래스를 가지고 잇는 엘리먼트에게 on메소드를 이용해서 클릭 되엇을대 함수실행
		// 이벤트 차단
		ev.preventDefault(); //이동하는 이벤트를 차단합니다. 클릭만 진행
		// 로그인 정보 가져오기
		$id = $('input[name="id"').val();  //id변수생성해서 id값 넣음
		$pwd = $('input[name="pwd"').val(); //pwd변수생성해서  pwd값 넣음
		// 서버에 넘기
		$.post( "login.do", { id: $id, pwd: $pwd }) //서버에 JOSN 형태데이터를 post방식으로 전송 / {}는 객체 하나의 이름:값이 구분해서 객체의 속성읆 만듬
 		.done(function(result){ //.done함수 이용 ajax가 성공했을때 함수 실행
			// 로그인 정보 출력
			$result = jQuery.parseJSON(result); //회원이 있을경우 정보들을 받아서 JSON을 파싱하여 객체로 반환하고 그값을 RESULT에 저장
				if($result.login == "true"){ // login 값이 true면 
					$('.information-wrap .id').html($result.id); //클래스 information-wrap에 잇는 클래스id에 받은 id값을 쓴다.
					$('.information-wrap .name').html($result.name);
					$('.information-wrap .tier').html($result.tier);
					$('.information-wrap .nickname').html($result.nickname);
					$('.login_form').hide();
					$('.information-wrap').show();
				} else {
					alert("아이디가 없거나 비번이 정확하지 않습니다.")
				}
			});
	});
	//로그아웃
	$('.logout').on('click', function(){ //로그아웃 크래스 있는 버튼 클릭시 함수 실행
		$.post( "logout.do"); // ajax 구현 서블릿명령 전달
		$('.login_form').show();
		$('.information-wrap').hide();
	});
	
	//중복확인
	$('.btn-check-id').on('click', function(){ //중복확인 버튼 눌렸을때 함수 실행
		var input_id = $('#input_ID').val(); //사용자가 입룍한 아이디를 변수에 담는다.
		if(input_id.length > 0){ //입력산 id값이 있으면
			$.post("checkMember.do", {id: input_id}).done(function(result){ //ajax이용 post로 전송
				var chk = jQuery.parseJSON(result); //result : 0 or 1 json 파싱해서 chk에 저장
				if(chk.result == "0"){
					alert('등록 가능한 아이디 입니다.')
				} else {
					alert('이미사용중인 아이디 입니다.')
				}
			});
		} else {
			alert('아이디를 입력해주세요');
		}
	});
	// 매칭시작 버튼
	$('.buy').on('click', function(ev){ //매칭시작버튼 누르면 함수실행
		ev.preventDefault(); //클릭동작만 수행
		var $el = $(this);  //자신 객체를 저장
		//등록
		if(!$el.is('.match')) { //is를 이용해서 el변수 에 해당하는 요소를 .match랑 비교하여 맞으면 true 틀리면 false 반환
			$.post("setMatch.do");  //game 테이블에 등록과정
			$el.html("매칭종료");
		}
		//취소
		else { //회원 로그인이 안되있을경우
			$.post("outMatch.do");
			$el.html("매칭시작");
		}
		$el.toggleClass('match'); //el(버튼객체)에 match가 있을경우 삭제 / 없을경우 다시 속성부여 /다시클릭할때 삭제하기 위해
		getMatchList(); //리스트 얻어오는 함수실행
	})
	//리스트 얻어오는 함수 
	function getMatchList(){
		$.get("getMatch.do").done(function(result){ //ajax가 잘 완료되면 function을 수행하라 
			var element;
			var i = 1;
			$matchList = jQuery.parseJSON(result); //받아온 result값(list)을 json형태로 변수에 저장
			$('.list-item').remove();
			for( var arr in $matchList.game ){
				element = $('<tr class="list-item">'); //tr에 클래스 속성을 추가한 값을 element에 저장
				$('<td>').html(i++).appendTo(element); //element값을 td의 내용에 저장
				$('<td>').html($matchList.game[arr].user_name).appendTo(element);
				$('<td>').html($matchList.game[arr].nickname).appendTo(element);
				$('<td>').html($matchList.game[arr].tier).appendTo(element);
				element.appendTo('.match-list');
//					console.log($matchList.game[arr]);
			}
		});
	}
	function onlineCheck(){
		getMatchList();
		setTimeout(getMatchList(), 1000); //1초 경과하면 계속 함수실행
	}
	// 페이지 탈퇴시 매칭종료
	if($('body').is('.pm-page')){ //body 속성에 클래스 .pm-page속성이 있으면 true값 반환
		onlineCheck();
		$(window).on('beforeunload', function(){ //beforeunload를 이용하여 다른페이지가 로드될때 이 함수를 실행(매칭종료)
			$.post("outMatch.do");
			console.log('hello'); //되는지 확인하기 위해 출력
		});
	}
});