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

@WebServlet("/LoadCompete")
public class LoadCompete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		int index = Integer.parseInt(request.getParameter("index"));
		
		ArrayList<CompeteDTO> competes = (ArrayList<CompeteDTO>)session.getAttribute("competes");
		CompeteDTO compete = competes.get(index);
		
		CompeteDAO dao = new CompeteDAO();
		String[] files = dao.getFile(compete.getNum());
		
		session.setAttribute("compete", compete);
		session.setAttribute("file", files);
		
		response.sendRedirect("DetailCompete.jsp");
	}

}
