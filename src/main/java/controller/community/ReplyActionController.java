package controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dao.ReplyDAO;
import org.vo.Reply;

import controller.Controller;

public class ReplyActionController implements Controller{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyDAO dao = ReplyDAO.getReplyDAO();
		String f = request.getParameter("f");
		String url=null;		
		int writeNo = Integer.parseInt(request.getParameter("writeNo"));   
		
		
		String page = request.getParameter("page");        
		
		if(f.equals("1")) {	//댓글 작성
			Reply vo = Reply.builder()
					.writeNo(writeNo)
					.replyNo(Integer.parseInt(request.getParameter("replyNo")))
					.user_id(request.getParameter("id"))
					.reply(request.getParameter("reply")) 
					.build();
			if(dao.write(vo)==1) url="read?writeNo="+writeNo + "&page="+page;   
			else url="home";
			
		} else if(f.equals("2")) {	//댓글 삭제 
			int replyNo = Integer.parseInt(request.getParameter("replyNo"));	
			if(dao.delete(replyNo)==1) url="read?writeNo="+writeNo + "&page="+page;   
			else url="home";
		}
		
		response.sendRedirect(url);
	}
}
