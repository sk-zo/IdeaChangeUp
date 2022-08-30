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

@WebServlet("/MyComment")
public class MyComment extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		CommentDAO dao = new CommentDAO();
		ArrayList<CommentDTO> mycomment = dao.getComment(member.getId());
		
		session.setAttribute("mycomment", mycomment);
		
		response.sendRedirect("Mypage.jsp?index=3");
	}

}
