package mybatis;

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

}
