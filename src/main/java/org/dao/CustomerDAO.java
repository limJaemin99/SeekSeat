package org.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.vo.Customer;

import mybatis.SqlSessionBean;

public class CustomerDAO {
	
	//싱글톤
	private static CustomerDAO dao = new CustomerDAO();
	private CustomerDAO () {}
	public static CustomerDAO getCustomerDAO () {
		return dao;
	}
	
	//회원 로그인
	public int login(Map<String, String> map) {		
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("Customer.login",map);
		mapper.close();
		return result;
	}
	
	//회원가입
	public int join(Customer vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("Customer.join",vo);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//회원 ID 중복체크
	public int doubleCheck(String id) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("Customer.doubleCheck", id);
		mapper.close();
		return result;
	}
	
	//회원정보 수정
	public int update(Customer vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("Customer.update",vo);
		
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//회원 정보 출력
	public Customer select(String id) {
		SqlSession mapper = SqlSessionBean.getSession();
		Customer vo = mapper.selectOne("Customer.select",id);
		mapper.close();
		
		return vo;
	}
	
	//아이디/이메일 존재 여부
	public int isExist(Map<String, String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("Customer.isExist",map);
		mapper.close();
		
		return result;
	}
	
	//비밀번호 재설정
	public int passwordUpdate(Map<String, String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("Customer.passwordUpdate",map);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	//전체 일반회원 정보
	public List<Customer> userSelect(){
		SqlSession mapper = SqlSessionBean.getSession();
		List<Customer> list = mapper.selectList("Customer.userSelect");
		mapper.close();
		return list;
	}
}
