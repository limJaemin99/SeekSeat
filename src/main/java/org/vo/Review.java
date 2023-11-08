package org.vo;

import java.sql.Date;

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
public class Review {
	private int reviewNo; //리뷰 번호
	private int reserveNo;	//예약 번호
	private String id; // 회원 ID
	private String store_id; // 매장 ID
	private double rating; // 평점
	private String content; // 리뷰 내용
	private String reviewPictureUrl; // 리뷰 사진
	private Date createdDate; // 리뷰 작성일
}
