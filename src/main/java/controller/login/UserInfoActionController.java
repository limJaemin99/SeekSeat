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
import org.vo.Customer;
import org.vo.Owner;

import controller.Controller;

public class UserInfoActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type = Integer.parseInt(request.getParameter("type"));
		HttpSession session = request.getSession();
		String pw = request.getParameter("pw");
		int result = 0;
		
		if(type==1) {	//일반 회원
			Customer customer = (Customer) session.getAttribute("user");
			String id = customer.getId();
			CustomerDAO dao = CustomerDAO.getCustomerDAO();
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pw", SHA256.encodeSha256(pw));
			result = dao.login(map);
		}else if(type == 2) {	//사장님
			Owner owner = (Owner) session.getAttribute("user");
			String id = owner.getId();
			OwnerDAO dao = OwnerDAO.getOwnerDAO();
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pw", SHA256.encodeSha256(pw));
			result = dao.login(map);
		}
		
		if (result == 1) {	//로그인 성공
			if(type == 1) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("user_info.jsp");
				dispatcher.forward(request, response);
			} else if(type == 2) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("owner_info.jsp");
				dispatcher.forward(request, response);
			}
		} else {	//로그인 실패
			request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		    request.setAttribute("url", "");
		      
			RequestDispatcher dispatcher = request.getRequestDispatcher("alert.jsp");
		    dispatcher.forward(request, response);
		}
	}
}
