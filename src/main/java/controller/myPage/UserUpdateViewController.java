package controller.myPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

//회원 정보 수정 View
public class UserUpdateViewController implements Controller{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type = Integer.parseInt(request.getParameter("type"));
		
		if(type==1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("user_info_Update.jsp");
			dispatcher.forward(request, response);
		} else if(type == 2) {	//사장님
			RequestDispatcher dispatcher = request.getRequestDispatcher("owner_info_Update.jsp");
			dispatcher.forward(request, response);
		}
	}
}
