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
import Model.PatentDAO;
import Model.PatentDTO;
import Model.PostDAO;
import Model.PostDTO;

@WebServlet("/LoadDetail")
public class LoadDetail extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		
		int index = Integer.parseInt(request.getParameter("index"));
		
		BoardDTO board = (BoardDTO)session.getAttribute("board");
		ArrayList<PostDTO> posts = board.getPosts();
		PostDTO post = posts.get(index);
		
		PatentDAO pdao = new PatentDAO();
		ArrayList<PatentDTO> patents = pdao.getSim(post.getNum());
		
		CommentDAO cdao = new CommentDAO();
		ArrayList<CommentDTO> comments = cdao.getComment(post.getNum());
		
		ArrayList<Integer> viewd = (ArrayList<Integer>)session.getAttribute("viewd");
		
		if (!viewd.contains(post.getNum())) {
			viewd.add(post.getNum());
			post.setView(post.getView()+1);
		}
		
		PostDAO podao = new PostDAO();
		podao.addview(post);
		session.setAttribute("viewd", viewd);
		session.setAttribute("detail_post", post);
		session.setAttribute("detail_patent", patents);
		session.setAttribute("comments", comments);
		
		
		
		response.sendRedirect("Detail.jsp?index="+ Integer.toString(index));
	}

}
