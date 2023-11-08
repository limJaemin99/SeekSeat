package org.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.vo.Menu;

import mybatis.SqlSessionBean;

public class MenuDAO {
	
	//싱글톤
	private static MenuDAO dao = new MenuDAO();
	private MenuDAO () {}
	public static MenuDAO getMenuDAO () {
		return dao;
	}
	
	//메뉴 출력
	public List<Menu> menuList(String store_id) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Menu> list = mapper.selectList("Menu.menuList",store_id);
		mapper.close();
		
		return list;
	}
	
	//메뉴 등록 - 여러개
	public int insert(List<Menu> menuList) {
	    int count = 0;
	    SqlSession mapper = SqlSessionBean.getSession();
	    Map<String, Object> map = new HashMap<>();
	    map.put("menuList", menuList);
	    
	    count += mapper.insert("Menu.insert", map);
	    
	    mapper.commit();
	    mapper.close();
	    
	    return count;
	}


	
	// 메뉴 수정 - 여러개
	public int update(List<Menu> menuList) {
		int count = 0;
	    SqlSession mapper = SqlSessionBean.getSession();
	    Map<String, Object> map = new HashMap<>();
	    map.put("menuList", menuList);
	    
	    count += mapper.update("Menu.update", map);
	    mapper.commit();
	    mapper.close();

	    return count;
	}

	
	//메뉴 삭제
	public int delete(String menu_name) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("Menu.delete",menu_name);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	//store_id 로 조회
		public List<Menu> selectMenuByOwner(String store_id) {
			SqlSession mapper = SqlSessionBean.getSession();
			List<Menu> list = mapper.selectList("Menu.selectMenuByOwner",store_id);
			mapper.close();
			
			return list;
		}
	
}
