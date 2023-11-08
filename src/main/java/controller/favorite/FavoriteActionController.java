package controller.favorite;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.FavoriteDAO;
import org.dao.StoreInfoDAO;
import org.vo.Customer;
import org.vo.Favorite;
import org.vo.StoreInfo;

import controller.Controller;

public class FavoriteActionController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			
			String store_id = request.getParameter("store_id");
			StoreInfoDAO storeDAO = StoreInfoDAO.getStoreInfoDAO();
			StoreInfo store = storeDAO.selectByStoreId(store_id);
			String store_name = store.getName();
			
			Customer user = (Customer) session.getAttribute("user");
			String user_id = user.getId();
			
			String forReserve = "true";
			
			FavoriteDAO dao = FavoriteDAO.getFavoriteDAO();
			Favorite vo = new Favorite(user_id,store_id,store_name);
			
			int isExist = dao.selectOne(vo);
			int result = 0;
			
			if(isExist == 1) {	//이미 있음 ▶ 삭제
				result = dao.delete(vo);
			} else if(isExist == 0) {	//없음 ▶ 등록
				result = dao.insert(vo);
			}
			
			if(isExist == 1 && result == 1) {	//즐겨찾기 삭제 성공
				request.setAttribute("message", "즐겨찾기에서 삭제되었습니다.");
			    request.setAttribute("url", "../search/searchStoreInfo");
				
			    request.setAttribute("forReserve", forReserve);
			    request.setAttribute("store_id", store_id);
			    request.setAttribute("store", store);
			    request.setAttribute("isFavorite", 0);
			    request.setAttribute("member_type", "1");
			    
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
			    dispatcher.forward(request, response);
			} else if(isExist == 0 && result == 1) {	//즐겨찾기 등록 성공
				request.setAttribute("message", "즐겨찾기에 등록되었습니다.");
			    request.setAttribute("url", "../search/searchStoreInfo");
				
			    request.setAttribute("forReserve", forReserve);
			    request.setAttribute("store_id", store_id);
			    request.setAttribute("store", store);
			    request.setAttribute("isFavorite", 1);
			    request.setAttribute("member_type", "1");
			    
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
			    dispatcher.forward(request, response);
			}
		}
}
