package controller.community;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.CommunityDAO;
import org.vo.Paging;

import controller.Controller;

//커뮤니티 글 list 로 보기
public class ListCommunityViewController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int currentPage = 1;
			CommunityDAO dao = CommunityDAO.getCommunityDAO();

			String page=request.getParameter("page");
			if(page != null) currentPage = Integer.parseInt(page);		
			int pageSize=10;		
			int totalCount = dao.count();
			
			Paging paging = new Paging(currentPage, totalCount, pageSize);
			
			Map<String,Integer> map = new HashMap<>();
			map.put("start",paging.getStartNo());
			map.put("end",paging.getEndNo());
			
			request.setAttribute("home", dao.pagelist(map));
			
			request.setAttribute("paging", paging);
			
			request.setAttribute("today", LocalDate.now());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
}
