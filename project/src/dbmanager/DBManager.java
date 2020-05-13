package dbmanager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.MemberValuePair;

import com.sun.org.apache.regexp.internal.REUtil;
// Connection을 사용하기 위해 임포트
// DB 관리
public class DBManager {
	//Connection 객체 얻어오기.
	public Connection con = DBCon.getConnection(); //3단계를 위해 2단계에서 진행된 CONNECTION 객체를 가져온다.
	
	// 가입자 전체 리스트 가져오기
	public List<Member> getMember() {
		PreparedStatement pstmt;
		ResultSet rs; //쿼리갑 가져오기 위해 변수 선언
		List<Member> list = null;
		
        try {
            list = new ArrayList<Member>();		
            String sql = "select * from member"; 
            pstmt = con.prepareStatement(sql); 
            rs = pstmt.executeQuery(); //쿼리 실행, 쿼리값 가져오기
            
            while(rs.next()){ //데이터 출력 (next이용해서 한줄식 읽어오기) while문 이용해서 null값인지 확인하면서 반복분 시행
            	Member result = new Member();
            	
            	result.setIdx(rs.getString(1));
            	result.setUser_name(rs.getString(2));
            	result.setUser_password(rs.getString(3));
            	result.setRegister_date(rs.getString(4));
            	result.setName(rs.getString(5));
            	result.setNickname(rs.getString(6));
            	result.setEmail(rs.getString(7));
            	result.setTier(rs.getString(8));
            	list.add(result); //리스트 객체에 다 담는다.
            }
            
            rs.close();  //JDBC 연걸 종료
            pstmt.close(); //JDBC 연걸 종료
        
        } catch (Exception e) {
            e.printStackTrace(); // 에러메세지의 발생 근원지를 단계별로 출력 
        }
		return list; //테이블에서 뽑은 회원 리스트반환
    }
	
	// 사용자 등록
	public void insertMember(Member _member){
		PreparedStatement pstmt; //JDBC를 사용하여 테이블에 SQL문을 입력하기 위해서 PreparedStatement 객체 사용
		int rs;
		String sql = "INSERT INTO member SET user_name=?, user_password=?, register_date=CURDATE(), name=?, nickname=?, email=?, tier=?, mobile=?";
		try {
			pstmt = con.prepareStatement(sql);   //3단계진행 (SQL구문을 실행시키기 위한 Preparestatement 객체 얻어오기)
			//user_name
			pstmt.setString(1, _member.getUser_name()); // 1번째 ?에 name값 넣기
			
			//user_password
			pstmt.setString(2, _member.getUser_password());
			
			//name
			pstmt.setString(3, _member.getName());
			
			//nickname
			pstmt.setString(4, _member.getNickname());
			
			//email
			pstmt.setString(5, _member.getEmail());
			
			//tier
			pstmt.setString(6, _member.getTier());
			
			//Mobile
			pstmt.setString(7, _member.getMobile());
			
			rs = pstmt.executeUpdate(); //sql구분실행해서 회원을 등록 (4단계)
			
		} catch (SQLException e) {  //예외처리
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			System.out.println(e.getMessage());
			System.out.println("insert error");
		} 
	}
	
	// 아이디 중복
	public int checkId(String userid){
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int result = 0;
		try {
			sql = "SELECT COUNT(*) FROM member where user_name=?"; //table에 해당 id가 있으면 1을 반환 없으면 2를 반환
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1); //첫번째 결과값을 int형으로 result에 넣어라
			
		} catch (SQLException e){
			System.out.println("Error: check id");
			e.printStackTrace();
		}
		return result;
	}
	
	// 로그인 하기
	public Member login(String userid, String userpassword){
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int result = 0;
		Member member = new Member();
		try {
			sql = "SELECT * FROM member where user_name=? AND user_password=?"; //where 조건을 걸어서 id와 pwd에 해당하는 데이터 뽑음
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid); //로그인할때 입력한 id와 pwd을 파라메타로 받아서 해당테이블을 찾기위해 쓰인다
			pstmt.setString(2, userpassword);
			rs = pstmt.executeQuery(); //테이블의 값을 가져온다
			try{
				if(rs.next()){ //한줄식 읽는다. rs의 결과가 있을때가지
					member.setIdx(rs.getString(1)); //로그인 되었을대 정보를 표시하기 위해 member클래스의 메소드를 사용해서 테이블의 정보를 저장한다.
					member.setUser_name(rs.getString("user_name"));
					member.setUser_password(rs.getString("user_password"));
					member.setRegister_date(rs.getString("register_date"));
					member.setName(rs.getString("name"));
					member.setEmail(rs.getString("email"));
					member.setTier(rs.getString("tier"));
					member.setMobile(rs.getString("mobile"));
					member.setNickname(rs.getString("nickname"));
				} else {
					member = null;
				}
			} catch (Exception e) {
				e.printStackTrace(); // 에러메세지의 발생 근원지를 단계별로 출력 
			}

		} catch (SQLException e){
			System.out.println("Error: check id");
			e.printStackTrace(); // 에러메세지의 발생 근원지를 단계별로 출력 
		} 
		return member; // 사용자가 입력한 id와 pwd에 대한 테이블정보를 리턴한다 / 없을경우 null값 리턴
	}
	
	// 매치 등록
	public void setMatch(String applicant){ //
		PreparedStatement pstmt;
		
		String sql = "INSERT INTO game SET applicant = ?, status = 'on'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, applicant);       //사용잫 회원 테이블의 idx값을 applicant에 저장하고 status 상태는 on으로 저장
			
			pstmt.executeUpdate();  //sql문 저장
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			System.out.println(e.getMessage());
			System.out.println("insert error");
		} 
	}
	// 실시간으로 game테이블에 삭제
	public void outMatch(String applicant){
		PreparedStatement pstmt;
		String sql;
		try{
			sql = "DELETE FROM game WHERE applicant=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, applicant);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int isMatch(String idx){ //키로 
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int result = 0; //초기화
		try {
			sql = "SELECT COUNT(*) FROM game where applicant=?"; //현제 로그인중인 키의 idx을 가지고 정보를 찾아냄
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1); //첫번쨰 결과물을 int형으로 저장.
			
		} catch (SQLException e){
			System.out.println("Error: check id"); //예외
			e.printStackTrace();
		}
		return result;
	}
	// 매치리스트 가져오기
	public List<Match> getMatch(){
		PreparedStatement pstmt;
		ResultSet rs;
		List<Match> list = null;
		
        try {
            list = new ArrayList<Match>();		
            String sql = "select * from game LEFT JOIN member ON member.idx=game.applicant WHERE game.status='on'"; //왼쪽 member테이블에 game테일을 추가해서(일치하는것)반환
            pstmt = con.prepareStatement(sql); 
            rs = pstmt.executeQuery(); //쿼리 실행
            
            while(rs.next()){ //데이터 출력
            	Match result = new Match();
            	result.setGame_idx(rs.getString("game_idx"));
            	result.setApplicant(rs.getString("applicant"));
            	result.setAcceptor(rs.getString("acceptor"));
            	result.setStatus(rs.getString("status"));
            	result.setUserid(rs.getString("user_name"));
            	result.setName(rs.getString("name"));
            	result.setNickname(rs.getString("nickname"));
            	result.setTier(rs.getString("tier"));
            	list.add(result);
            }
            
            rs.close(); //종료
            pstmt.close(); //종료
        
        } catch (Exception e) { //예외
            e.printStackTrace();
        }
		return list; //최종 리스트 반환
	}
	// 게시판
	// 
	public void	insertBbs(String bbs_name, Bbs dto){
		PreparedStatement pstmt;
		int rs;
		String sql = "INSERT INTO "+ bbs_name +" SET title=?, writer=?, content=?, reg_date=CURDATE()";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			
			rs = pstmt.executeUpdate(); //sql문 실행
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			System.out.println(e.getMessage());
			System.out.println("BBS insert error");
		}
	}
	public Bbs viewBbs(String bbs_name, String bbs_idx){
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int result = 0;
		Bbs bbs = new Bbs();
		try {
			sql = "SELECT * FROM " + bbs_name  + " where bbs_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_idx);
			rs = pstmt.executeQuery();
			try{
				if(rs.next()){
					bbs.setBbs_idx(rs.getString(1));
					bbs.setTitle(rs.getString(2));
					bbs.setWriter(rs.getString(3));
					bbs.setReg_date(rs.getString(4));
					bbs.setHit(rs.getString(5));
					bbs.setContent(rs.getString(6));
				} else {
					bbs = null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (SQLException e){
			System.out.println("Error: check id");
			e.printStackTrace();
		} 
		//조회수 증가
		try{
			sql = "UPDATE "+ bbs_name +" SET hit=hit+1 WHERE bbs_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbs_idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//db에서 게시판 보여줄 data얻어오기
	public List<Bbs> getBbsList(String bbs_name){
		PreparedStatement pstmt;
		ResultSet rs;
		List<Bbs> list = null;
		
        try {
            list = new ArrayList<Bbs>();		
            String sql = "select * from "+ bbs_name + " LEFT JOIN noodle.member ON member.idx="+bbs_name+".writer";
            pstmt = con.prepareStatement(sql); 
            rs = pstmt.executeQuery(); //쿼리 실행
            
            while(rs.next()){ //데이터 출력
            	Bbs result = new Bbs();
            	
            	result.setBbs_idx(rs.getString(1));
            	result.setTitle(rs.getString(2));
            	result.setWriter(rs.getString("user_name"));
            	result.setReg_date(rs.getString(4));
            	result.setHit(rs.getString(5));
            	result.setContent(rs.getString(6));

            	list.add(result);
            }
            rs.close();
            pstmt.close();
        
        } catch (Exception e) {
            e.printStackTrace();
        }
		return list;
	}
	
	//db에서 게시판 글 삭제하기
	public void delBbs(String bbs_name, String idx){
		PreparedStatement pstmt;
		String sql;
		try{
			sql = "DELETE FROM "+ bbs_name +" WHERE bbs_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}