package org.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class AfterVisit {
	private int reserveNo;		// 예약 번호
	private String store_id;	// 매장 ID
	private String user_id;		// 회원 ID
	private int tableNo; 		// 테이블 번호
	private int headCount;		// 인원수
	private String reserveDate;	// 예약일
	private int status;			// 상태
}