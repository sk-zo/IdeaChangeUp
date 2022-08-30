package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BoardDTO;
import Model.CommentDAO;
import Model.CommentDTO;
import Model.PatentDAO;
import Model.PatentDTO;
import Model.PostDAO;
import Model.PostDTO;

@WebServlet("/DeletePost")
public class DeletePost extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		PostDAO dao = new PostDAO();
		
		dao.delete(post_num);
		
		response.sendRedirect("ReadBoard");
		
	}

}
