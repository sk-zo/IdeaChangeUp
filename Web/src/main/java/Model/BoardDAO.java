package Model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	String result = null;
	
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
	
	public int getPage() {
		getCon();
		String sql = null;
		int page = 0;
		try {
			sql = "select count(*) from post";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int rows = rs.getInt(1);
				page = (rows / 10) + 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return page;
	}
	
	public int getCatePage(int category) {
		getCon();
		String sql = null;
		int page = 0;
		try {
			sql = "select count(*) from post where category = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, category);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int rows = rs.getInt(1);
				page = (rows / 10) + 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return page;
	}
	
	// board getpost
	public ArrayList<PostDTO> getPost(BoardDTO board) {
		// page, category, sort
		getCon();
		ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
		String sql = null;
		int page = board.getPage();
		try {
			sql = "select post_num, writer, title, abstract, content, category, views, post_time, likes from (select post_num, writer, title, abstract, content, category, views, post_time, likes, rank() over(order by post_num desc) as num from post) where num between ? and ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, (page-1)*10+1);
			psmt.setInt(2, (page)*10);
			rs = psmt.executeQuery();

			while (rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAbs(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCategory(rs.getInt(6));
				dto.setView(rs.getInt(7));
				dto.setPost_time(rs.getString(8));
				dto.setLikes(rs.getInt(9));
				posts.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return posts;
	}
	
	
	
	
	// mypage getpost
	public ArrayList<PostDTO> getPost(String id) {
		// page, category, sort
		getCon();
		ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
		String sql = null;
		try {
			sql = "select post_num, writer, title, abstract, content, category, views, post_time, likes from (select post_num, writer, title, abstract, content, category, views, post_time, likes, rank() over(order by post_num) as num from post where writer=?) where num <= 10";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAbs(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCategory(rs.getInt(6));
				dto.setView(rs.getInt(7));
				dto.setPost_time(rs.getString(8));
				dto.setLikes(rs.getInt(9));
				posts.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return posts;
	}
	
	// board like post
	public ArrayList<PostDTO> getLikePost(BoardDTO board) {
		// page, category, sort
		getCon();
		ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
		int page = board.getPage();
		String sql = null;
		try {
			sql = "select post_num, writer, title, abstract, content, category, views, post_time, likes from (select post_num, writer, title, abstract, content, category, views, post_time, likes, rank() over(order by likes desc, post_num desc) as num from post) where num between ? and ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, (page-1)*10+1);
			psmt.setInt(2, (page)*10);
			rs = psmt.executeQuery();

			while (rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAbs(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCategory(rs.getInt(6));
				dto.setView(rs.getInt(7));
				dto.setPost_time(rs.getString(8));
				dto.setLikes(rs.getInt(9));
				posts.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return posts;
	}
	
	
	// mypage like post
	public ArrayList<PostDTO> getLikePost(String id) {
		// page, category, sort
		getCon();
		ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
		String sql = null;
		try {
			sql = "select post_num from likes where id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				PostDTO post = new PostDTO();
				post.setNum(rs.getInt(1));
				posts.add(post);
			}
			
			for (int i=0; i<posts.size(); i++) {
				sql = "select post_num, writer, title, abstract, content, category, views, post_time, likes from post where post_num = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, posts.get(i).getNum());
				rs = psmt.executeQuery();
				while (rs.next()) {
					PostDTO dto = new PostDTO();
					dto.setNum(rs.getInt(1));
					dto.setWriter(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setAbs(rs.getString(4));
					dto.setContent(rs.getString(5));
					dto.setCategory(rs.getInt(6));
					dto.setView(rs.getInt(7));
					dto.setPost_time(rs.getString(8));
					dto.setLikes(rs.getInt(9));
					posts.set(i, dto);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return posts;
	}
	
	public ArrayList<PostDTO> getCatePost(BoardDTO board) {
		// page, category, sort
		getCon();
		ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
		String sql = null;
		int page = board.getPage();
		try {
			sql = "select post_num, writer, title, abstract, content, category, views, post_time, likes from (select post_num, writer, title, abstract, content, category, views, post_time, likes, rank() over(order by post_num) as num from post where category=?) where num between ? and ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board.getCategory());
			psmt.setInt(2, (page-1)*10+1);
			psmt.setInt(3, (page)*10);
			rs = psmt.executeQuery();

			while (rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAbs(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCategory(rs.getInt(6));
				dto.setView(rs.getInt(7));
				dto.setLikes(rs.getInt(9));
				posts.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return posts;
	}
	
	public ArrayList<PostDTO> searchPost(BoardDTO board, String query) {
		// page, category, sort
		getCon();
		ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
		
		try {
			String sql = "select post_num, writer, title, abstract, content, category, views, post_time, likes from (select post_num, writer, title, abstract, content, category, views, post_time, likes, rank() over(order by post_num) as num from post where abstract like " + "'%" + query + "%')";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setAbs(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCategory(rs.getInt(6));
				dto.setView(rs.getInt(7));
				dto.setLikes(rs.getInt(9));
				posts.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return posts;
	}
	
	public ArrayList<LikeDTO> getLike(ArrayList<PostDTO> posts, String id) {
		// page, category, sort
		getCon();
		ArrayList<LikeDTO> likes = new ArrayList<LikeDTO>();
		
		try {
			for (int i=0; i<posts.size(); i++) {
				PostDTO post = posts.get(i);
				String sql = "select * from likes where post_num=? and id=?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, post.getNum());
				psmt.setString(2, id);
				rs = psmt.executeQuery();
				LikeDTO like = new LikeDTO(post.getNum(), id);
				
				if (rs.next()) {
					like.setChecked(true);
				}
				else {
					like.setChecked(false);
				}
				likes.add(like);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return likes;
	}
	

	
}