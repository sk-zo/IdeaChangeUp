package Model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDAO {
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
	
	// upload with patents
	public int upload(PostDTO dto, ArrayList<PatentDTO>patents) {
		getCon();
		// post_num, writer, title, abstract, content, category, views, post_time
		sql = "Insert into post values(post_num.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			
			pstmt.setString(3, dto.getAbs());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getCategory());
			pstmt.setInt(6, dto.getView());
			pstmt.setInt(7, dto.getLikes());
			
			cnt = pstmt.executeUpdate();
			
			sql = "select post_num from post where title=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			rs = pstmt.executeQuery();
			
			int post_num = 0;
			if (rs.next()) {
				post_num = rs.getInt(1);
			}
			
			
			for (int i=0; i<patents.size(); i++) {
				PatentDTO patent = patents.get(i);
				sql = "Insert into similar_patent values(?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, post_num);
				pstmt.setString(2, patent.getNum());
				pstmt.setFloat(3, patent.getSim());
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return cnt;
	}
	
	// upload no patents
	public int upload(PostDTO dto) {
		getCon();
		// post_num, writer, title, abstract, content, category, views, post_time
		sql = "Insert into post values(post_num.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getAbs());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getCategory());
			pstmt.setInt(6, dto.getView());
			pstmt.setInt(7, dto.getLikes());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return cnt;
	}
	
	
	
	public int update(PostDTO dto, ArrayList<PatentDTO>patents) {
		getCon();
		// post_num, writer, title, abstract, content, category, views, post_time
		sql = "update post set title=?, abstract=?, content=?, category=?, post_time=sysdate where post_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getAbs());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getCategory());
			pstmt.setInt(5, dto.getNum());
			cnt = pstmt.executeUpdate();
			
			sql = "delete from similar_patent where post_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.executeUpdate();
			
			for (int i=0; i<patents.size(); i++) {
				PatentDTO patent = patents.get(i);
				sql = "Insert into similar_patent values(?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getNum());
				pstmt.setString(2, patent.getNum());
				pstmt.setFloat(3, patent.getSim());
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return cnt;
	}
	
	public int update(PostDTO dto) {
		getCon();
		// post_num, writer, title, abstract, content, category, views, post_time
		sql = "update post set title=?, abstract=?, content=?, category=?, post_time=sysdate where post_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getAbs());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getCategory());
			pstmt.setInt(5, dto.getNum());
			cnt = pstmt.executeUpdate();
			
			sql = "delete from similar_patent where post_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return cnt;
	}
	
	public int addview(PostDTO dto) {
		getCon();
		// post_num, writer, title, abstract, content, category, views, post_time
		sql = "update post set views=? where post_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getView());
			pstmt.setInt(2, dto.getNum());
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return cnt;
	}
	
	
	public PostDTO getPost(int post_num) {
		// page, category, sort
		getCon();
		String sql = null;
		PostDTO dto = new PostDTO();
		try {
			sql = "select post_num, writer, title, abstract, content, category, views, post_time, likes from post where post_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAbs(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCategory(rs.getInt(6));
				dto.setView(rs.getInt(7));
				dto.setLikes(rs.getInt(9));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	
	public void delete(int post_num) {
		getCon();
		try {
			sql = "delete from post where post_num= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
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
