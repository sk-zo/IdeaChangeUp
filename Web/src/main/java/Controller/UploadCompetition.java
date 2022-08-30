package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.CompeteDAO;
import Model.CompeteDTO;
import Model.MemberDTO;
import Model.PatentDTO;
import Model.PostDAO;
import Model.PostDTO;
import utils.UploadUtil;

@WebServlet("/UploadCompetition")
public class UploadCompetition extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		CompeteDAO dao = new CompeteDAO();
		int compete_num = dao.getRecent()+1;
		String savepath = "C:\\Users\\smhrd\\Desktop\\JSP\\workspace\\Test\\src\\main\\webapp\\img\\competition\\" + Integer.toString(compete_num); //폴더 경로
		File Folder = new File(savepath);

//		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		
		int maxSize = 1024*1024*5;
		String encoding = "utf-8";
	
		MultipartRequest multi = new MultipartRequest(request, savepath, maxSize, encoding, new DefaultFileRenamePolicy());
		String writer = member.getId();
		String title = multi.getParameter("title");
		int price = Integer.parseInt(multi.getParameter("price"));
		int category = Integer.parseInt(multi.getParameter("category"));
		String deadline = multi.getParameter("deadline");
		
		CompeteDTO dto = new CompeteDTO(writer, title, price, category, deadline);
		dto.setNum(compete_num);
		
		String []filenames = {multi.getFilesystemName("imgfile"), multi.getFilesystemName("docfile"), multi.getFilesystemName("prefile")}; 
		
		
		dao.upload_compete(dto);
		dao.upload_file(filenames, compete_num);
		
		response.sendRedirect("Competition.jsp");
		
		
	}

}
