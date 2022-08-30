package Controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.CompeteDAO;
import Model.CompeteDTO;
import Model.MemberDTO;

@WebServlet("/SubmitCompete")
public class SubmitCompete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		CompeteDTO compete = (CompeteDTO)session.getAttribute("compete");
		int compete_num = compete.getNum();
		String savepath = "C:\\Users\\smhrd\\Desktop\\JSP\\workspace\\Test\\src\\main\\webapp\\img\\competition\\" + Integer.toString(compete_num) + "\\submit"; //폴더 경로
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
		String filename = multi.getFilesystemName("submitfile");
		
		CompeteDAO dao = new CompeteDAO();
		dao.submit_file(filename, writer, compete_num);
		
		response.sendRedirect("ReadCompete");
		
	}
}
