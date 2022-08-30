package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	String sql = null;
	
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "";
			String db_id = "";
			String db_pw = "";
			
			conn = DriverManager.getConnection(url, db_id, db_pw);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void upload(CommentDTO dto) {
		getCon();
		// post_num, writer, title, abstract, content, category, views, post_time
		sql = "Insert into comments values(comment_num.nextval, ?, ?, ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPost_num());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			
			cnt = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
	}
	
	// 상세페이지 댓글
	public ArrayList<CommentDTO> getComment(int post_num) {
		getCon();
		ArrayList<CommentDTO> comments = new ArrayList<CommentDTO>();
		String sql = null;
		try {
			sql = "select comment_num, post, writer, content from (select comment_num, post, writer, content, rank() over(order by comment_num) as num from comments where post=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setComment_num(rs.getInt(1));
				dto.setPost_num(rs.getInt(2));
				dto.setWriter(rs.getString(3));
				dto.setContent(rs.getString(4));
				comments.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return comments;
	}
	
	// 내가 쓴 댓글
	public ArrayList<CommentDTO> getComment(String id) {
		getCon();
		ArrayList<CommentDTO> comments = new ArrayList<CommentDTO>();
		String sql = null;
		try {
			sql = "select comment_num, post, writer, content, comment_time from (select comment_num, post, writer, content, comment_time, rank() over(order by comment_num) as num from comments where writer=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setComment_num(rs.getInt(1));
				dto.setPost_num(rs.getInt(2));
				dto.setWriter(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setComment_time(rs.getString(5));
				comments.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return comments;
	}
	
	public void delete(int comment_num) {
		getCon();
		try {
			sql = "delete from comments where comment_num= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
	}
	
	public void update(CommentDTO comment) {
		getCon();
		try {
			sql = "update comments set content=?, date=sysdate where comment_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getComment_num());
			pstmt.setString(2, comment.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
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
