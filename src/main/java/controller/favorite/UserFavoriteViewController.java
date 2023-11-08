package controller.favorite;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.FavoriteDAO;
import org.vo.Customer;
import org.vo.Favorite;

import controller.Controller;

public class UserFavoriteViewController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			
			Customer user = (Customer) session.getAttribute("user");
			String user_id = user.getId();
			
			FavoriteDAO dao = FavoriteDAO.getFavoriteDAO();
			List<Favorite> list = dao.selectList(user_id);
			
			request.setAttribute("list", list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../mypage/user_Favorite.jsp");
		    dispatcher.forward(request, response);
		}
}
