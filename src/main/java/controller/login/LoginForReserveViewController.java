package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

public class LoginForReserveViewController implements Controller{
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String member_type = request.getParameter("member_type");
			String store_id = request.getParameter("store_id");
			
			if(member_type.equals("2") || member_type.equals("3"))
				session.invalidate();
			
			request.setAttribute("forReserve", "true");
			request.setAttribute("store_id", store_id);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
}
