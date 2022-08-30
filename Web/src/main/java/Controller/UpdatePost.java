package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDTO;
import Model.PatentDTO;
import Model.PostDAO;
import Model.PostDTO;

@WebServlet("/UpdatePost")
public class UpdatePost extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		
		String title = request.getParameter("title");
		String abs = request.getParameter("abs");
		String content = request.getParameter("content");
		int ipc = Integer.parseInt(request.getParameter("ipc"));
		int index = Integer.parseInt(request.getParameter("index"));
		
		
		PostDTO post = (PostDTO)session.getAttribute("post");
		post.setTitle(title);
		post.setAbs(abs);
		post.setContent(content);
		post.setCategory(ipc);

		PostDAO dao = new PostDAO();
		if (session.getAttribute("patent") == null) {
			dao.update(post);
		}
		else {
			ArrayList<PatentDTO> patents = (ArrayList<PatentDTO>)session.getAttribute("patent");
			dao.update(post, patents);
		}
		
		
		session.removeAttribute("post");
		session.removeAttribute("patent");
		
		response.sendRedirect("ReadBoard");
	}

}
