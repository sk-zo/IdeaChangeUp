package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PatentDAO {
	Connection conn = null;
	String sql;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	public void getCon() {
		String url = "";
		String db_id = "";
		String db_pw = "";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	public String[] getInfo(String num) {
		getCon();
		sql = "select ipc, title, abstract from patent where patent_num = ?";
		String[] info = new String[3];
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				info[0] = Integer.toString(rs.getInt(1));
				info[1] = rs.getString(2);
				info[2] = rs.getString(3);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return info;
	}
	
	public String[] getInfo(String num, int post) {
		getCon();
		sql = "select ipc, title, abstract from patent where patent_num = ?";
		String[] info = new String[4];
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				info[0] = Integer.toString(rs.getInt(1));
				info[1] = rs.getString(2);
				info[2] = rs.getString(3);
			}
			sql = "select similarity from similar_patent where post_num=? and patent_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post);
			pstmt.setString(2, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				info[3] = Float.toString(rs.getFloat(1));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return info;
	}
	
	public ArrayList<PatentDTO> getSim(int post) {
		getCon();
		ArrayList<PatentDTO> patents = new ArrayList<PatentDTO>();
		sql = "select patent_num, similarity from similar_patent where post_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PatentDTO patent = new PatentDTO();
				patent.setNum(rs.getString(1));
				patent.setSim(rs.getFloat(2));
				patents.add(patent);
			}
			for (int i=0; i<patents.size(); i++) {
				PatentDTO patent = patents.get(i);
				sql = "select ipc, title, abstract from patent where patent_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, patent.getNum());
				rs = pstmt.executeQuery();
				while (rs.next() ) {
					patent.setIpc(Integer.toString(rs.getInt(1)));
					patent.setTitle(rs.getString(2));
					patent.setAbs(rs.getString(3));
					patents.set(i, patent);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return patents;
	}
	
	public void close() {
		try {
			if (rs!=null)
				rs.close();
			if (pstmt!=null)
				pstmt.close();
			if (conn!=null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
