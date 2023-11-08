package controller.table;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

// 테이블 등록 View
public class RegisterTableViewController implements Controller {
		
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String store_id = request.getParameter("store_id");
		
		session.setAttribute("store_id", store_id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("table_Register.jsp");
		dispatcher.forward(request, response);
	}
}
