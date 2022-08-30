package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BoardDTO;

@WebServlet("/SetPage")
public class SetPage extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int page = Integer.parseInt(request.getParameter("page"));
		BoardDTO board = (BoardDTO)session.getAttribute("board");
		
		board.setPage(page);
		
		session.setAttribute("board", board);
		
		response.sendRedirect("ReadBoard");
		
	}

}
