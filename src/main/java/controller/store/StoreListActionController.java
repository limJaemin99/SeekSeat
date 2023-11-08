package controller.store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.StoreInfoDAO;
import org.vo.StoreInfo;

import controller.Controller;

public class StoreListActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String store_id = request.getParameter("store_id");
		
		StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
		StoreInfo vo = dao.selectByStoreId(store_id);
		if(vo==null) throw new RuntimeException();
		request.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("store_read.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
