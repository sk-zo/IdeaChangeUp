package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LikeDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	String result = null;
	
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
	
	public void close() {
			try {
				if(rs != null) {
					rs.close();
				}if(psmt != null) {
					psmt.close();
				}if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	
	
	public void Check(LikeDTO dto) {
		getCon();
		
		try {
			String sql = "insert into likes values(?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_num());
			psmt.setString(2, dto.getId());
			cnt = psmt.executeUpdate();
			sql = "update post set likes=likes+1 where post_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_num());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public void UnCheck(LikeDTO dto) {
		getCon();
		
		try {
			String sql = "delete from likes where post_num=? and id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_num());
			psmt.setString(2, dto.getId());
			cnt = psmt.executeUpdate();
			sql = "update post set likes=likes-1 where post_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getPost_num());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
}
