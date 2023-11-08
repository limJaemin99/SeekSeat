package controller.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CommunityDAO;
import org.vo.Community;
import org.vo.Customer;

import controller.Controller;

//커뮤니티 글 수정
public class UpdateCommunityViewController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String temp = request.getParameter("writeNo");
		int writeNo=0;
		
		Customer user = (Customer) session.getAttribute("user");
		try {
			writeNo = Integer.parseInt(temp);
			CommunityDAO dao = CommunityDAO.getCommunityDAO();
			Community vo = dao.selectOne(writeNo);
			
			if(vo==null || !vo.getId().equals(user.getId()))
				throw new RuntimeException();
			
			request.setAttribute("vo", vo);				
			request.setAttribute("page",request.getParameter("page") ); 	
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
		} catch (NumberFormatException e) {
			response.sendRedirect("home");
		}
	}
}
