package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.BookDataBean;


public class BookDao {
	private final String namespace = "mybatis.Book";

	@Autowired
	public AbstractRepository ar;
	
	public BookDataBean getBookInfo(String isbn) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getBookInfo";
			return sqlSession.selectOne(statement, isbn);
		} finally {
			sqlSession.close();
		}
	}
	
	public int getBookCount(String book_m_category) {
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
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
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		 
		try {
			String statement = namespace + ".getBooks";			
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	
	public BookDataBean getBook(String isbn){
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getBookInfo";
			return sqlSession.selectOne(statement, isbn);
		} finally {
			sqlSession.close();
		}		
	}
	
	public List<BookDataBean> getBestSeller(int rank) {

		List<BookDataBean> bestseller = new ArrayList<BookDataBean>();
	
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		 
		try {
			bestseller = sqlSession.selectList(namespace + ".getBestSeller", rank);
			
			return bestseller;
		} finally {
			sqlSession.close();
		}
	}
	
	public List<BookDataBean> getSearchResult(String keyword) {
		List<BookDataBean> SearchResult = new ArrayList<BookDataBean>();
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		
		try {
			SearchResult = sqlSession.selectList(namespace + ".getSearchResult", keyword);
			
			return SearchResult;
		} finally {
			sqlSession.close();
		}
		
	}
	
	public List<BookDataBean> getBestReview() {
		List<BookDataBean> bestreview = new ArrayList<BookDataBean>();
		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		
		try {
			bestreview = sqlSession.selectList(namespace + ".getBestReview");

			return bestreview;
		} finally {
			sqlSession.close();
		}
		
	}
	
	public List<String> getBestReviewContent() {
		List<String> content = new ArrayList<String>();

		
		SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
		
		try {
			content = sqlSession.selectList(namespace + ".getBestReviewContent");
			
			return content;
		} finally {
			sqlSession.close();
		}
		
	}
	
	public void registerBook(BookDataBean bookInfo) {
        System.out.println("registerBook");
        SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
        try {
            sqlSession.insert(namespace + ".registerBook", bookInfo);
            sqlSession.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {			sqlSession.close();		}
    }

    public List<BookDataBean> getRegisteredBookList(){
        SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
        List<BookDataBean> RegisteredBookList = new ArrayList<BookDataBean>();
        try{
            RegisteredBookList = sqlSession.selectList(namespace+".getRegisteredBookList");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return RegisteredBookList;
    }
	
	
	
	
	
}
