package org.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.vo.Favorite;

import mybatis.SqlSessionBean;

public class FavoriteDAO {
		
		//싱글톤
		private static FavoriteDAO dao = new FavoriteDAO();
		private FavoriteDAO () {}
		public static FavoriteDAO getFavoriteDAO () {
			return dao;
		}
		
		//즐겨찾기 목록 출력
		public List<Favorite> selectList(String user_id) {
			SqlSession mapper = SqlSessionBean.getSession();
			List<Favorite> list = mapper.selectList("Favorite.selectList",user_id);
			mapper.close();
			
			return list;
		}
		
		//이미 등록되어있는지 확인
		public int selectOne(Favorite favorite) {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.selectOne("Favorite.selectOne",favorite);
			mapper.close();
			
			return result;
		}
		
		//즐겨찾기에 추가
		public int insert(Favorite favorite) {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.insert("Favorite.insert",favorite);
			mapper.commit();
			mapper.close();
			
			return result;
		}
		
		//즐겨찾기에서 삭제
		public int delete(Favorite favorite) {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.delete("Favorite.delete",favorite);
			mapper.commit();
			mapper.close();
			
			return result;
		}
		
}
