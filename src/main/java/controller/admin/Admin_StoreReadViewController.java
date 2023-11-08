package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.StoreInfoDAO;
import org.vo.StoreInfo;

import controller.Controller;

//매장 정보 리스트 출력
public class Admin_StoreReadViewController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
			List<StoreInfo> list = dao.selectDesc();
			request.setAttribute("list", list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin_StoreInformation.jsp");
			dispatcher.forward(request, response);
		}
}
