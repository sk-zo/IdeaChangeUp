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
import Model.MemberDTO;
import Model.PostDTO;

@WebServlet("/MyPost")
public class MyPost extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		
		BoardDAO dao = new BoardDAO();
		ArrayList<PostDTO> mypost = dao.getPost(member.getId());
		
		session.setAttribute("mypost", mypost);
		
		response.sendRedirect("Mypage.jsp?index=1");
	}

}
