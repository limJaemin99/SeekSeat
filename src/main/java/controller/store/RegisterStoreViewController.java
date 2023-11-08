package controller.store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

// 매장 정보 입력 컨트롤러
public class RegisterStoreViewController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			RequestDispatcher dispatcher = request.getRequestDispatcher("store_Insert.jsp");
			dispatcher.forward(request, response);
	}
}
