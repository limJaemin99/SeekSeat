package controller.myPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CustomerDAO;
import org.dao.OwnerDAO;
import org.vo.Customer;
import org.vo.Owner;

import controller.Controller;

//회원 정보 수정 Action
public class UserUpdateActionController implements Controller{

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int type = Integer.parseInt(request.getParameter("type"));
      HttpSession session = request.getSession();
      
      int result = 0;
      
      if(type == 1) {   //일반 회원
         CustomerDAO dao = CustomerDAO.getCustomerDAO();
         String id = request.getParameter("id");
         String pw = request.getParameter("pw");
         String name = request.getParameter("name");
         String tel = request.getParameter("tel");
         String email = request.getParameter("email");
         String address = request.getParameter("address");
         Customer vo = Customer.builder()
                  .id(id)
                  .pw(pw)
                  .name(name)
                  .tel(tel)
                  .email(email)
                  .address(address)
                  .build();
         
         result = dao.update(vo);
           
         session.removeAttribute("user");
         session.setAttribute("user", vo);
         
      } else if(type==2) {      //사장님
         
         OwnerDAO dao = OwnerDAO.getOwnerDAO();
         String id = request.getParameter("id");
         String pw = request.getParameter("pw");
         String name = request.getParameter("name");
         String tel = request.getParameter("tel");
         String email = request.getParameter("email");
         
         Owner vo = Owner.builder()
               .id(id)
               .pw(pw)
               .name(name)
               .tel(tel)
               .email(email)
               .build();
         result = dao.update(vo);
         
         session.removeAttribute("user");
         session.setAttribute("user", vo);
         
      }
      
      if(result != 0) {
         request.setAttribute("title", "정보 수정이 완료되었습니다!");
         request.setAttribute("message", "성공");
          request.setAttribute("url", "userInfo?type="+type);
         
         RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
          dispatcher.forward(request, response);
      } else {
         response.sendRedirect(request.getContextPath());
      }
   }
}