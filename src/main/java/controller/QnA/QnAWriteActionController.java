package controller.QnA;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.QnADAO;
import org.vo.QnA;

import controller.Controller;

//회원 구분에 맞는 1:1 문의글 쓰기 Action
public class QnAWriteActionController implements Controller {
		
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type = Integer.parseInt(request.getParameter("type"));
		QnADAO dao = QnADAO.getQnADAO();
		int result = 0;
		
		if(type == 1) { //일반 회원
			QnA vo = QnA.builder()
					.user_id(request.getParameter("user_id"))
					.title(request.getParameter("title"))
					.content(request.getParameter("content"))
					.status(Integer.parseInt(request.getParameter("status")))
					.build();
			
			request.setAttribute("vo", vo);
			result = dao.user_insert(vo);
			
		} else if(type == 2) { //사장님
			QnA vo = QnA.builder()
					.owner_id(request.getParameter("owner_id"))
					.title(request.getParameter("title"))
					.content(request.getParameter("content"))
					.status(Integer.parseInt(request.getParameter("status")))
					.build();
			request.setAttribute("vo", vo);
			result = dao.owner_insert(vo);
		}
		
		if(result != 0) {
			response.sendRedirect("list?type="+type);
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}
}
