package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	//회원정보 데이터베이스에 연결
	Connection conn= null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "";
			String db_id = "";
			String db_pw = "";
			conn=DriverManager.getConnection(url, db_user, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
			try {
				if (rs != null){
					rs.close();
				}if(psmt != null) {
					psmt.close();
				}if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
		}
	}
	
	//회원가입 메소드
	public int join(MemberDTO dto) {
		getCon();
		
		try {
			String sql = "insert into member values(?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getPhone());
			psmt.setInt(4, dto.getPoint());
			psmt.setInt(5, dto.getGrade());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	}
	//로그인 메소드
	public MemberDTO login(MemberDTO dto) {
		getCon();
		
		try {
			String sql = "select * from member where id = ? and password=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String phone = rs.getString(3);
				int point = rs.getInt(4);
				int grade = rs.getInt(5);
				
				dto = new MemberDTO(id, pw, phone, point, grade);
			}else {
				dto = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	//회원정보 수정 메소드
	public int update(MemberDTO dto) {
		getCon();
		
		try {
			String sql = "update member set password=?, phone=? where id=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getId());
			
			cnt = psmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	//전체회원 조회 메소드
	ArrayList<MemberDTO> list = new ArrayList<>();
	public ArrayList<MemberDTO> select() {
		getCon();
		
		try {
			String sql = "select * from member";
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String phone = rs.getString(3);
				int point = rs.getInt(4);
				int grade = rs.getInt(5);
				
				MemberDTO dto = new MemberDTO(id, pw, phone, point, grade);
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
}