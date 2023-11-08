package controller.favorite;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.FavoriteDAO;
import org.vo.Customer;
import org.vo.Favorite;

import controller.Controller;

public class DeleteFavoriteActionController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			
			Customer user = (Customer) session.getAttribute("user");
			
			String user_id = user.getId();
			String store_id = request.getParameter("store_id");
			
			FavoriteDAO dao = FavoriteDAO.getFavoriteDAO();
			Favorite vo = new Favorite(user_id,store_id,null);
			
			int result = dao.delete(vo);
			
			if(result == 1) {	//삭제 완료
				request.setAttribute("message", "즐겨찾기에서 삭제되었습니다.");
			    request.setAttribute("url", "../favorite/userFavorite");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
			    dispatcher.forward(request, response);
			} else {	//삭제 실패
				throw new RuntimeException();
			}
		}
}
