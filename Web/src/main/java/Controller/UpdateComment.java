package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CommentDAO;
import Model.CommentDTO;
import Model.MemberDTO;
import Model.PostDTO;

@WebServlet("/UpdateComment")
public class UpdateComment extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PostDTO post = (PostDTO) session.getAttribute("detail_post");

		CommentDTO comment = (CommentDTO)request.getAttribute("update_comment");
		CommentDAO dao = new CommentDAO();
		dao.update(comment);
		
		ArrayList<CommentDTO> comments = dao.getComment(post.getNum());
		session.setAttribute("comments", comments);
		
		response.sendRedirect("Detail.jsp");
	}

}
