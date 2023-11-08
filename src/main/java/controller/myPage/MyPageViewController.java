package controller.myPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

//회원 구분에 맞는 마이페이지로 이동
public class MyPageViewController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int type = Integer.parseInt(request.getParameter("type"));
			
			//각자 마이 페이지로 이동
			if(type == 1) {	//user
				RequestDispatcher dispatcher = request.getRequestDispatcher("userMyPage.jsp");
				dispatcher.forward(request, response);
			} else if(type == 2) {	//owner
				RequestDispatcher dispatcher = request.getRequestDispatcher("ownerMyPage.jsp");
				dispatcher.forward(request, response);
			}
		}
}
