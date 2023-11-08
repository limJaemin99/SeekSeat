package controller.QnA;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.QnADAO;
import org.vo.AdminInfo;
import org.vo.QnA;

import controller.Controller;

//[관리자] 1:1 문의글 답변 Action
public class QnAUdateActionController implements Controller {
		
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1:1 문의 답변
		int writeNo = Integer.parseInt(request.getParameter("writeNo"));
		String answer=request.getParameter("answer");
		HttpSession session = request.getSession();
		AdminInfo admin= (AdminInfo) session.getAttribute("user");
		String admin_id = admin.getId();
		
		QnA vo = QnA.builder()
				.writeNo(writeNo)
				.admin_id(admin_id)
				.answer(answer)
				.status(2)
				.build();
		
		QnADAO dao = QnADAO.getQnADAO();
		int result = dao.update(vo);
		if(result==1) {
			request.setAttribute("vo", vo);
			response.sendRedirect("read?type=3&writeNo="+writeNo+"&page="+request.getParameter("page"));
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}
}
