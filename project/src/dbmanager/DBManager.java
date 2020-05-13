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
// Connection�� ����ϱ� ���� ����Ʈ
// DB ����
public class DBManager {
	//Connection ��ü ������.
	public Connection con = DBCon.getConnection(); //3�ܰ踦 ���� 2�ܰ迡�� ����� CONNECTION ��ü�� �����´�.
	
	// ������ ��ü ����Ʈ ��������
	public List<Member> getMember() {
		PreparedStatement pstmt;
		ResultSet rs; //������ �������� ���� ���� ����
		List<Member> list = null;
		
        try {
            list = new ArrayList<Member>();		
            String sql = "select * from member"; 
            pstmt = con.prepareStatement(sql); 
            rs = pstmt.executeQuery(); //���� ����, ������ ��������
            
            while(rs.next()){ //������ ��� (next�̿��ؼ� ���ٽ� �о����) while�� �̿��ؼ� null������ Ȯ���ϸ鼭 �ݺ��� ����
            	Member result = new Member();
            	
            	result.setIdx(rs.getString(1));
            	result.setUser_name(rs.getString(2));
            	result.setUser_password(rs.getString(3));
            	result.setRegister_date(rs.getString(4));
            	result.setName(rs.getString(5));
            	result.setNickname(rs.getString(6));
            	result.setEmail(rs.getString(7));
            	result.setTier(rs.getString(8));
            	list.add(result); //����Ʈ ��ü�� �� ��´�.
            }
            
            rs.close();  //JDBC ���� ����
            pstmt.close(); //JDBC ���� ����
        
        } catch (Exception e) {
            e.printStackTrace(); // �����޼����� �߻� �ٿ����� �ܰ躰�� ��� 
        }
		return list; //���̺��� ���� ȸ�� ����Ʈ��ȯ
    }
	
	// ����� ���
	public void insertMember(Member _member){
		PreparedStatement pstmt; //JDBC�� ����Ͽ� ���̺� SQL���� �Է��ϱ� ���ؼ� PreparedStatement ��ü ���
		int rs;
		String sql = "INSERT INTO member SET user_name=?, user_password=?, register_date=CURDATE(), name=?, nickname=?, email=?, tier=?, mobile=?";
		try {
			pstmt = con.prepareStatement(sql);   //3�ܰ����� (SQL������ �����Ű�� ���� Preparestatement ��ü ������)
			//user_name
			pstmt.setString(1, _member.getUser_name()); // 1��° ?�� name�� �ֱ�
			
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
			
			rs = pstmt.executeUpdate(); //sql���н����ؼ� ȸ���� ��� (4�ܰ�)
			
		} catch (SQLException e) {  //����ó��
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			System.out.println(e.getMessage());
			System.out.println("insert error");
		} 
	}
	
	// ���̵� �ߺ�
	public int checkId(String userid){
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int result = 0;
		try {
			sql = "SELECT COUNT(*) FROM member where user_name=?"; //table�� �ش� id�� ������ 1�� ��ȯ ������ 2�� ��ȯ
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1); //ù��° ������� int������ result�� �־��
			
		} catch (SQLException e){
			System.out.println("Error: check id");
			e.printStackTrace();
		}
		return result;
	}
	
	// �α��� �ϱ�
	public Member login(String userid, String userpassword){
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int result = 0;
		Member member = new Member();
		try {
			sql = "SELECT * FROM member where user_name=? AND user_password=?"; //where ������ �ɾ id�� pwd�� �ش��ϴ� ������ ����
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid); //�α����Ҷ� �Է��� id�� pwd�� �Ķ��Ÿ�� �޾Ƽ� �ش����̺��� ã������ ���δ�
			pstmt.setString(2, userpassword);
			rs = pstmt.executeQuery(); //���̺��� ���� �����´�
			try{
				if(rs.next()){ //���ٽ� �д´�. rs�� ����� ����������
					member.setIdx(rs.getString(1)); //�α��� �Ǿ����� ������ ǥ���ϱ� ���� memberŬ������ �޼ҵ带 ����ؼ� ���̺��� ������ �����Ѵ�.
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
				e.printStackTrace(); // �����޼����� �߻� �ٿ����� �ܰ躰�� ��� 
			}

		} catch (SQLException e){
			System.out.println("Error: check id");
			e.printStackTrace(); // �����޼����� �߻� �ٿ����� �ܰ躰�� ��� 
		} 
		return member; // ����ڰ� �Է��� id�� pwd�� ���� ���̺������� �����Ѵ� / ������� null�� ����
	}
	
	// ��ġ ���
	public void setMatch(String applicant){ //
		PreparedStatement pstmt;
		
		String sql = "INSERT INTO game SET applicant = ?, status = 'on'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, applicant);       //���� ȸ�� ���̺��� idx���� applicant�� �����ϰ� status ���´� on���� ����
			
			pstmt.executeUpdate();  //sql�� ����
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			System.out.println(e.getMessage());
			System.out.println("insert error");
		} 
	}
	// �ǽð����� game���̺� ����
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
	public int isMatch(String idx){ //Ű�� 
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;
		int result = 0; //�ʱ�ȭ
		try {
			sql = "SELECT COUNT(*) FROM game where applicant=?"; //���� �α������� Ű�� idx�� ������ ������ ã�Ƴ�
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1); //ù���� ������� int������ ����.
			
		} catch (SQLException e){
			System.out.println("Error: check id"); //����
			e.printStackTrace();
		}
		return result;
	}
	// ��ġ����Ʈ ��������
	public List<Match> getMatch(){
		PreparedStatement pstmt;
		ResultSet rs;
		List<Match> list = null;
		
        try {
            list = new ArrayList<Match>();		
            String sql = "select * from game LEFT JOIN member ON member.idx=game.applicant WHERE game.status='on'"; //���� member���̺� game������ �߰��ؼ�(��ġ�ϴ°�)��ȯ
            pstmt = con.prepareStatement(sql); 
            rs = pstmt.executeQuery(); //���� ����
            
            while(rs.next()){ //������ ���
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
            
            rs.close(); //����
            pstmt.close(); //����
        
        } catch (Exception e) { //����
            e.printStackTrace();
        }
		return list; //���� ����Ʈ ��ȯ
	}
	// �Խ���
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
			
			rs = pstmt.executeUpdate(); //sql�� ����
			
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
		//��ȸ�� ����
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
	
	//db���� �Խ��� ������ data������
	public List<Bbs> getBbsList(String bbs_name){
		PreparedStatement pstmt;
		ResultSet rs;
		List<Bbs> list = null;
		
        try {
            list = new ArrayList<Bbs>();		
            String sql = "select * from "+ bbs_name + " LEFT JOIN noodle.member ON member.idx="+bbs_name+".writer";
            pstmt = con.prepareStatement(sql); 
            rs = pstmt.executeQuery(); //���� ����
            
            while(rs.next()){ //������ ���
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
	
	//db���� �Խ��� �� �����ϱ�
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