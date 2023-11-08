package controller.table;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.StoreTableDAO;
import org.vo.JSON;
import org.vo.StoreTable;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import controller.Controller;

// 테이블 등록 Action
public class RegisterTableActionController implements Controller {
		
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String store_id = request.getParameter("store_id");
		String seatData = null;
		
		javax.servlet.http.Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (javax.servlet.http.Cookie cookie : cookies) {
				if (cookie.getName().equals("seatData")) {
					seatData = URLDecoder.decode(cookie.getValue(), "UTF-8");
					break;
				}
			}
		}
		    
		List<JSON> list = jsonToList(seatData,store_id);
		System.out.println(list.toString());
		    
		session.setAttribute("store_id",store_id);
		    
		RequestDispatcher dispatcher = request.getRequestDispatcher("table_Register.jsp");
		dispatcher.forward(request, response);
		
	}
	
	//gson 으로 풀어서 storetable 에 저장
	private static List<JSON> jsonToList(String seatData,String store_id) {
		Gson gson = new Gson();
		StoreTableDAO dao = StoreTableDAO.getStoreTableDAO();
		List<StoreTable> tablelist = dao.selectStoreTable(store_id);
		StoreTable storeTable = null;
		
		List<JSON> list = gson.fromJson(seatData, new TypeToken<List<JSON>>(){}.getType());
		
		if(tablelist == null) {
			for (JSON json : list) {
				storeTable = new StoreTable(store_id,json.getHeadCount(),json.getSeatNumber(),json.getLeft(),json.getTop());
				dao.registTable(storeTable);
			}
		} else {
			dao.deleteAllTable(store_id);
			for (JSON json : list) {
				storeTable = new StoreTable(store_id,json.getHeadCount(),json.getSeatNumber(),json.getLeft(),json.getTop());
				dao.registTable(storeTable);
			}
		}
		
		return list;
	}
		
}
