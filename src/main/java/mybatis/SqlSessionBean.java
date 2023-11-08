package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionBean {
	
	private static SqlSessionFactory sqlSessionFactory;
	static {
		String resource = "mybatis/mybatis-config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			System.out.println("mybatis 설정 파일을 읽어오지 못했습니다.");
		}
		
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public static SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}
	
}
