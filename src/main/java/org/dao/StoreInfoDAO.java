package org.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.vo.StoreInfo;

import mybatis.SqlSessionBean;

public class StoreInfoDAO {
	
	//싱글톤
	private static StoreInfoDAO dao = new StoreInfoDAO();
	private StoreInfoDAO () {}
	public static StoreInfoDAO getStoreInfoDAO () {
		return dao;
	}
	
	//메소드
	
	
	 //StoreId 생성
	   public String storeIdSeq() {
	      SqlSession mapper = SqlSessionBean.getSession();
	      String storeId = mapper.selectOne("StoreInfo.storeIdSeq");
	      mapper.close();
	      
	      return storeId;
	   }
	
	// 매장 등록
	public int insert(StoreInfo storeInfo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("StoreInfo.insert", storeInfo);
		mapper.commit();
		mapper.close();
		return result;
	}// ~insert end
	
	// 지정 매장 정보 변경
	public int update(StoreInfo storeInfo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("StoreInfo.update", storeInfo);
		mapper.commit();
		mapper.close();
		return result;
	}// ~update end
	
	// 지정 매장 삭제
	public int delete(String store_id) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result= mapper.delete("StoreInfo.delete",store_id);
		mapper.commit();
		mapper.close();
		return result;
	}// ~ delete end
	
	// 매장 전체 조회
	public List<StoreInfo> selectAll(){
		SqlSession mapper = SqlSessionBean.getSession();
		List<StoreInfo> results = mapper.selectList("StoreInfo.selectAll");
		mapper.close();
		return results;
	}// ~ selectAll end
	// 매장 전체 조회
	public List<StoreInfo> selectDesc(){
		SqlSession mapper = SqlSessionBean.getSession();
		List<StoreInfo> results = mapper.selectList("StoreInfo.selectDesc");
		mapper.close();
		return results;
	}// ~ selectAll end
	
	// 사장(owner) 별 매장 조회
	public List<StoreInfo> selectByOwner(String owner_id){
		SqlSession mapper = SqlSessionBean.getSession();
		List<StoreInfo> results = mapper.selectList("StoreInfo.selectByOwner", owner_id);
		mapper.close();
		return results;
	}// ~ selectByOwner end
	
	// 지정 매장 조회
	public StoreInfo selectByStoreId(String store_id) {
		SqlSession mapper = SqlSessionBean.getSession();
		StoreInfo result = mapper.selectOne("StoreInfo.selectByStoreId",store_id);
		mapper.close();
		return result;
		
	}
	
	// 역 이름으로 리스트 출력
	public List<StoreInfo> selectByStation(String station) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<StoreInfo> list = mapper.selectList("StoreInfo.selectByStation",station);
		mapper.close();
		
		return list;
	}
	public int countStore(String id) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("StoreInfo.countStore",id);
		mapper.close();
		
		return result;
	}
}
