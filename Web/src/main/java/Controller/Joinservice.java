package Controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/Joinservice")
public class Joinservice extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. request 인코딩 작업
		request.setCharacterEncoding("utf-8");
		
		//2. id, pw, tel, address 값 가져오기
		String id =request.getParameter("id"); 
		String pw =request.getParameter("pw"); 
		String phone =request.getParameter("phone");                                                                                 
		
		//3. 잘 넘어오는지 consol 확인
		System.out.println(id+pw+phone);
		
		//4. 데이터들 한번에 묶어서 보내주기 -> model -> DTO 클래스 생성
		int point = 0;
		int grade = 2;
		MemberDTO dto = new MemberDTO(id, pw, phone, point, grade);
		MemberDAO dao = new MemberDAO();
		int result = dao.join(dto);
		
		String moveURL=null;
		if(result > 0) {
			moveURL="JoinSuccess.jsp";
		}else {
			//실패했을 때 메인으로 이동
			moveURL="main.jsp";
		}
		RequestDispatcher re = request.getRequestDispatcher(moveURL);
		re.forward(request, response);
	}
}
