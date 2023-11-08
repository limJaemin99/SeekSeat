package org.vo;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Getter
public class QnA {
	// 1:1 문의
	private int writeNo;			//번호		
	private String user_id;			//회원ID
	private String owner_id;		//사장님ID
	private String admin_id;		//아이디(관리자)
	private String title;			//제목
	private String content;			//내용		수정
	private String answer;			//답변
	private Timestamp createdDate;		//작성일
	private Timestamp answerDate;		//답변일
	private int status;				//상태
	private int r;					//rownum
	
}
