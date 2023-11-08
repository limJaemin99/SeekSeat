package controller.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.StoreInfoDAO;
import org.vo.Owner;
import org.vo.StoreInfo;

import controller.Controller;

//매장 정보 리스트 출력
public class StoreListViewController implements Controller {
		
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Owner owner = (Owner) session.getAttribute("user");
		String id = owner.getId();
		
		StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
		List<StoreInfo> list = dao.selectByOwner(id);
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("store_List.jsp");
		dispatcher.forward(request, response);
	}
}
