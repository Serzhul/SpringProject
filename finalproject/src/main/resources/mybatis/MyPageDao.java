package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.LibraryDataBean;
import model.MemberDataBean;
import model.MyCartDataBean;

public class MyPageDao {
private final String namespace = "mybatis.MyPage";	
	
	@Autowired
	public AbstractRepository ar;
	
	public MemberDataBean getmemberInfo(String id) {
		System.out.println(id);
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
	
	public String getbookName(String isbn) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getbookName";
			return sqlSession.selectOne(statement, isbn);
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
		System.out.println(map.toString());
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace + ".deleteCart", map);
			sqlSession.commit();
		} catch (Exception e) {e.printStackTrace(); } 
		finally {
			sqlSession.close();
		}
	}

}
