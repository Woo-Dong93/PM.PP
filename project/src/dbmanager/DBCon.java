package dbmanager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBCon {
    
    private static Connection con; //���α׷����� �������� ����Ҽ��ְ� static���� ����
    
    private DBCon(){ //�ܺο��� �������� ���ϰ� ������ private���� ����       
    }    
    public static Connection getConnection(){

        if(con!=null){ //con�� null�� �ƴϸ� con�� �����ϰ��ִ� connection�ν��Ͻ��� ����
            return con;
        }
        
        try {         
            Class.forName("com.mysql.jdbc.Driver"); //db�� �����ϱ� ���� DriverManager�� ���
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/noodle", "root", "12345678"); //db ����
            
            System.out.println("���� ����");
            
        } catch (ClassNotFoundException e) {
            System.out.println("����̹��� ã���������ϴ� : "+e);
        }catch(SQLException e){
            System.out.println(("�Ϲ� ����:"+e));
        }
        return con;
    }
}