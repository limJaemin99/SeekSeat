package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CustomerDAO;
import org.vo.Customer;

import controller.Controller;

//일반 회원 정보
public class userProfileViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		CustomerDAO dao = CustomerDAO.getCustomerDAO();
		List<Customer> list = dao.userSelect();
		
		session.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin_userProfile.jsp");
		dispatcher.forward(request, response);
	}
}
