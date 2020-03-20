package mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.BookDataBean;

public class BookDao extends AbstractRepository {
	private final String namespace = "mybatis.Book";

	// 싱글톤 사용
	private static BookDao instance = new BookDao();

	public static BookDao getInstance() {
		return instance;
	}

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
	
	
}
