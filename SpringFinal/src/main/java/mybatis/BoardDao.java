package mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.BoardDataBean;

@Component
public class BoardDao{

    String namespace = "mybatis.Board";
    
    @Autowired
	public AbstractRepository ar;

    private BoardDao() {};

    public List<BoardDataBean> getNoticeList(){
        SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
        List<BoardDataBean> noticeList = new ArrayList<BoardDataBean>();
        try {
            noticeList = sqlSession.selectList(namespace + ".getNoticeList");
            System.out.println(noticeList.iterator().toString());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return noticeList;
    }

    public List<BoardDataBean> getContactList(){
        SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
        List<BoardDataBean> noticeList = new ArrayList<BoardDataBean>();
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
