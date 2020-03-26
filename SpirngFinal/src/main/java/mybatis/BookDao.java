package mybatis;

import java.util.ArrayList;
import java.util.List;

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
	
	public List<BookDataBean> getBooks() {

		List<BookDataBean> booklist = new ArrayList<BookDataBean>();
	
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		 
		try {
			String statement = namespace + ".getBooks";
			booklist = sqlSession.selectList(statement);
			
			return booklist;
		} finally {
			sqlSession.close();
		}
	}
	
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
