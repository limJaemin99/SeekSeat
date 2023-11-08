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
public class Menu {

	private String store_id; // 매장ID
	private String menu_name; // 메뉴이름
	private int price; // 가격
	private String content; // 설명(원산지 등)
	private String best; // 추천 메뉴
	private String menuPictureUrl;	//메뉴 사진

}
