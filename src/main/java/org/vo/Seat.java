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
public class Seat {
	// 좌석
	private int tableNo;			//테이블 번호
	private int table_x;			//테이블 x좌표
	private int table_y;			//테이블 y좌표
	private int minCount;			//최소 인원수
	private int maxCount;			//최대 인원수
	private int wall_x;				//벽 x좌표
	private int wall_y;				//벽 y좌표
	private int status;				//상태

}
