package mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.ReviewLikeDataBean;

public class ReviewLikeDao {
	private final String namespace = "mybatis.ReviewLike";
	
	@Autowired
	public AbstractRepository ar;
	
	public List<ReviewLikeDataBean> getReviewLikeCheck(int num, String id){
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		Map map = new HashMap();
		map.put("num", num);
		map.put("id", id);
		try {
			String statement = namespace + ".getReviewLikeCheck";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}		
		
	}
	
	public double getReviewLikeCnt(String isbn, String id) {
		Map map = new HashMap();
		map.put("isbn", isbn);
		map.put("id", id);
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getReviewLikeCnt";			
			return sqlSession.selectOne(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public void likecntplue(Map<String, Object> reviewMap) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".likecntplue", reviewMap);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

}
