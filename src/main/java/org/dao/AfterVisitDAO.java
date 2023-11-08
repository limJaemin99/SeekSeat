package org.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.vo.AfterVisit;

import mybatis.SqlSessionBean;

public class AfterVisitDAO {
	
	//싱글톤
		private static AfterVisitDAO dao = new AfterVisitDAO();
		private AfterVisitDAO () {}
		public static AfterVisitDAO getAfterVisitDAO () {
			return dao;
		}
	
	//방문 완료한 예약 내역 조회
	public List<AfterVisit> selectHistory (String user_id) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<AfterVisit> list = mapper.selectList("AfterVisit.selectHistory",user_id);
		mapper.close();
		
		return list;
	}
	
	//상태(예약취소,방문완료)별 예약 내역 조회
	public List<AfterVisit> selectByStatus(Map<String, String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<AfterVisit> list = mapper.selectList("AfterVisit.selectByStatus",map);
		mapper.close();
		
		return list;
	}
}
