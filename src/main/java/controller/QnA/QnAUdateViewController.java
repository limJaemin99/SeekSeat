package controller.QnA;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.QnADAO;
import org.vo.Customer;
import org.vo.QnA;

import controller.Controller;

//[관리자] 1:1 문의글 답변 화면 출력 view
public class QnAUdateViewController implements Controller {
		
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("writeNo");
		int writeNo=0;
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		
		try {
			writeNo = Integer.parseInt(temp);
			QnADAO dao = QnADAO.getQnADAO();
			QnA vo = dao.selectOne(writeNo);
			
			if(vo==null || !vo.getUser_id().equals(user.getId())) throw new RuntimeException();
			request.setAttribute("vo", vo);				
			
			request.setAttribute("page",request.getParameter("page") ); 	
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
		}catch (NumberFormatException e) {
			response.sendRedirect("QnAList");
		}	
	}
}
