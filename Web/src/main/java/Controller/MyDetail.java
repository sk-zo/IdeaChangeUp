package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BoardDTO;
import Model.CommentDAO;
import Model.CommentDTO;
import Model.CompeteDAO;
import Model.CompeteDTO;
import Model.PatentDAO;
import Model.PatentDTO;
import Model.PostDAO;
import Model.PostDTO;

@WebServlet("/MyDetail")
public class MyDetail extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String m = (String) request.getParameter("m");
		int index = Integer.parseInt(request.getParameter("index"));
		
		if (m.equals("1")) {
			ArrayList<PostDTO> posts = (ArrayList<PostDTO>)session.getAttribute("mypost");
			PostDTO post = posts.get(index);
			
			PatentDAO pdao = new PatentDAO();
			ArrayList<PatentDTO> patents = pdao.getSim(post.getNum());
			
			CommentDAO cdao = new CommentDAO();
			ArrayList<CommentDTO> comments = cdao.getComment(post.getNum());
			
			session.setAttribute("detail_post", post);
			session.setAttribute("detail_patent", patents);
			session.setAttribute("comments", comments);
		}
		
		else if (m.equals("2")) {
			ArrayList<PostDTO> posts = (ArrayList<PostDTO>)session.getAttribute("likepost");
			PostDTO post = posts.get(index);
			
			PatentDAO pdao = new PatentDAO();
			ArrayList<PatentDTO> patents = pdao.getSim(post.getNum());
			
			CommentDAO cdao = new CommentDAO();
			ArrayList<CommentDTO> comments = cdao.getComment(post.getNum());
			
			session.setAttribute("detail_post", post);
			session.setAttribute("detail_patent", patents);
			session.setAttribute("comments", comments);
		}
		
		else if (m.equals("3")) {
			ArrayList<CommentDTO> mycomment = (ArrayList<CommentDTO>)session.getAttribute("mycomment");
			CommentDTO comment = mycomment.get(index);
			
			PostDAO dao = new PostDAO();
			PostDTO post = dao.getPost(comment.getPost_num());
			
			PatentDAO pdao = new PatentDAO();
			ArrayList<PatentDTO> patents = pdao.getSim(comment.getPost_num());
			
			CommentDAO cdao = new CommentDAO();
			ArrayList<CommentDTO> comments = cdao.getComment(comment.getPost_num());
			
			session.setAttribute("detail_post", post);
			session.setAttribute("detail_patent", patents);
			session.setAttribute("comments", comments);
		}
		
		else if (m.equals("4")) {
		}
		response.sendRedirect("Detail.jsp?index=" + Integer.toString(index));
	}

}
