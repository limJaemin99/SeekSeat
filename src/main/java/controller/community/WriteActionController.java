package controller.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.CommunityDAO;
import org.vo.Community;

import controller.Controller;

//커뮤니티 글 쓰기
public class WriteActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Community vo = Community.builder()
				.title(title)
				.id(id)
				.content(content)
				.build();
		
		CommunityDAO dao = CommunityDAO.getCommunityDAO();
		
		int result = dao.write(vo);
		
		if(result!=0) {
			request.setAttribute("title", "등록 완료!");
			request.setAttribute("message", "게시글이 등록되었습니다");
		    request.setAttribute("url", "../../home");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
		    dispatcher.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath());
		}
	}
}
