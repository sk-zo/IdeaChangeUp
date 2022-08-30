package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyInfoDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	String sql = null;
	
	public void getCon() {
		try {
			// 1. pom.xml에 있는 ojdbc6.jar 라이브러리 추가
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "";
			String db_id = "";
			String db_pw = "";
			
			conn = DriverManager.getConnection(url, db_id, db_pw);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MyInfoDTO getInfo(String id) {
		getCon();
		MyInfoDTO dto = new MyInfoDTO();
		String sql = null;
		try {
			sql = "select count(*) from post where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setMypost(rs.getInt(1));
			}
			
			sql = "select count(*) from likes where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setLikepost(rs.getInt(1));
			}
			
			sql = "select count(*) from comments where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setMycomment(rs.getInt(1));
			}
			
			sql = "select count(*) from submit_file where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setMycompete(rs.getInt(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	public MyInfoDTO getInfo_(String id) {
		getCon();
		MyInfoDTO dto = new MyInfoDTO();
		String sql = null;
		try {
			sql = "select count(*) from post where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setMypost(rs.getInt(1));
			}
			
			sql = "select count(*) from likes where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setLikepost(rs.getInt(1));
			}
			
			sql = "select count(*) from comments where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setMycomment(rs.getInt(1));
			}
			
			sql = "select count(*) from competition where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setMycompete(rs.getInt(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}if(pstmt != null) {
				pstmt.close();
			}if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
}
}
