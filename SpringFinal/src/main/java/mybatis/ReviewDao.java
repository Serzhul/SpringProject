package mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.BookDataBean;
import model.ReviewDataBean;



public class ReviewDao{
	private final String namespace = "mybatis.Review";
	private final String namespace2 = "mybatis.ReviewLike";
	
	@Autowired
	public AbstractRepository ar;
	
	public void insertReview(Map<String, Object> reviewMap) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
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
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		
		try{
			String statement = namespace + ".getReviewList";
			return sqlSession.selectList(statement, isbn);
			
		}finally{
			sqlSession.close();
		}
		
	}
	
	public void deleteReview(Map<String, Object> reviewMap) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace + ".deleteReview", reviewMap);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	 public List<ReviewDataBean> getReviewList(){
	        SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
	        List<ReviewDataBean> reviewList = new ArrayList<ReviewDataBean>();
	        try {
	            reviewList = sqlSession.selectList(namespace + ".getReviewListOf_isbn_content");
	            System.out.println(reviewList.iterator().toString());
	        }
	        catch (Exception e){
	            e.printStackTrace();
	        }
	        return reviewList;
	    }

	    public List<BookDataBean> getReviewListBooksubject(){
	        SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
	        List<BookDataBean> reviewListBooksubject = new ArrayList<BookDataBean>();
	        try {
	            reviewListBooksubject = sqlSession.selectList(namespace + ".getReviewListOf_booksubject");
	            System.out.println(reviewListBooksubject.iterator().toString());
	        }
	        catch (Exception e){
	            e.printStackTrace();
	        }
	        return reviewListBooksubject;
	    }

}
