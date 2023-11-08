package controller.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Util.SHA256;
import org.dao.AdminInfoDAO;
import org.dao.CustomerDAO;
import org.dao.FavoriteDAO;
import org.dao.OwnerDAO;
import org.dao.StoreInfoDAO;
import org.vo.AdminInfo;
import org.vo.Customer;
import org.vo.Favorite;
import org.vo.Owner;
import org.vo.StoreInfo;

import controller.Controller;

//로그인 Action
public class LoginActionController implements Controller{
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forReserve = request.getParameter("forReserve");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = null;
		int type = Integer.parseInt(request.getParameter("type"));
		HttpSession session = request.getSession();
		
		int result = 0;
		Customer user_vo = null;
		Owner owner_vo = null;
		
		int isFavorite = 0;
		
		AdminInfoDAO adminDao = AdminInfoDAO.getAdminDAO();
		AdminInfo admin_vo = null;
		Map<String, String> adminMap = new HashMap<>();
		adminMap.put("id", id);
		adminMap.put("pw", pw);
		result = adminDao.login(adminMap);
		List<StoreInfo> storeList = new ArrayList<>();
		
		if(forReserve.equals("true")) {
			String store_id = request.getParameter("store_id");
			
			if(type != 1) {	//일반회원 로그인 안함
				request.setAttribute("title", "로그인 실패");
				request.setAttribute("message", "일반 회원 계정으로 다시 로그인 해주세요");
			    request.setAttribute("url", "login");
			    
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
			    dispatcher.forward(request, response);
			} else {
				Map<String, String> map = new HashMap<>();
				map.put("id", id);
				map.put("pw", SHA256.encodeSha256(pw));		//입력한 비밀번호를 암호화해서 비교
				CustomerDAO dao = CustomerDAO.getCustomerDAO();
				result = dao.login(map);
				
				user_vo = dao.select(id);
				name = user_vo.getName();
			}
			
			if(result == 1) {	//로그인 O
				session.setAttribute("user", user_vo);
				session.setAttribute("type", 1);
				
				StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
				StoreInfo store = dao.selectByStoreId(store_id);
				
				FavoriteDAO favoriteDAO = FavoriteDAO.getFavoriteDAO();
				Favorite vo = new Favorite(id,store_id,null);
				isFavorite = favoriteDAO.selectOne(vo);
				
				request.setAttribute("title", name+"님 환영합니다!");
				request.setAttribute("message", "로그인 성공");
			    request.setAttribute("url", "../search/searchStoreInfo");
				
			    request.setAttribute("forReserve", forReserve);
			    request.setAttribute("store_id", store_id);
			    request.setAttribute("store", store);
			    request.setAttribute("isFavorite", isFavorite);
			    request.setAttribute("member_type", "1");
			    
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
			    dispatcher.forward(request, response);
			} else {	//로그인 X
				request.setAttribute("title", "로그인 실패");
				request.setAttribute("message", "다시 로그인 해주세요");
			    request.setAttribute("url", "login");
			      
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
			    dispatcher.forward(request, response);
			    
			}
			
		} else {
			forReserve = "false";
			
			if(result == 1) {	//관리자 로그인 성공
				admin_vo = adminDao.select(id);
				request.setAttribute("forReserve", forReserve);
				session.setAttribute("user", admin_vo);
				response.sendRedirect("/SeekSeat/home");
				return;
			} else {	//관리자 로그인 실패
				if(type == 1) {	//일반 회원 로그인
					Map<String, String> map = new HashMap<>();
					map.put("id", id);
					map.put("pw", SHA256.encodeSha256(pw));		//입력한 비밀번호를 암호화해서 비교
					CustomerDAO dao = CustomerDAO.getCustomerDAO();
					result = dao.login(map);
					
					user_vo = dao.select(id);
					name = user_vo.getName();
					
				} else if(type == 2) {	//사장님 로그인
					Map<String, String> map = new HashMap<>();
					map.put("id", id);
					map.put("pw", SHA256.encodeSha256(pw));		//입력한 비밀번호를 암호화해서 비교
					OwnerDAO owner_dao = OwnerDAO.getOwnerDAO();
					StoreInfoDAO store_dao = StoreInfoDAO.getStoreInfoDAO();
					result = owner_dao.login(map);
					
					owner_vo = owner_dao.select(id);
					name = owner_vo.getName();
					storeList = store_dao.selectByOwner(id);
				}
			}
			
			
			if(result == 1) {	//로그인 O
				if(type == 1) {
					session.setAttribute("user", user_vo);
					session.setAttribute("type", 1);
					request.setAttribute("member_type", "1");
				} else {
					session.setAttribute("user", owner_vo);
					session.setAttribute("storeList", storeList);
					session.setAttribute("type", 2);
					request.setAttribute("member_type", "2");
				}
				request.setAttribute("title", name+"님 환영합니다!");
				request.setAttribute("message", "로그인 성공");
			    request.setAttribute("url", "../../home");
			    request.setAttribute("forReserve", forReserve);
			    request.setAttribute("isFavorite", isFavorite);
			    
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
			    dispatcher.forward(request, response);
			} else {	//로그인 X
				request.setAttribute("title", "로그인 실패");
				request.setAttribute("message", "다시 로그인 해주세요");
			    request.setAttribute("url", "login");
			      
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
			    dispatcher.forward(request, response);
			}
		}
	}
}
