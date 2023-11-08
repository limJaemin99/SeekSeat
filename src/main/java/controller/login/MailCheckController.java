package controller.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.CustomerDAO;
import org.dao.OwnerDAO;

import controller.Controller;

//이메일 인증번호 보내는 Action
public class MailCheckController implements Controller {
	
	//메일 HOST
	private static final String HOST = "smtp.naver.com";
	//메일 PORT
	private static final String PORT = "587";
	//메일 ID
	private static final String MAIL_ID = "seekseat@naver.com";
	//메일 PW
	private static final String MAIL_PW = "seekseat0419";
	
	//인증번호 생성
	private static String code = "";
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		code = new MailCheckController().random();

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		int type = Integer.parseInt(request.getParameter("type"));
		HttpSession session = request.getSession();
		
		int result = 0;
		int returnType = 1;
		
		if(type == 1) {	//Customer
			CustomerDAO dao = CustomerDAO.getCustomerDAO();
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("email", email);
			result = dao.isExist(map);
			
		} else if(type == 2) {	//Business
			OwnerDAO dao = OwnerDAO.getOwnerDAO();
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("email", email);
			result = dao.isExist(map);
		}
		
		
		if(result == 1) {	//아이디,이메일 존재
			sendMail(email);
			session.setAttribute("code", code);
			session.setAttribute("id", id);
			session.setAttribute("email", email);
			session.setAttribute("type", type);
			session.setAttribute("returnType", returnType);
			
			request.setAttribute("title", "인증번호 전송 완료!");
			request.setAttribute("message", "["+email+"] 으로 인증번호가 전송되었습니다");
		    request.setAttribute("url", "mailCheck");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_check.jsp");
		    dispatcher.forward(request, response);
		} else {
			request.setAttribute("title", "인증번호 전송 실패");
			request.setAttribute("message", "아이디 또는 이메일을 확인 후 다시 시도해주세요");
		    request.setAttribute("url", "findPassword");
		      
			RequestDispatcher dispatcher = request.getRequestDispatcher("../includes/alert_error.jsp");
		    dispatcher.forward(request, response);
		}
	}
	
	//이메일 인증 보내는 메소드
	public static void sendMail(String receiverMail) {
		try {
			InternetAddress[] receiverList = new InternetAddress[1];
			receiverList[0] = new InternetAddress(receiverMail);
			
			// SMTP 발송 Properties 설정
			Properties props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", MailCheckController.HOST);
			props.put("mail.smtp.port", MailCheckController.PORT);
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.trust", MailCheckController.HOST);
			props.put("mail.smtp.auth", "true");
			
			// SMTP Session 생성
			Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(MailCheckController.MAIL_ID, MailCheckController.MAIL_PW);
				}
			});
			
			// Mail 조립
			Message mimeMessage = new MimeMessage(mailSession);
			mimeMessage.setFrom(new InternetAddress(MailCheckController.MAIL_ID));
			mimeMessage.setRecipients(Message.RecipientType.TO, receiverList);
            
			// 메일 제목
			mimeMessage.setSubject("SeekSeat 인증번호");
			
			// 메일 본문
			mimeMessage.setContent("인증번호 : " + code, "text/html; charset=UTF-8");
			
			// Mail 발송
			Transport.send(mimeMessage);
			
		} catch(Exception e) {
			System.out.println("메일 발송 오류!!");
		}
	}//sendNotiMail end
	
	//인증 코드 난수 생성 메소드
	public String random() {
		String code = null;
		
		StringBuffer tmp = new StringBuffer();
		Random rnd = new Random();
		
		for (int i = 0; i < 6; i++) {
			int rndIdx = rnd.nextInt(3);
			switch(rndIdx) {
			case 0:
				// a-z
				tmp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				tmp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				tmp.append(rnd.nextInt(10));
				break;
			}
		}
		code = tmp.toString();
		return code;
	}//random end
}