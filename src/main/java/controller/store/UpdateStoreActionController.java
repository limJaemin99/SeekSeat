package controller.store;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Util.Time;
import org.dao.StoreInfoDAO;
import org.vo.StoreInfo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Controller;

public class UpdateStoreActionController implements Controller {
   
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoreInfoDAO dao = StoreInfoDAO.getStoreInfoDAO();
		String storeId = request.getParameter("store_id");
		
		String path = "C:\\SEEKSEAT\\Store\\"+storeId;
		File folder = new File(path);
		
		//해당 디렉토리가 없을경우 디렉토리 생성
		if(!folder.exists()) {
		   try {
		      folder.mkdir();
		   }catch(Exception e) {
		      e.getMessage();
		   }
		} else {
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
		
		String store_id = multiRequest.getParameter("store_id");
		String id = multiRequest.getParameter("id");
		String name = multiRequest.getParameter("name");
		String category = multiRequest.getParameter("category");
		String store_tel = multiRequest.getParameter("store_tel");
		String address = multiRequest.getParameter("address");
		
		// 오픈시간 만들기
		String openTime = Time.getTime(multiRequest.getParameter("openAMPM"), multiRequest.getParameter("openTime1"),
		      multiRequest.getParameter("openTime2"));
		
		// 마감시간 만들기
		String closeTime = Time.getTime(multiRequest.getParameter("closeAMPM"), multiRequest.getParameter("closeTime1"),
		      multiRequest.getParameter("closeTime2"));
		
		String closedDays = multiRequest.getParameter("closedDays");
		String content = multiRequest.getParameter("content");
		String mainPictureUrl = multiRequest.getFilesystemName("mainPictureUrl");
		String pictureUrl = multiRequest.getFilesystemName("pictureUrl");
		String menuPictureUrl = multiRequest.getFilesystemName("menuPictureUrl");
		String station = multiRequest.getParameter("station");
		String hashtag = multiRequest.getParameter("hashtag");
		
		StoreInfo vo_store = StoreInfo.builder().store_id(store_id).id(id).name(name).category(category)
		      .store_tel(store_tel).address(address).openTime(openTime).closeTime(closeTime).closedDays(closedDays)
		      .content(content).mainPictureUrl(mainPictureUrl).pictureUrl(pictureUrl).menuPictureUrl(menuPictureUrl)
		      .station(station).hashtag(hashtag).build();
		
		int result = dao.update(vo_store);
		
		if (result == 1) { // 등록 완료
		   request.setAttribute("title", "매장 정보 수정 완료!");
		   request.setAttribute("message", "["+name+"] 매장의 정보가 수정되었습니다");
		    request.setAttribute("url", "storeList");
		   
		   RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
		   dispatcher.forward(request, response);
		   
		} else { // 등록 실패
		   request.setAttribute("title", "매장 정보 수정 실패");
		   request.setAttribute("message", "매장 정보 수정을 실패했습니다");
		   request.setAttribute("url", "storeList");
		   
		   RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
		   dispatcher.forward(request, response);
		}
   }
}
