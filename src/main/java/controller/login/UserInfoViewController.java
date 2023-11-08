package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

//내 정보 수정을 위한 로그인 화면 View
public class UserInfoViewController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int type = Integer.parseInt(request.getParameter("type"));
			
			if(type==1) {	//일반 회원
				RequestDispatcher dispatcher = request.getRequestDispatcher("user_info_Login.jsp");
				dispatcher.forward(request, response);
			
			} else if(type == 2) {	//사장님
				RequestDispatcher dispatcher = request.getRequestDispatcher("owner_info_Login.jsp");
				dispatcher.forward(request, response);
			}
		}
}
