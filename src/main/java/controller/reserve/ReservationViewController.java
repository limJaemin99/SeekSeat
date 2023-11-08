package controller.reserve;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class ReservationViewController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String store_id = request.getParameter("store_id");
		String store_name = request.getParameter("store_name");
		
		request.setAttribute("store_id", store_id);
		request.setAttribute("store_name", store_name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("requestReservation.jsp");
		dispatcher.forward(request, response);
	}
}
