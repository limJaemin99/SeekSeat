package controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CommunityDAO;
import org.vo.Community;
import org.vo.Customer;

import controller.Controller;

//커뮤니티 글 삭제
public class DeleteCommunityActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommunityDAO dao = CommunityDAO.getCommunityDAO();
		int writeNo = Integer.parseInt(request.getParameter("writeNo"));   
		
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		Community vo = dao.selectOne(writeNo);
		if(vo==null || !vo.getId().equals(user.getId())) throw new RuntimeException();
		
		int result = dao.delete(writeNo);
		
		if(result == 1) {
			response.sendRedirect("../../home?page="+request.getParameter("page"));  
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}
}
