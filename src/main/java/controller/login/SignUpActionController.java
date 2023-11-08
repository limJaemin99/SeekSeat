package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Util.SHA256;
import org.dao.CustomerDAO;
import org.dao.OwnerDAO;
import org.vo.Customer;
import org.vo.Owner;

import controller.Controller;

//회원가입 Action
public class SignUpActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		int type = Integer.parseInt(request.getParameter("type"));
		
		Customer user_vo = null;
		Owner owner_vo = null;
		int result = 0;
		
		if(type == 1) {
			CustomerDAO dao = CustomerDAO.getCustomerDAO();
			String hashedpw = SHA256.encodeSha256(pw);
			
			user_vo = new Customer(id,hashedpw,name,1,tel,email,address);
			result = dao.join(user_vo);
		} else if(type == 2) {
			OwnerDAO dao = OwnerDAO.getOwnerDAO();
			String hashedpw = SHA256.encodeSha256(pw);
			
			owner_vo = new Owner(id,hashedpw,name,2,tel,email,0);
			result = dao.join(owner_vo);
		}
		
		if(result == 1) {	//가입 완료
			request.setAttribute("title", "환영합니다!");
			request.setAttribute("message", "회원가입 성공");
		    request.setAttribute("url", "../../index.jsp");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
		    dispatcher.forward(request, response);
		} else {
			request.setAttribute("title", "회원가입 실패");
			request.setAttribute("message", "회원가입에 실패했습니다");
		    request.setAttribute("url", "../../index.jsp");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
		    dispatcher.forward(request, response);
		}
	}
}
