package org.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.vo.Reply;

import mybatis.SqlSessionBean;

public class ReplyDAO {
	
	//싱글톤
	private static ReplyDAO dao = new ReplyDAO();
	private ReplyDAO () {}
	public static ReplyDAO getReplyDAO () {
		return dao;
	}
	
	//댓글 리스트 출력
	public List<Reply> replyList() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Reply> list = mapper.selectList("Reply.replyList");
		mapper.close();
		
		return list;
	}
	
	//댓글 작성
	public int write(Reply reply) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("Reply.write",reply);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	//댓글 삭제
	public int delete(int writeNo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("Reply.delete",writeNo);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
}
