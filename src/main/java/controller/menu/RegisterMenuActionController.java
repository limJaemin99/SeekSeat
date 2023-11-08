package controller.menu;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.MenuDAO;
import org.dao.StoreInfoDAO;
import org.vo.Menu;
import org.vo.StoreInfo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Controller;

//메뉴 정보 입력 컨트롤러
public class RegisterMenuActionController implements Controller {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String store_id = request.getParameter("store_id");
		StoreInfoDAO store_dao = StoreInfoDAO.getStoreInfoDAO();
		StoreInfo storeInfo = store_dao.selectByStoreId(store_id);
		
		String path = "C:\\SEEKSEAT\\Store\\"+storeInfo.getStore_id();	//폴더 경로
		File folder = new File(path);
		
		
		//해당 디렉토리가 없을경우 디렉토리 생성
		if(!folder.exists()) {
			try {
				folder.mkdir();
			}catch(Exception e) {
				e.getMessage();
			}
		}else {
			System.out.println("::::: 폴더가 이미 존재합니다!");
		}
		
		int size = 10*1024*1024;	//파일 전송 용량 최대 크기
		
		MultipartRequest multiRequest = new MultipartRequest(
				request,
				path,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		
		List<String> menuPictureUrls = new ArrayList<>();

		List<String> menu_names = new ArrayList<>();
		List<String> prices = new ArrayList<>();
		List<String> contents = new ArrayList<>();
		List<String> bests = new ArrayList<>();
		
	    menu_names = Arrays.asList(multiRequest.getParameterValues("menu_name[]"));
	    prices = Arrays.asList(multiRequest.getParameterValues("price[]"));
	    contents = Arrays.asList(multiRequest.getParameterValues("content[]"));
	    bests = Arrays.asList(multiRequest.getParameterValues("best[]"));
	    
	    List<Menu> menuList = new ArrayList<>();
	    
	    for (int i = 0; i < menu_names.size(); i++) {
		    String fileName = multiRequest.getFilesystemName("menuPictureUrl"+i); // 파일 이름 가져오기
		    if (fileName != null && !fileName.isEmpty()) {
		        menuPictureUrls.add(fileName);
		    } else {
		    	menuPictureUrls.add("");
		    }
			
		}
	    
	    
	    
	    
	    //모든 메뉴 정보와 이미지 파일을 리스트로 받아서 처리
	    for (int i = 0; i < menu_names.size(); i++) {
	        try {
	            String menuPictureUrl = null;
	            int price = 0;
	            if (i < menuPictureUrls.size()) {
	                menuPictureUrl = menuPictureUrls.get(i);
	            }
	            if (i < prices.size()) {
	                price = Integer.parseInt(prices.get(i));
	            }

	            Menu vo = new Menu(store_id, menu_names.get(i), price, contents.get(i), bests.get(i), menuPictureUrl);
	            menuList.add(vo);
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	        }
	    }
	    if (menuList != null) {
	    	MenuDAO menu_dao = MenuDAO.getMenuDAO(); 
	        int result = menu_dao.insert(menuList);
	        if (result > 0) {
	            request.setAttribute("title", "메뉴 등록 성공!");
				request.setAttribute("message", "메뉴 " + result + "개를 등록했습니다.");
			    request.setAttribute("url", "menuList?store_id="+store_id);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
				dispatcher.forward(request, response);
	        } else {
	        	request.setAttribute("title", "메뉴 등록 실패");
				request.setAttribute("message", "메뉴 등록을 실패했습니다");
			    request.setAttribute("url", "storeMenu?store_id="+store_id);
			      
				RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
				dispatcher.forward(request, response);
	        }
	    }
	}
}
