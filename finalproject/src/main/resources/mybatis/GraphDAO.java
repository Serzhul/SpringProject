package mybatis;

import model.GraphDataBean;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class GraphDAO {

    @Autowired
    public AbstractRepository ar;

    private final String namespace = "mybatis.Graph";

    private GraphDAO() {
    };

    public List<GraphDataBean> getSaleGraphDataList(List<GraphDataBean> graphDataBeanList, GraphDataBean graphDataBean) {
        SqlSession sqlSession = ar.getSqlSessionFactory().openSession();
        graphDataBeanList = sqlSession.selectList(namespace+".getSaleGraphData");
        return graphDataBeanList;
    }
}
