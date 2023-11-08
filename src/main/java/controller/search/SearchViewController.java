package controller.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.StoreInfoDAO;
import org.vo.StoreInfo;

import controller.Controller;

//메인화면에서 검색 후 검색 결과 화면으로 넘어가는 View
public class SearchViewController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = request.getParameter("address");
		String keyword = request.getParameter("keyword");
		String station = request.getParameter("station");
		String[] split = null;
		boolean check = keyword.contains("강남")
					||keyword.contains("역삼")
					||keyword.contains("삼성")
					||keyword.contains("선릉")
					||keyword.contains("신논현");
		
		if(!check)
			keyword = station+" "+keyword;
		
		if(keyword.contains(" ")) {
			split = keyword.split(" ");
		}
		request.setAttribute("address", address);
		request.setAttribute("keyword", keyword);
		
		StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
		List<StoreInfo> list = dao.selectByStation(station);
		
		List<String> names = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			names.add(list.get(i).getName());
		}
		
		List<StoreInfo> storelist = new ArrayList<>();
		
		if(split != null) {
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getHashtag() != null) {
					for (int j = 0; j < split.length; j++) {
						if(list.get(i).getHashtag().contains(split[j]) || list.get(i).getName().contains(split[j])) {
							storelist.add(list.get(i));
							j=split.length;
						}
					}
				}
			}
		}
	
		int size = storelist.size();
		
		request.setAttribute("storelist", storelist);
		request.setAttribute("size", size);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("search_Index.jsp");
		dispatcher.forward(request, response);
	}
}
