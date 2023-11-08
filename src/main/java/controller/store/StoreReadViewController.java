package controller.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.FavoriteDAO;
import org.dao.MenuDAO;
import org.dao.StoreInfoDAO;
import org.vo.Customer;
import org.vo.Favorite;
import org.vo.Menu;
import org.vo.StoreInfo;

import controller.Controller;

public class StoreReadViewController implements Controller {
      @Override
      public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String store_id=request.getParameter("store_id");
         StoreInfoDAO store_dao = StoreInfoDAO.getStoreInfoDAO();
         StoreInfo store = store_dao.selectByStoreId(store_id);
         String name = store.getName();
         
         // store.openTime 과 store.closeTime에서 시간 부분 추출
         String openTime = store.getOpenTime().substring(11, 16);
         String closeTime = store.getCloseTime().substring(11, 16);

         // 현재 시간 가져오기
         java.util.Date currentTime = new java.util.Date();
         java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm");
         String currentTimeString = sdf.format(currentTime);
         
         MenuDAO menu_dao = MenuDAO.getMenuDAO();
         List<Menu> menuList = menu_dao.menuList(store_id);
         
         
         String member_type = request.getParameter("member_type");
         int result = 0;
         
         if(member_type.equals("1")) {
        	 HttpSession session = request.getSession();
        	 Customer user = (Customer) session.getAttribute("user");
        	 String user_id = user.getId();
        	 
        	 FavoriteDAO dao = FavoriteDAO.getFavoriteDAO();
        	 Favorite vo = new Favorite(user_id,store_id,null);
        	 result = dao.selectOne(vo);
         }
         
         request.setAttribute("store", store);
         request.setAttribute("store_id", store_id);
         request.setAttribute("openTime", openTime);
         request.setAttribute("closeTime", closeTime);
         request.setAttribute("name", name);
         request.setAttribute("menuList", menuList);
         request.setAttribute("currentTime", currentTimeString); 
         request.setAttribute("isFavorite", result);
         
         RequestDispatcher dispatcher = request.getRequestDispatcher("search_SelectOne.jsp");
         dispatcher.forward(request, response);
      }
}
