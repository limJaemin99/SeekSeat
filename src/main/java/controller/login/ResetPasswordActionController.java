package controller.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Util.SHA256;
import org.dao.CustomerDAO;
import org.dao.OwnerDAO;

import controller.Controller;

//비밀번호 재설정 Action
public class ResetPasswordActionController implements Controller {
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			int type = (int) session.getAttribute("type");
			String pw = request.getParameter("pw");
			String checkpw = request.getParameter("checkpw");
			
			if(pw.equals(checkpw)) {
				Map<String, String> map = new HashMap<>();
				map.put("id", id);
				map.put("pw", SHA256.encodeSha256(pw));
				
				if(type == 1) {
					CustomerDAO dao = CustomerDAO.getCustomerDAO();
					dao.passwordUpdate(map);
				} else if(type == 2) {
					OwnerDAO dao = OwnerDAO.getOwnerDAO();
					dao.passwordUpdate(map);
				}
				
			    session.invalidate();
				
				request.setAttribute("message", "비밀번호 변경이 완료되었습니다.");
			    request.setAttribute("url", "/SeekSeat/jsp/login/login");
			    
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert.jsp");
			    dispatcher.forward(request, response);
			} else {
				request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
			    request.setAttribute("url", "");
			      
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert.jsp");
			    dispatcher.forward(request, response);
			}
		}
}
