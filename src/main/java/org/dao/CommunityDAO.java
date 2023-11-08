package org.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.vo.Community;
import org.vo.Reply;

import mybatis.SqlSessionBean;

public class CommunityDAO {
	
	//싱글톤
	private static CommunityDAO dao = new CommunityDAO();
	private CommunityDAO () {}
	public static CommunityDAO getCommunityDAO () {
		return dao;
	}
	
	//리스트 출력
	public List<Community> communityList() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Community> list = mapper.selectList("Community.communityList");
		mapper.close();
		
		return list;
	}
	
	//선택한 글 출력
	public Community selectOne(int writeNo) {
		SqlSession mapper = SqlSessionBean.getSession();
		Community community = mapper.selectOne("Community.selectOne",writeNo);
		mapper.close();
		
		return community;
	}
	
	public int write(Community community) {	//글 작성
		SqlSession mappper = SqlSessionBean.getSession();
		int result = mappper.insert("Community.write",community);
		mappper.commit();
		mappper.close();
		
		return result;
	}
	
	//글 수정
	public int update(Community community) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("Community.update",community);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//글 삭제
	public int delete(int writeNo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("Community.delete",writeNo);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//전체 글 갯수
		public int count() {
			SqlSession mapperSession = SqlSessionBean.getSession();
			int result = mapperSession.selectOne("Community.count");
			mapperSession.close();
			return result;
		}
		
		//writeNo 메인글의 댓글목록 가져오기
		public List<Reply> comments(int writeNo){
			SqlSession mapperSession = SqlSessionBean.getSession();
			List<Reply> commentList = mapperSession.selectList("Community.comments",writeNo);
			mapperSession.close();
			return commentList;
		}
		
		//메인글 목록 가져오기 
		public List<Community> pagelist(Map<String,Integer> map) {
			SqlSession mapperSession = SqlSessionBean.getSession();
			List<Community> list = mapperSession.selectList("Community.pagelist",map);
			mapperSession.close();
			
			return list;
		}
	
}
