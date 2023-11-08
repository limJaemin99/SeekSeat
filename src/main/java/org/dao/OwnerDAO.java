package org.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.vo.Owner;

import mybatis.SqlSessionBean;

public class OwnerDAO {
	
	//싱글톤
	private static OwnerDAO dao = new OwnerDAO();
	private OwnerDAO () {}
	public static OwnerDAO getOwnerDAO () {
		return dao;
	}
	
	//사장님 로그인
	public int login(Map<String, String> map) {		
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("Owner.login",map);
		mapper.close();
		return result;
	}
	
	//사장님 회원가입
	public int join(Owner vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("Owner.join",vo);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//사장님 ID 중복체크
	public int doubleCheck(String id) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("Owner.doubleCheck", id);
		mapper.close();
		return result;
	}
	
	//사장님 정보 수정
	public int update(Owner vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("Owner.update",vo);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//사장님 정보 출력
	public Owner select(String id) {
		SqlSession mapper = SqlSessionBean.getSession();
		Owner vo = mapper.selectOne("Owner.select",id);
		mapper.close();
		
		return vo;
	}
	
	//아이디/이메일 존재 여부
	public int isExist(Map<String, String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("Owner.isExist",map);
		mapper.close();
		
		return result;
	}
	
	//비밀번호 재설정
	public int passwordUpdate(Map<String, String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("Owner.passwordUpdate",map);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//전체 기업회원 정보
	public List<Owner> userSelect(){
		SqlSession mapper = SqlSessionBean.getSession();
		List<Owner> list = mapper.selectList("Owner.ownerSelect");
		mapper.close();
		return list;
	}
}
