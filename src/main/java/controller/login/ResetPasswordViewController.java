package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

//이메일 인증 이후 비밀번호 재설정 화면 출력 view
public class ResetPasswordViewController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher dispatcher = request.getRequestDispatcher("resetPassword.jsp");
			dispatcher.forward(request, response);
		}
}
