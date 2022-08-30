package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	//로그인을 처리하기 위한 controller
	//로그인을 하고자 하는 데이터 값 받아오기
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//로그인을 할 수있는 회원인지 확인 필요->데이터베이스 접근
	MemberDTO dto = new MemberDTO(id, pw);
	MemberDAO dao = new MemberDAO();
	
	MemberDTO info = dao.login(dto);
	//확인 후 로그인 성공과 실패에 따른 페이지 결과 띄워주기
	 if (info != null) {
	request.setAttribute("id", id);
		//3. session 서비스를 사용하는 내내 회원정보 유지
		HttpSession session = request.getSession();
		session.setAttribute("member", info);
		System.out.println("login success");
	 }
		//4. application 모든 웹에 로그인 정보 가져가기
	response.sendRedirect("main.jsp");;
	}
}