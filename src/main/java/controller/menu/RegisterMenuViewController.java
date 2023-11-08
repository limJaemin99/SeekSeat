package controller.menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.StoreInfoDAO;
import org.vo.StoreInfo;

import controller.Controller;

//메뉴 정보 입력 컨트롤러
public class RegisterMenuViewController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String store_id = request.getParameter("store_id");
		
		StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
		StoreInfo store = dao.selectByStoreId(store_id);
		String name = store.getName();
		
		request.setAttribute("store_id", store_id);
		request.setAttribute("name", name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("menu_Insert.jsp");	
		dispatcher.forward(request, response);
	}
	
}
