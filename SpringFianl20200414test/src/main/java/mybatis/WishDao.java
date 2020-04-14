package mybatis;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.MyWishDataBean;

public class WishDao {
	private final String namespace = "mybatis.Wish";
	
	@Autowired
	public AbstractRepository ar;
	
	public void insertWish(Map<String, Object> reviewMap) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertWish", reviewMap);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public int getwishcheck(String id, String isbn) {
		System.out.println("getwishcheck : "+id+","+isbn);
		Map map = new HashMap();
		map.put("id", id);
		map.put("isbn", isbn);
		System.out.println("map : "+map.toString());
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getwishcheck";
			return sqlSession.selectOne(statement, map);
		}
		finally {
			sqlSession.close();
		}
	}
	
	public void deleteWish(Map<String, Object> reviewMap) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace + ".deleteWish", reviewMap);
			sqlSession.commit();
		} catch (Exception e) {e.printStackTrace(); } 
		finally {
			sqlSession.close();
		}
	}
}
