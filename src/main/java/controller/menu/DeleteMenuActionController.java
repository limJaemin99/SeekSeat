package controller.menu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.MenuDAO;

import controller.Controller;

//메뉴 정보 삭제 컨트롤러
public class DeleteMenuActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String store_id = request.getParameter("store_id");
		
		String menu_name = request.getParameter("menu_name");
		
		MenuDAO menu_dao = MenuDAO.getMenuDAO();
		
		int result = menu_dao.delete(menu_name);
		if (result == 1) { // 삭제 완료
			request.setAttribute("title", "삭제 완료!");
			request.setAttribute("message", "["+menu_name+"] 메뉴가 삭제되었습니다");
		    request.setAttribute("url", "menuList?store_id="+store_id);		 
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
			dispatcher.forward(request, response);
		} else { // 등록 실패
			request.setAttribute("title", "삭제 실패");
			request.setAttribute("message", "메뉴 삭제를 실패했습니다");
		    request.setAttribute("url", "menuList?store_id="+store_id);	
		      
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
			dispatcher.forward(request, response);
		}
	}
}
