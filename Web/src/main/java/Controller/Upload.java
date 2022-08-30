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

@WebServlet("/Upload")
public class Upload extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String title = request.getParameter("title");
		String writer = member.getId();
		String abs = request.getParameter("abs");
		String content = request.getParameter("content");
		int ipc = Integer.parseInt(request.getParameter("ipc"));
		String tag = request.getParameter("tag");
		
		
		PostDTO post = null;
		PostDAO dao = new PostDAO();

		if (session.getAttribute("post") != null) {
			post = (PostDTO)session.getAttribute("post");
			post.setWriter(member.getId());
			post.setView(0);
			post.setLikes(0);
			ArrayList<PatentDTO> patents = (ArrayList<PatentDTO>)session.getAttribute("patent");
			int cnt = dao.upload(post, patents);

		}
		else {
			post = new PostDTO(writer, title, abs, content, ipc);
			int cnt = dao.upload(post);

		}
		
		
		session.removeAttribute("post");
		session.removeAttribute("patent");
		
		response.sendRedirect("ReadBoard");
	}

}
