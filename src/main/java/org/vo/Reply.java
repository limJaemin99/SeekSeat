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
public class Reply {
	// 커뮤니티 댓글
	private int replyNo;			//댓글 번호
	private int writeNo;			//글 번호
	private String user_id;			//회원ID
	private String reply;			//내용
	private Timestamp createdDate;		//작성일

}
