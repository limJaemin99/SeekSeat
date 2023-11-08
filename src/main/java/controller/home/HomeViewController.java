package controller.home;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CommunityDAO;
import org.dao.StoreInfoDAO;
import org.vo.Owner;
import org.vo.Paging;
import org.vo.StoreInfo;

import controller.Controller;

public class HomeViewController implements Controller {
      @Override
      public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session = request.getSession();
         
         if(session.getAttribute("user") == null)
        	 session.setAttribute("type", 0);
         
         if((int)session.getAttribute("type") == 1) {
        	 CommunityDAO dao = CommunityDAO.getCommunityDAO();
        	 int currentPage = 1;

        	 String page=request.getParameter("page");
        	 if(page != null)
        		 currentPage = Integer.parseInt(page);
        	 
        	 int pageSize=10;      
        	 int totalCount = dao.count();
            
        	 Paging paging = new Paging(currentPage, totalCount, pageSize);
            
        	 Map<String,Integer> map = new HashMap<>();
        	 map.put("start",paging.getStartNo());
        	 map.put("end",paging.getEndNo());
            
        	 request.setAttribute("home", dao.pagelist(map));
        	 request.setAttribute("paging", paging);
        	 request.setAttribute("today", LocalDate.now());
         } 
         
         if((int)session.getAttribute("type") == 2) {
        	 Owner owner = (Owner) session.getAttribute("user");
        	 StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
        	 List<StoreInfo> list = dao.selectByOwner(owner.getId());
         
         if(session.getAttribute("storeList") != null)
        	 session.removeAttribute("storeList");
         
         	session.setAttribute("storeList", list);
         }
         
         StoreInfoDAO store_dao = StoreInfoDAO.getStoreInfoDAO();
         List<StoreInfo> listAll = store_dao.selectAll();
           
         //매장 정보 랜덤으로 출력
         Collections.shuffle(listAll);
         session.setAttribute("listAll", listAll);
            
         RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
         dispatcher.forward(request, response);
      }
}
