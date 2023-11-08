package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/"})
public class FrontController extends HttpServlet {
		@Override
		public void init() throws ServletException {
				RequestControllerMapping.init();
		}
		
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String url = request.getServletPath();
				String method = request.getMethod();
				RequestMap key = new RequestMap(url, method);
				Controller controller = RequestControllerMapping.getController(key);
				
				if(controller != null) { 
					controller.handle(request, response);
				} else {
					throw new RuntimeException();
				}
				
		}
		
}
