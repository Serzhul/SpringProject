package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.BookDataBean;
import mybatis.AbstractRepository;

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
			
			
			for(int i = 0; i<bestseller.size(); i++) {
				System.out.println(bestseller.get(i));
			}
			return bestseller;
		} finally {
			sqlSession.close();
		}
	}
	

	/*
	 * public List<BookDataBean> getArticles(int startRow, int endRow, String
	 * boardid) {
	 * 
	 * startRow = startRow - 1; endRow = endRow - startRow;
	 * 
	 * Map map = new HashMap();
	 * 
	 * map.put("boardid", boardid); map.put("startRow", startRow); map.put("endRow",
	 * endRow);
	 * 
	 * SqlSession sqlSession = getSqlSessionFactory().openSession(); try { String
	 * statement = namespace + ".getArticles"; return
	 * sqlSession.selectList(statement, map);
	 * 
	 * 
	 * } finally { sqlSession.close(); }
	 * 
	 * }
	 * 
	 * public void insertArticle(BookDataBean article) { SqlSession sqlSession =
	 * getSqlSessionFactory().openSession();
	 * 
	 * Map map = new HashMap(); int num = article.getNum(); int ref =
	 * article.getRef(); int re_step = article.getRe_step(); int re_level =
	 * article.getRe_level(); int number = 1;
	 * 
	 * try { number = sqlSession.selectOne(namespace + ".insert_max");
	 * 
	 * if (num != 0) { map.put("ref", ref); map.put("re_step", re_step); re_step =
	 * re_step + 1; re_level = re_level + 1;
	 * 
	 * String statement = namespace + ".insert_update"; sqlSession.update(statement,
	 * map); sqlSession.commit(); } else { ref = number; re_step = 0; re_level = 0;
	 * }
	 * 
	 * article.setNum(number); article.setRef(ref); article.setRe_level(re_level);
	 * article.setRe_step(re_step);
	 * 
	 * String statement = namespace + ".insert"; sqlSession.insert(statement,
	 * article); sqlSession.commit();
	 * 
	 * } finally { sqlSession.close(); }
	 * 
	 * }
	 * 
	 * public BoardDataBean getArticle(int num) { SqlSession sqlSession =
	 * getSqlSessionFactory().openSession(); BoardDataBean article = null;
	 * 
	 * try {
	 * 
	 * sqlSession.update(namespace + ".content_update"); sqlSession.commit();
	 * 
	 * article = sqlSession.selectOne(namespace + ".getArticle", num);
	 * 
	 * } catch (Exception ex) { ex.printStackTrace(); } finally {
	 * sqlSession.close(); } return article; }
	 * 
	 * public BoardDataBean getUpdateArticle(int num) { SqlSession sqlSession =
	 * getSqlSessionFactory().openSession(); BoardDataBean article = null; try {
	 * article = sqlSession.selectOne(namespace + ".getArticle", num); } catch
	 * (Exception ex) { ex.printStackTrace(); } finally { sqlSession.close(); }
	 * return article; }
	 * 
	 * public int updateArticle(BookDataBean article) throws Exception { SqlSession
	 * sqlSession = getSqlSessionFactory().openSession(); String dbpasswd = ""; int
	 * x = -1; try { dbpasswd = sqlSession.selectOne(namespace + ".getPasswd",
	 * article.getNum()); if (dbpasswd.equals(article.getPasswd())) {
	 * sqlSession.update(namespace + ".update", article); sqlSession.commit(); x =
	 * 1; } else { x = 0; } } catch (Exception ex) { ex.printStackTrace(); } finally
	 * { sqlSession.close(); } return x;
	 * 
	 * }
	 * 
	 * // 데이터 삭제 public int deleteArticle(int num, String passwd) throws Exception {
	 * SqlSession sqlSession = getSqlSessionFactory().openSession(); int x=-1;
	 * String dbpasswd=null;
	 * 
	 * try { dbpasswd=sqlSession.selectOne(namespace+".getPasswd", num);
	 * if(dbpasswd.equals(passwd)){ sqlSession.delete(namespace+".delete", num);
	 * sqlSession.commit(); x=1; }else{ x=0; } } catch (Exception ex) {
	 * ex.printStackTrace(); } finally { sqlSession.close(); } return x; }
	 */
}
