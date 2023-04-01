package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {

	// 데이터 베이스 커넥션이 진행되는부분
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	

	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost/wkdgns3030";
			String dbID = "wkdgns3030";
			String dbPassword = "apffltk1!";
			Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버가 구형이면 에러 발생할 수 있음 꼭 확인할것
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 데이터 베이스 커넥션이 끝나는 부분
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				} else 
					return 0; //비밀번호 불일치 체크해봐야함
				
				
			}
			return -1; // 아이디가 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터 베이스 오류를 의미함
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
		
	}
	
	
}
