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
public class StoreTable {
	private String store_id;	//매장 ID
	private int headCount;		//인원 제한
	private String tableNo;		//테이블 번호
	private String x;				//x축 좌표
	private String y;				//y축 좌표
}
