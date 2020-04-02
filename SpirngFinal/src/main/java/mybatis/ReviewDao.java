package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.ReviewDataBean;



public class ReviewDao extends AbstractRepository{
	private final String namespace = "mybatis.Review";
	
	public void insertReview(Map<String, Object> reviewMap) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			//String statement = namespace + ".insertReview";
			sqlSession.insert(namespace + ".insertReview", reviewMap);
			sqlSession.commit();
			//return sqlSession.selectOne(statement, reviewMap);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<ReviewDataBean> getReviewList(String isbn){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try{
			String statement = namespace + ".getReviewList";			
			return sqlSession.selectList(statement, isbn);
			
		}finally{
			sqlSession.close();
		}
		
	}
	
	public void deleteReview(Map<String, Object> reviewMap) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace + ".deleteReview", reviewMap);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public void likecntplue(Map<String, Object> reviewMap) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			sqlSession.update(namespace + ".likecntplue", reviewMap);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

}
