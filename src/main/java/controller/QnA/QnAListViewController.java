package controller.QnA;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.QnADAO;
import org.vo.AdminInfo;
import org.vo.Customer;
import org.vo.Owner;
import org.vo.Paging;
import org.vo.QnA;

import controller.Controller;

//회원 구분에 맞는 1:1 문의글 리스트 출력 view
public class QnAListViewController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type = Integer.parseInt(request.getParameter("type"));
		HttpSession session = request.getSession();
		QnADAO dao = QnADAO.getQnADAO();

		if (type == 1) { // 일반 회원
			int currentPage = 1;
			String page = request.getParameter("page");
			if (page != null)
				currentPage = Integer.parseInt(page);
			int pageSize = 10;
			int totalCount = dao.userCount();
			Paging paging = new Paging(currentPage, totalCount, pageSize);

			Customer customer = (Customer) session.getAttribute("user");
			String user_id = customer.getId();
			Map<String, Object> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("start", paging.getStartNo());
			map.put("end", paging.getEndNo());

			List<QnA> list = dao.pagelistByUserId(map);

			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			RequestDispatcher dispatcher = request.getRequestDispatcher("userQnAView.jsp");
			dispatcher.forward(request, response);
		}
		
		if (type == 2) { // 사장님
			int currentPage = 1;
			String page = request.getParameter("page");
			if (page != null)
				currentPage = Integer.parseInt(page);
			int pageSize = 10;
			int totalCount = dao.ownerCount();
			Paging paging = new Paging(currentPage, totalCount, pageSize);

			Owner owner = (Owner) session.getAttribute("user");
			String owner_id = owner.getId();
			Map<String, Object> map = new HashMap<>();
			map.put("owner_id", owner_id);
			map.put("start", paging.getStartNo());
			map.put("end", paging.getEndNo());

			List<QnA> list = dao.pagelistByOwnerId(map);

			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			RequestDispatcher dispatcher = request.getRequestDispatcher("ownerQnAView.jsp");
			dispatcher.forward(request, response);
		}
		
		if (type == 3) { // 관리자
			int currentPage = 1;
			int mType;
			if ((request.getParameter("mType")) == null) {
				mType = 0;
			} else {
				mType = Integer.parseInt(request.getParameter("mType"));
			}
			String page = request.getParameter("page");
			if (page != null)
				currentPage = Integer.parseInt(page);

			int pageSize = 10;

			AdminInfo admin = (AdminInfo) session.getAttribute("user");
			@SuppressWarnings("unused")
			String admin_id = admin.getId();
			Map<String, Integer> map = new HashMap<>();
			Paging paging = null;
			List<QnA> list = null;
			if (mType == 0) {
				int totalCount = dao.count();
				paging = new Paging(currentPage, totalCount, pageSize);
				map.put("start", paging.getStartNo());
				map.put("end", paging.getEndNo());
				list = dao.pagelist(map);
			} else if (mType == 1) {
				int totalCount = dao.userCount();
				paging = new Paging(currentPage, totalCount, pageSize);
				map.put("start", paging.getStartNo());
				map.put("end", paging.getEndNo());

				list = dao.pagelistUser(map);
			} else if (mType == 2) {
				int totalCount = dao.ownerCount();
				paging = new Paging(currentPage, totalCount, pageSize);
				map.put("start", paging.getStartNo());
				map.put("end", paging.getEndNo());

				list = dao.pagelistOwner(map);
			}
			
			request.setAttribute("mType", mType);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			RequestDispatcher dispatcher = request.getRequestDispatcher("adminQnAView.jsp");
			dispatcher.forward(request, response);
		}
	}
}
