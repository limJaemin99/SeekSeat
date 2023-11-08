package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

//로그 아웃
public class LogoutActionController implements Controller{

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      HttpSession session = request.getSession();
      session.invalidate();
      
      request.setAttribute("message", "로그아웃되었습니다.");
      request.setAttribute("url", "home");
      
      RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/includes/alert.jsp");
      dispatcher.forward(request, response);
   }
}
