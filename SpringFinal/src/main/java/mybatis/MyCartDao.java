package mybatis;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MyCartDao {
	private final String namespace = "mybatis.MyCart";	
	
	@Autowired
	public AbstractRepository ar;
	
	public void insertMyCart(Map<String, Object> reviewMap) {
		System.out.println(reviewMap.toString());
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertMyCart", reviewMap);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public int checkMyCart(Map<String, Object> reviewMap) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkMyCart";			
			return sqlSession.selectOne(statement, reviewMap);
		} finally {
			sqlSession.close();
		}
	}
}
