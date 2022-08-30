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

@WebServlet("/ReadBoard")
public class ReadBoard extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		BoardDTO dto = new BoardDTO();
		
		
		// 처음 접속
		
		
		BoardDAO dao = new BoardDAO();
		ArrayList<PostDTO> posts = null;
		int page = 1;
		int category = -1;
		// 카테고리 처음 지정
		
		if(session.getAttribute("board")!=null) {
			dto = (BoardDTO)session.getAttribute("board");
		}
		
		if (request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
			dto.setPage(1);
		}
		
		else {
			category = dto.getCategory();
		}
		
		
		
		
		
		if (category == -1) {
			posts = dao.getPost(dto);
			page = dao.getPage();
		}
		else {
			dto.setCategory(category);
			posts = dao.getCatePost(dto);
			page = dao.getCatePage(category);
		}
		dto.setPosts(posts);
		
		
		if (session.getAttribute("member") != null) {
			ArrayList<LikeDTO> likes = dao.getLike(posts, member.getId());
			dto.setLikes(likes);
		}
		
		
		session.setAttribute("board", dto);
		session.setAttribute("page", page);
		
		response.sendRedirect("Board.jsp");
		
	}

}
