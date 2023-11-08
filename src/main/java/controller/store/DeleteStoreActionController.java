package controller.store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.StoreInfoDAO;

import controller.Controller;

public class DeleteStoreActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();

		String store_id = request.getParameter("store_id");
		String name = request.getParameter("name");
		
		System.out.println(name+" | "+store_id);
		
		int result = dao.delete(store_id);

		if (result == 1) { // 삭제 완료
			request.setAttribute("title", "삭제 완료!");
			request.setAttribute("message", "["+name+"] 매장이 삭제되었습니다");
		    request.setAttribute("url", "storeList");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
			dispatcher.forward(request, response);
		} else { // 등록 실패
			request.setAttribute("title", "삭제 실패");
			request.setAttribute("message", "매장 삭제를 실패했습니다");
		    request.setAttribute("url", "storeList");
		      
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
			dispatcher.forward(request, response);
		}
	}
}