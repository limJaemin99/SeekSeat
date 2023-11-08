package controller.myPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CustomerDAO;
import org.dao.OwnerDAO;
import org.vo.Customer;
import org.vo.Owner;

import controller.Controller;

public class UserReadViewController implements Controller{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//회원 정보 수정 후 View
			int type = Integer.parseInt(request.getParameter("type"));
				
			HttpSession session = request.getSession();
			Customer user_vo = null;
			Owner owner_vo = null;
				
			if(type==1) {
				user_vo = (Customer) session.getAttribute("vo");
				String user_id = user_vo.getId();
				CustomerDAO dao = CustomerDAO.getCustomerDAO();
						
				user_vo = dao.select(user_id);
				session.setAttribute("user", user_vo);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("user_info.jsp");
				dispatcher.forward(request, response);
				
			} else if(type == 2) {	//사장님
				owner_vo = (Owner) session.getAttribute("vo");
				String owner_id = owner_vo.getId();
				OwnerDAO dao = OwnerDAO.getOwnerDAO();
					
				owner_vo = dao.select(owner_id);
				session.setAttribute("user", owner_vo);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("owner_info.jsp");
				dispatcher.forward(request, response);
			}
	}
}
