package org.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.vo.StoreTable;

import mybatis.SqlSessionBean;

public class StoreTableDAO {
	
	//싱글톤
	private static StoreTableDAO dao = new StoreTableDAO();
	private StoreTableDAO () {}
	public static StoreTableDAO getStoreTableDAO () {
		return dao;
	}
	
	//해당 매장 테이블 등록
	public int registTable(StoreTable storeTable) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("StoreTable.registTable",storeTable);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//해당 매장 테이블 조회
	public List<StoreTable> selectStoreTable(String store_id) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<StoreTable> list = mapper.selectList("StoreTable.selectStoreTable",store_id);
		mapper.close();
		
		return list;
	}
	
	//해당 매장 테이블 전체 삭제
	public int deleteAllTable(String store_id) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("StoreTable.deleteAllTable",store_id);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
}
