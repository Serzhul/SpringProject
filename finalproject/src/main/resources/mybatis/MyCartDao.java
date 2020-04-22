package mybatis;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MyCartDao {

	@Autowired
	public AbstractRepository ar;

	private final String namespace = "mybatis.MyCart";

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
}
