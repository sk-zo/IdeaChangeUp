package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDTO;
import Model.MyInfoDAO;
import Model.MyInfoDTO;

@WebServlet("/MyInfo")
public class MyInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		MyInfoDAO dao = new MyInfoDAO();
		if (member.getGrade() == 2) {
			MyInfoDTO myinfo = dao.getInfo(member.getId());
			session.setAttribute("myinfo", myinfo);
		}
		if (member.getGrade() == 1) {
			MyInfoDTO myinfo = dao.getInfo_(member.getId());
			session.setAttribute("myinfo", myinfo);
		}
		
		
		response.sendRedirect("Mypage.jsp");
	}

}
