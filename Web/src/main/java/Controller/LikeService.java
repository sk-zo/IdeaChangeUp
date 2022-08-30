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
import Model.LikeDAO;
import Model.LikeDTO;

@WebServlet("/LikeService")
public class LikeService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		BoardDTO board = (BoardDTO)session.getAttribute("board");
		ArrayList<LikeDTO> likes = board.getLikes();
		int index = Integer.parseInt(request.getParameter("index"));
		LikeDTO like = likes.get(index);
		LikeDAO dao = new LikeDAO();
		
		if (like.isChecked()) {
			like.setChecked(false);
			dao.UnCheck(like);
		} else {
			like.setChecked(true);
			dao.Check(like);
		}
		
		likes.set(index, like);
		
		response.sendRedirect("ReadBoard");
		
		
	}

}
