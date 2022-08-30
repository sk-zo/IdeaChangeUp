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

@WebServlet("/DeleteComment")
public class DeleteComment extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PostDTO post = (PostDTO) session.getAttribute("detail_post");

		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		CommentDAO dao = new CommentDAO();
		dao.delete(comment_num);
		
		ArrayList<CommentDTO> comments = dao.getComment(post.getNum());
		session.setAttribute("comments", comments);
		
		response.sendRedirect("Detail.jsp");
	}

}
