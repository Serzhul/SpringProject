package dao;

        import dto.BookDTO;
        import org.apache.ibatis.session.SqlSession;
        import org.springframework.stereotype.Component;

        import java.util.ArrayList;
        import java.util.List;
@Component
public class BookDAO extends AbstractRepository{
    private final String namespace = "dao.bookQueries";

    private BookDAO() {}

    public void registerBook(BookDTO bookInfo) {
        System.out.println("registerBook");
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try {
            sqlSession.insert(namespace + ".registerBook", bookInfo);
            sqlSession.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {			sqlSession.close();		}
    }

    public List<BookDTO> getRegisteredBookList(){
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        List<BookDTO> RegisteredBookList = new ArrayList<BookDTO>();
        try{
            RegisteredBookList = sqlSession.selectList(namespace+".getRegisteredBookList");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return RegisteredBookList;
    }

}
