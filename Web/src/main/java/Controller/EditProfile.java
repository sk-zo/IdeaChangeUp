package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		member.setPw(pw);
		member.setPhone(tel);
		
		MemberDAO dao = new MemberDAO();
		dao.update(member);
		
		session.setAttribute("member", member);
		response.sendRedirect("main.jsp");
	}

}
