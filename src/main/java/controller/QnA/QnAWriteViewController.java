package controller.QnA;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

//회원 구분에 맞는 1:1 문의글 쓰기 화면 출력 view
public class QnAWriteViewController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type = Integer.parseInt(request.getParameter("type"));
		
		if(type == 1) {	//일반 회원
				RequestDispatcher dispatcher = request.getRequestDispatcher("userQnAWrite.jsp");
				dispatcher.forward(request, response);
		}else if(type == 2) {	//사장님
				RequestDispatcher dispatcher = request.getRequestDispatcher("ownerQnAWrite.jsp");
				dispatcher.forward(request, response);
		}
	}
}
