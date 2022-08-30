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
import Model.CompeteDAO;
import Model.CompeteDTO;
import Model.MemberDTO;
import Model.PostDTO;

@WebServlet("/MyCompete")
public class MyCompete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		CompeteDAO dao = new CompeteDAO();
		
		if (member.getGrade() ==2) {
			ArrayList<CompeteDTO> mycompete = dao.myCompete(member.getId());
			ArrayList<String[]> imgs = new ArrayList<String[]>();
			
			for (int i=0; i<mycompete.size(); i++) {
				imgs.add(dao.getFile(mycompete.get(i).getNum()));
			}
			ArrayList<String> submits = dao.getSub(mycompete, member.getId());
			
			session.setAttribute("competes", mycompete);
			session.setAttribute("files", imgs);
			session.setAttribute("submits", submits);
		}
		
		if (member.getGrade() == 1) {
			ArrayList<CompeteDTO> mycompete = dao.myCompete_(member.getId());
			ArrayList<String[]> imgs = new ArrayList<String[]>();
			
			for (int i=0; i<mycompete.size(); i++) {
				imgs.add(dao.getFile(mycompete.get(i).getNum()));
			}
			
			ArrayList<ArrayList<String[]>> submits = dao.getSub_(mycompete);
			
			session.setAttribute("competes", mycompete);
			session.setAttribute("files", imgs);
			session.setAttribute("submits", submits);
		}
		
		
		response.sendRedirect("Mypage.jsp?index=4");
	}

}
