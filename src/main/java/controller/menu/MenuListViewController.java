package controller.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.MenuDAO;
import org.dao.StoreInfoDAO;
import org.vo.Menu;
import org.vo.StoreInfo;

import controller.Controller;

//메뉴 정보 리스트 출력
public class MenuListViewController implements Controller {
		
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String store_id = request.getParameter("store_id");
		
		StoreInfoDAO store_dao = StoreInfoDAO.getStoreInfoDAO();
		StoreInfo store = store_dao.selectByStoreId(store_id);
		String name = store.getName();
		
		MenuDAO dao = MenuDAO.getMenuDAO();
		List<Menu> list = dao.menuList(store_id);
		
		request.setAttribute("list", list);
		request.setAttribute("store_id", store_id);
		request.setAttribute("name", name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("menu_List.jsp");
		dispatcher.forward(request, response);
	}
}
