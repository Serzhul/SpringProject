package mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.LibraryDataBean;
import model.MemberDataBean;
import model.MyCartDataBean;
import model.MyWishDataBean;

public class MyPageDao {
private final String namespace = "mybatis.MyPage";	
	
	@Autowired
	public AbstractRepository ar;
	
	public MemberDataBean getmemberInfo(String id) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getmemberInfo";
			return sqlSession.selectOne(statement, id);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<LibraryDataBean> getlibrary(String id) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getlibrary";
			return sqlSession.selectList(statement, id);
		} finally {
			sqlSession.close();
		}
	}
	public List<MyCartDataBean> getmycartList(String id) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getmycartList";
			return sqlSession.selectList(statement, id);
		} finally {
			sqlSession.close();
		}
	}
	
	public void deleteCart(Map<String, Object> map) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace + ".deleteCart", map);
			sqlSession.commit();
		} catch (Exception e) {e.printStackTrace(); } 
		finally {
			sqlSession.close();
		}
	}
	
	public void insertWish(Map<String, Object> map) {
		System.out.println(map);
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertWish", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<MyWishDataBean> getmywishList(String id) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getmywishList";			
			return sqlSession.selectList(statement, id);
		} finally {
			sqlSession.close();
		}
	}
	
	public void deleteWish(Map<String, Object> map) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace + ".deleteWish", map);
			sqlSession.commit();
		} catch (Exception e) {e.printStackTrace(); } 
		finally {
			sqlSession.close();
		}
	}
	
	public String getbookFileName(String isbn) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getbookFileName";
			return sqlSession.selectOne(statement, isbn);
		} finally {
			sqlSession.close();
		}
	}
	
	public int checkResume(String isbn, String id) {
		Map map = new HashMap();
		map.put("isbn", isbn);
		map.put("id", id);
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkResume";
			return sqlSession.selectOne(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public String getResume(String isbn, String id) {
		Map map = new HashMap();
		map.put("isbn", isbn);
		map.put("id", id);
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getResume";
			return sqlSession.selectOne(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	public void insertResume(String isbn, String id) {
		Map map = new HashMap();
		map.put("isbn", isbn);
		map.put("id", id);
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertResume", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public void saveResume(String isbn, String id, int currentPage) {
		Map map = new HashMap();
		map.put("isbn", isbn);
		map.put("id", id);
		map.put("currentPage", currentPage);
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.update(namespace + ".saveResume", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public int checkWish(Map<String, Object> map) {
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkWish";
			return sqlSession.selectOne(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public int checkCart(Map<String, Object> map) {
		System.out.println("dao"+map.toString());
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkCart";
			return sqlSession.selectOne(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public void insertMyCart(Map<String, Object> map) {
		System.out.println(map.toString());
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertMyCart", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
}
