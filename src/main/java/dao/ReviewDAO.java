package dao;

import dto.BoardDTO;
import dto.BookDTO;
import dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ReviewDAO extends AbstractRepository {

    String namespace = "dao.reviewQueries";

    private ReviewDAO() {
    }


    public List<ReviewDTO> getReviewList(){
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
        try {
            reviewList = sqlSession.selectList(namespace + ".getReviewListOf_isbn_content");
            System.out.println(reviewList.iterator().toString());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return reviewList;
    }

    public List<BookDTO> getReviewListBooksubject(){
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        List<BookDTO> reviewListBooksubject = new ArrayList<BookDTO>();
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
