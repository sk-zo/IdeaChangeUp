package Model;


import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CompeteDAO {
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
	
	// upload no patents
	public int getRecent() {
		getCon();
		int compete_num = 0;
		sql = "select compete_num from (select compete_num, rank() over(order by compete_num desc) as num from competition) where num=1";
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				compete_num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return compete_num;
	}
	
	public int upload_compete(CompeteDTO dto) {
		getCon();
		sql = "Insert into competition values(competition_num.nextval, ?, ?, ?, ?, ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setInt(3, dto.getCategory());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getDeadline());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return cnt;
	}
	
	public int upload_file(String[] files, int compete_num) {
		getCon();
		try {
			for (int i=0; i<3; i++) {
				sql = "insert into compete_file values(?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, compete_num);
				pstmt.setString(2, files[i]);
				pstmt.setInt(3, i);
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		} return cnt;
	}
	
	public void submit_file(String file_name, String writer, int compete_num) {
		getCon();
		try {
			sql = "insert into submit_file values(?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, compete_num);
			pstmt.setString(2, writer);
			pstmt.setString(3, file_name);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
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
	
	// 전체 공모전
	public ArrayList<CompeteDTO> getCompete() {
		// page, category, sort
		getCon();
		String sql = null;
		ArrayList<CompeteDTO> competes = new ArrayList<CompeteDTO>();
		
		try {
			sql = "select * from competition";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CompeteDTO dto = new CompeteDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCategory(rs.getInt(4));
				dto.setPrice(rs.getInt(5));
				dto.setDeadline(rs.getString(6));
				dto.setPost_time(rs.getString(7));
				competes.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return competes;
	}
	
	// 마이페이지 공모전
	public ArrayList<CompeteDTO> myCompete(String id) {
		// page, category, sort
		getCon();
		String sql = null;
		ArrayList<Integer> compete_nums = new ArrayList<Integer>();
		ArrayList<CompeteDTO> competes = new ArrayList<CompeteDTO>();
		
		try {
			sql = "select compete_num from submit_file where writer=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				compete_nums.add(rs.getInt(1));
			}
			
			for (int i=0; i<compete_nums.size(); i++) {
				sql = "select * from competition where compete_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, compete_nums.get(i));
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					CompeteDTO dto = new CompeteDTO();
					dto.setNum(rs.getInt(1));
					dto.setWriter(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setCategory(rs.getInt(4));
					dto.setPrice(rs.getInt(5));
					dto.setDeadline(rs.getString(6));
					dto.setPost_time(rs.getString(7));
					competes.add(dto);
				}
		
			}
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return competes;
	}
	
	public ArrayList<CompeteDTO> myCompete_(String id) {
		// page, category, sort
		getCon();
		String sql = null;
		ArrayList<CompeteDTO> competes = new ArrayList<CompeteDTO>();
		
		try {
			sql = "select * from competition where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CompeteDTO dto = new CompeteDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCategory(rs.getInt(4));
				dto.setPrice(rs.getInt(5));
				dto.setDeadline(rs.getString(6));
				dto.setPost_time(rs.getString(7));
				competes.add(dto);
			}
		
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return competes;
	}
	
	public String[] getFile(int compete_num) {
		getCon();
		String sql = null;
		String[] files = new String[3];
		try {
			sql = "select file_name from compete_file where compete_num=? and file_group=0";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, compete_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				files[0] = rs.getString(1);
			}
			
			sql = "select file_name from compete_file where compete_num=? and file_group=1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, compete_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				files[1] = rs.getString(1);
			}
			
			sql = "select file_name from compete_file where compete_num=? and file_group=2";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, compete_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				files[2] = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return files;
	}
	
	public ArrayList<String> getSub(ArrayList<CompeteDTO>competes, String id) {
		getCon();
		String sql = null;
		ArrayList<String> submits = new ArrayList<String>();
		try {
			for (int i=0; i<competes.size(); i++) {
				CompeteDTO compete = competes.get(i);
				sql = "select file_path from submit_file where compete_num=? and writer=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, compete.getNum());
				pstmt.setString(2, id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					submits.add(rs.getString(1));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return submits;
	}
	
	public ArrayList<ArrayList<String []>> getSub_(ArrayList<CompeteDTO>competes) {
		getCon();
		String sql = null;
		ArrayList<ArrayList<String []>> submits = new ArrayList<ArrayList<String[]>>();
		try {
			for (int i=0; i<competes.size(); i++) {
				CompeteDTO compete = competes.get(i);
				ArrayList<String[]> submit = new ArrayList<String[]>();
				sql = "select writer, file_path, submit_date from submit_file where compete_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, compete.getNum());
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					String[] sub = new String[3];
					sub[0] = rs.getString(1);
					sub[1] = rs.getString(2);
					sub[2] = rs.getString(3);
					submit.add(sub);
				}
				submits.add(submit);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return submits;
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
