package controller.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.CommunityDAO;
import org.vo.Community;
import org.vo.Reply;

import controller.Controller;

//커뮤니티 글 list 로 보기
public class ReadCommunityViewController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("writeNo");
		int writeNo=0;
		
		try {
			writeNo = Integer.parseInt(temp);

			CommunityDAO dao = CommunityDAO.getCommunityDAO();
					
			Community vo = dao.selectOne(writeNo);
			if(vo==null) throw new RuntimeException();   
			request.setAttribute("vo", vo);
					
			List<Reply> cmtlist = dao.comments(writeNo);
			request.setAttribute("cmtlist", cmtlist);
					
			request.setAttribute("page", request.getParameter("page"));    
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("read.jsp");
			dispatcher.forward(request, response);
			} catch (NumberFormatException  e) {
				response.sendRedirect("home");
			}
		}
}
