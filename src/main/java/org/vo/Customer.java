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
public class Customer {
	// 회원 정보
	private String id;			//회원ID
	private String pw;			//비밀번호
	private String name;		//이름
	private int member_type;	//구분
	private String tel;			//전화번호
	private String email;		//이메일
	private String address;		//주소

}
