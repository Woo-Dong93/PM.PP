package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dbmanager.*;

/**
 * Servlet implementation class Ajax
 */
@WebServlet("*.do")
public class Query extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Query() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
//		doGet(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession(); // 현재 세션이 종재하면 기존 세션 리턴 ,없으면 새로 생성한 세션 리턴

		session.getAttribute("id");
	
		
		String uri = request.getRequestURI(); //프로젝트와 파일 경로까지 얻어온다.
		String conPath = request.getContextPath(); //프로젝트의 path까지만 얻어온다.
		String command = uri.substring(conPath.length()); //마지막 파일이름을 변수에 저장한다.
		DBManager dbmanager = new DBManager(); // dbmanger 클래스 사용하기 위해 객체화
				
		//회원등록
		if(command.equals("/insertMember.do")){  //회원가입 form에서 action 값 insertMember.do으로 명령어가 들어오면
			Member member = new Member(); //멤버클래스 객체 사용
			
			if(request.getParameter("id") != null) {
				try{
					member.setUser_name(request.getParameter("id")); //member클래스의 member.setUser_name 이용해서 값 저장하기
					member.setUser_password(request.getParameter("pwd"));
					member.setName(request.getParameter("name"));
					member.setNickname(request.getParameter("game_name"));
					member.setTier(request.getParameter("tear"));
					member.setEmail(request.getParameter("email1"));
					member.setMobile(request.getParameter("pone"));
			
					dbmanager.insertMember(member); //dbmanager 클래스를 사용하여 db에 회원정보들을 등록한다.
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				response.getWriter().append("<script>alert('등록되었습니다.');window.location = 'main.jsp';</script>");
			} else {
				response.getWriter().append("파라메터 없음");
			}
		}
		
		// 아이디 중복 체크
		// 1을 리턴하면 같은 아이디 존재
		// 0이면 같은 아이디 없음
		if(command.equals("/checkMember.do")){
			int checkResult= dbmanager.checkId(request.getParameter("id"));
			response.getWriter().append("{\"result\": \"" + checkResult + "\"}");
		}
		// 로그인
		// 파라메터 id, pwd
		// 상기 파라메터의 값을 검사하고 json 방식으로 
		if(command.equals("/login.do")){ //AJAX에서 post로 이명령어를 보내어 받을때
			if(request.getParameter("id") != null && request.getParameter("pwd") != null){ //id,pwd가 값이 존재할때
				Member login = dbmanager.login(request.getParameter("id"), request.getParameter("pwd")); //입력된 ID와 TALE정보 리, 없으면 NULL값 리턴
				JSONObject json = new JSONObject(); // json 객체 사용하기위해 선언
				System.out.println("login.do"); 
				if(login != null) { //사용자가 있으면 아래 사항들을 세션에 저장
					System.out.println("inside");
					session.setAttribute("idx", login.getIdx()); //세션에 저장
					session.setAttribute("login", true);
					session.setAttribute("name", login.getName());
					session.setAttribute("id", login.getUser_name());
					session.setAttribute("tier", login.getTier());
					session.setAttribute("nickname", login.getNickname());
					
					json.put("login", "true"); //json 형태로 저장
					json.put("id", login.getUser_name());
					json.put("name", login.getName());
					json.put("nickname", login.getNickname());
					json.put("tier", login.getTier());
								
					response.getWriter().append(json.toJSONString()); //응답에 위 json 형태의 데이터들을 보낸다.
				
					
				} else {
					response.getWriter().append("{\"login\": \"false\"}"); //로그인값이 업으면 login에 null값 저장하면서 응답은 login:false로
					session.setAttribute("login", null);	
				}
			} else {
				response.getWriter().append("{\"login\": \"false\"}"); //login.do명령자체가 오지않았을때도 false로 응답
			}
		}
		//로그아웃
		if(command.equals("/logout.do")){
			session.invalidate(); //세션종료 및 삭제
		}
		// 매치 등록
		// 로그인한 상태에서 아래 링크 "/setMatch.do" 호출하면 매치 등록 
		if(command.equals("/setMatch.do")){ //game테이블에 회원정보저장
			dbmanager.setMatch(session.getAttribute("idx").toString());
		}
		if(command.equals("/outMatch.do")){ //game테이블에 회원정보 삭제
			dbmanager.outMatch(session.getAttribute("idx").toString());
		}
		if(command.equals("/isMatch.do")){
			int isMatch = dbmanager.isMatch(session.getAttribute("idx").toString());
			if(isMatch > 0){
				response.getWriter().append("\"result\": \"1\"");
			} else {
				response.getWriter().append("\"result\": \"0\"");
			}
		}
		// 매치 리스트 JSON 가져오기
		if(command.equals("/getMatch.do")){ //joson 객체 이용하기
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			JSONObject json = null;
			
			List<Match> matchList = dbmanager.getMatch(); //리스트를 받아옴
			for (Match list : matchList ){
				json = new JSONObject();
				json.put("game_idx", list.getGame_idx());
				json.put("applicant", list.getApplicant());
				json.put("user_name", list.getName());
				json.put("nickname", list.getNickname());
				json.put("tier", list.getTier());
				jsonArray.add(json);
			}
			jsonObject.put("game", jsonArray);
			response.getWriter().append(jsonObject.toJSONString());
		}
	}
}