package org.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.vo.QnA;

import mybatis.SqlSessionBean;

public class QnADAO {
   
   //싱글톤
   private static QnADAO dao = new QnADAO();
   private QnADAO () {}
   public static QnADAO getQnADAO () {
      return dao;
   }
   
   //회원 1:1 문의
   public int user_insert(QnA vo) {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.insert("QnA.user_insert",vo);
      mapper.commit();
      mapper.close();
      
      return result;
   }
   //사장님 1:1 문의
   public int owner_insert(QnA vo) {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.insert("QnA.owner_insert",vo);
      mapper.commit();
      mapper.close();
      
      return result;
   }
   
   //1:1 문의글 출력
   public List<QnA> selectList(){
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.selectList");
      mapper.close();
      return list;
   }
   
   //선택한 문의글 출력
   public QnA selectOne(int writeNo) {
      SqlSession mapper = SqlSessionBean.getSession();
      QnA vo = mapper.selectOne("QnA.selectOne",writeNo);
      mapper.close();
      
      return vo;
   }
   
   //1:1 문의 답글
   public int update(QnA vo) {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.update("QnA.update",vo);
      mapper.commit();
      mapper.close();
      
      return result;
   }
   
   //[User] id별 문의글 출력
   public List<QnA> selectUserQnA(String user_id) {
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.selectUserQnA",user_id);
      mapper.close();
      
      return list;
   }
   
   //[Owner] id별 문의글 출력
   public List<QnA> selectOwnerQnA(String user_id) {
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.selectOwnerQnA",user_id);
      mapper.close();
      
      return list;
   }
   
   // 메인글 rownum으로 user_id 가져오기
   public List<QnA> pagelistByUserId(Map<String, Object> map){
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.pagelistByUserId",map);
      mapper.close();
      
      return list;
      
   }
   
// 메인글 rownum으로 owner_id 가져오기
   public List<QnA> pagelistByOwnerId(Map<String, Object> map){
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.pagelistByOwnerId",map);
      mapper.close();
      
      return list;
      
   }
   
   // 메인글 rownum으로 가져오기
   public List<QnA> pagelist(Map<String, Integer> map){
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.pagelist",map);
      mapper.close();
      
      return list;
      
   }
   
   // (일반회원)메인글 rownum으로 가져오기
   public List<QnA> pagelistUser(Map<String, Integer> map){
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.pagelistUser",map);
      mapper.close();
      
      return list;
      
   }

   // (일반회원)메인글 rownum으로 가져오기
   public List<QnA> pagelistOwner(Map<String, Integer> map){
	   SqlSession mapper = SqlSessionBean.getSession();
	   List<QnA> list = mapper.selectList("QnA.pagelistOwner",map);
	   mapper.close();
	   
	   return list;
	   
   }
   
 //(일반회원) 1:1 문의글 출력
   public List<QnA> userList(){
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.userList");
      mapper.close();
      return list;
   }
   
   //(사장님) 1:1 문의글 출력
   public List<QnA> ownerList(){
      SqlSession mapper = SqlSessionBean.getSession();
      List<QnA> list = mapper.selectList("QnA.ownerList");
      mapper.close();
      return list;
   }
   
   // (관리자) 글 개수 가져오기
   public int count() {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.selectOne("QnA.count");
      mapper.close();
      
      return result;
      
   }
   
   // (일반회원) 글 개수 가져오기
   public int userCount() {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.selectOne("QnA.userCount");
      mapper.close();
      
      return result;
      
   }
   
   // (사장님) 글 개수 가져오기
   public int ownerCount() {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.selectOne("QnA.ownerCount");
      mapper.close();
      
      return result;
      
   }
   
}