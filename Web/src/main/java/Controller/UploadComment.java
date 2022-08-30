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

@WebServlet("/UploadComment")
public class UploadComment extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		PostDTO post = (PostDTO) session.getAttribute("detail_post");
		String comment = request.getParameter("comment");
		
		CommentDTO dto = new CommentDTO(post.getNum(), member.getId(), comment);
		CommentDAO dao = new CommentDAO();
		
		dao.upload(dto);
		
		ArrayList<CommentDTO> comments = dao.getComment(post.getNum());
		session.setAttribute("comments", comments);

		
		response.sendRedirect("Detail.jsp");
	}

}
