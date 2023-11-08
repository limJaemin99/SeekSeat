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
public class Community {
	//커뮤니티
	private int r;
	private int writeNo;			//글 번호
	private String id;				//회원ID
	private String title;			//제목
	private String content;			//내용
	private Timestamp createdDate;		//작성일
	
	
}
