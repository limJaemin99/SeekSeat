package org.vo;

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
public class AdminInfo {
	// 관리자 정보
	private String id;			//관리자ID
	private String pw;			//비밀번호
	private int member_type;	//구분
}
