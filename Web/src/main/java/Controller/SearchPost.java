package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BoardDAO;
import Model.BoardDTO;
import Model.LikeDTO;
import Model.MemberDTO;
import Model.PostDTO;

@WebServlet("/SearchPost")
public class SearchPost extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		BoardDTO dto = new BoardDTO();
		if(session.getAttribute("board")!=null) {
			dto = (BoardDTO)session.getAttribute("board");
		}
		
		request.setCharacterEncoding("utf-8");
		String query = request.getParameter("query");
		BoardDAO dao = new BoardDAO();
		ArrayList<PostDTO> posts = dao.searchPost(dto, query);
		dto.setPosts(posts);
		if (session.getAttribute("member") != null) {
			ArrayList<LikeDTO> likes = dao.getLike(posts, member.getId());
			dto.setLikes(likes);
		}
		System.out.println(query);
		int page = (posts.size()/10) + 1;
		session.setAttribute("page", page);
		
		session.setAttribute("board", dto);
		
		
		response.sendRedirect("Board.jsp");
	}

}
