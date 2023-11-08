package controller.QnA;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.QnADAO;
import org.vo.QnA;

import controller.Controller;

//문의글 제목 클릭시 해당 문의글 내용 출력 view
public class QnAReadViewController implements Controller{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("writeNo");
		String mType = request.getParameter("mType");
		int writeNo=0;
		
		writeNo = Integer.parseInt(temp);
		
		QnADAO dao = QnADAO.getQnADAO();
		QnA vo = dao.selectOne(writeNo);
		if(vo==null) throw new RuntimeException();
		
		request.setAttribute("vo", vo);
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("mType", mType);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("QnAread.jsp");
		dispatcher.forward(request, response);
	}
}
