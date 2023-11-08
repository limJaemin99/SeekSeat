package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.OwnerDAO;
import org.dao.StoreInfoDAO;
import org.vo.Owner;

import controller.Controller;

//일반 회원 정보
public class ownerProfileViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		OwnerDAO dao = OwnerDAO.getOwnerDAO();
		List<Owner> list = dao.userSelect();
		StoreInfoDAO store_dao = StoreInfoDAO.getStoreInfoDAO();
		for (Owner owner : list) {
		    String id = owner.getId();
		    int result = store_dao.countStore(id);
		    owner.setCount(result);
		} 
		
		session.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin_ownerProfile.jsp");
		dispatcher.forward(request, response);
	}
}
