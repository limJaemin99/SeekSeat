package org.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.vo.Reservation;

import mybatis.SqlSessionBean;

public class ReservationDAO {
	
	//싱글톤
	private static ReservationDAO dao = new ReservationDAO();
	private ReservationDAO () {}
	public static ReservationDAO getReservationDAO () {
		return dao;
	}
	
	//예약 번호 생성
	public String reserveNoSeq() {
		SqlSession mapper = SqlSessionBean.getSession();
		String result = mapper.selectOne("Reservation.reserveNoSeq");
		mapper.close();
		
		return result;
	}
	
	//해당 매장의 예약 내역 출력
	public List<Reservation> selectReserve(String store_id) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Reservation> list = mapper.selectList("Reservation.selectReserve",store_id);
		mapper.close();
		
		return list;
	}
	
	//예약 신청
	public int regist(Reservation reservation) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("Reservation.regist",reservation);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
}
