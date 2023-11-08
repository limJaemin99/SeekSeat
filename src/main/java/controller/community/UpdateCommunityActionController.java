package controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.CommunityDAO;
import org.vo.Community;

import controller.Controller;

//커뮤니티 글 수정
public class UpdateCommunityActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int writeNo = Integer.parseInt(request.getParameter("writeNo"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Community vo = Community.builder()
				.writeNo(writeNo)
				.title(title)
				.content(content)
				.build();
		
		CommunityDAO dao = CommunityDAO.getCommunityDAO();
		
		int result = dao.update(vo);
		
		if(result==1) {
			response.sendRedirect("read?writeNo="+writeNo+"&page="+request.getParameter("page"));   
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}
}
