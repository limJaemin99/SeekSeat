package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

//비밀번호 재설정 화면 출력 View
public class FindPasswordViewController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			session.removeAttribute("id");
			session.removeAttribute("email");
			session.removeAttribute("type");
			session.removeAttribute("code");
			session.removeAttribute("returnType");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("resetPassword.jsp");
			dispatcher.forward(request, response);
		}
}
