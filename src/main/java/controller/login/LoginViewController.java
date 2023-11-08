package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

//로그인 화면 출력 View
public class LoginViewController implements Controller {
		
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String temp = request.getParameter("back");
			HttpSession session = request.getSession();
			if(temp != null && temp.equals("w"))
				session.setAttribute("back", "index");
			
			String forReserve = request.getParameter("forReserve");
			request.setAttribute("forReserve", forReserve);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}	
}
