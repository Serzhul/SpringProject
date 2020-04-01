package dao;

import dto.BoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BoardDAO extends AbstractRepository{

    String namespace = "dao.boardQueries";

    private BoardDAO() {};

    public List<BoardDTO> getNoticeList(){
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        List<BoardDTO> noticeList = new ArrayList<BoardDTO>();
        try {
            noticeList = sqlSession.selectList(namespace + ".getNoticeList");
            System.out.println(noticeList.iterator().toString());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return noticeList;
    }

    public List<BoardDTO> getContactList(){
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        List<BoardDTO> noticeList = new ArrayList<BoardDTO>();
        try {
            noticeList = sqlSession.selectList(namespace + ".getContactList");
            System.out.println(noticeList.iterator().toString());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return noticeList;
    }

}
