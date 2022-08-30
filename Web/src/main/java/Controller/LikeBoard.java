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

@WebServlet("/LikeBoard")
public class LikeBoard extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		BoardDTO dto = new BoardDTO();
		
		
		
		if(session.getAttribute("board")!=null) {
			dto = (BoardDTO)session.getAttribute("board");
		}
		
		if (request.getParameter("category") != null ) {
			int category = Integer.parseInt(request.getParameter("category"));
			dto.setCategory(category);
		}
		
		BoardDAO dao = new BoardDAO();
		ArrayList<PostDTO> posts = dao.getLikePost(dto);
		dto.setPosts(posts);
		if (session.getAttribute("member") != null) {
			ArrayList<LikeDTO> likes = dao.getLike(posts, member.getId());
			dto.setLikes(likes);
		}
		session.setAttribute("board", dto);
		session.setAttribute("page", dto.getPage());

		response.sendRedirect("Board.jsp");
	}

}
