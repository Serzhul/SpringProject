package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.BookDataBean;


public class BookDao extends AbstractRepository {
	private final String namespace = "mybatis.Book";

	public BookDataBean getBookInfo(String isbn) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getBookInfo";
			return sqlSession.selectOne(statement, isbn);
		} finally {
			sqlSession.close();
		}
	}
	
	public int getBookCount(String book_m_category) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getBookCount";			
			return sqlSession.selectOne(statement, book_m_category);
		} finally {
			sqlSession.close();
		}
	}
	
	//리스트로 가져오기
	public List<BookDataBean> getBooks(int startRow, int endRow, String book_m_category) {
		
		/*startRow = startRow - 1;
		endRow = endRow - startRow;*/
		
		Map map = new HashMap();
		map.put("book_m_category", book_m_category);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		System.out.println("startRow = "+startRow);
		System.out.println("endRow = "+endRow);
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		 
		try {
			String statement = namespace + ".getBooks";			
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	
	/*public BookDataBean getBook(String isbn){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getBookInfo";
			return sqlSession.selectOne(statement, isbn);
		} finally {
			sqlSession.close();
		}		
	}*/
	
	public List<BookDataBean> getBestSeller(int rank) {

		List<BookDataBean> bestseller = new ArrayList<BookDataBean>();
	
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		 
		try {
			bestseller = sqlSession.selectList(namespace + ".getBestSeller", rank);
			
			return bestseller;
		} finally {
			sqlSession.close();
		}
	}
	
	public List<BookDataBean> getSearchResult(String keyword) {
		List<BookDataBean> SearchResult = new ArrayList<BookDataBean>();
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			SearchResult = sqlSession.selectList(namespace + ".getSearchResult", keyword);
			
			return SearchResult;
		} finally {
			sqlSession.close();
		}
		
	}
	
	public List<BookDataBean> getBestReview() {
		List<BookDataBean> bestreview = new ArrayList<BookDataBean>();
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			bestreview = sqlSession.selectList(namespace + ".getBestReview");

			return bestreview;
		} finally {
			sqlSession.close();
		}
		
	}
	
	public List<String> getBestReviewContent() {
		List<String> content = new ArrayList<String>();

		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			content = sqlSession.selectList(namespace + ".getBestReviewContent");
			
			return content;
		} finally {
			sqlSession.close();
		}
		
	}
	
	
	
	
	
}
