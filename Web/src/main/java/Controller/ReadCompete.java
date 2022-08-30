package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CompeteDAO;
import Model.CompeteDTO;

@WebServlet("/ReadCompete")
public class ReadCompete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CompeteDAO dao = new CompeteDAO();
		
		ArrayList<CompeteDTO> competes = dao.getCompete();
		ArrayList<String[]> imgs = new ArrayList<String[]>();
		
		for (int i=0; i<competes.size(); i++) {
			imgs.add(dao.getFile(competes.get(i).getNum()));
		}
		
		session.setAttribute("competes", competes);
		session.setAttribute("imgs", imgs);
		
		response.sendRedirect("Competition.jsp");
		
	}

}
