package org.dao;

import org.apache.ibatis.session.SqlSession;
import org.vo.Review;

import mybatis.SqlSessionBean;

public class ReviewDAO {
	
	//싱글톤
	private static ReviewDAO dao = new ReviewDAO();
	private ReviewDAO () {}
	public static ReviewDAO getReviewDAO () {
		return dao;
	}
	
	//리뷰 작성
	public int insert(Review review) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("Review.insert",review);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//리뷰 삭제
	public int delete(String reviewNo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("Review.delete",reviewNo);
		mapper.commit();
		mapper.close();
		
		return result;
	}
}
