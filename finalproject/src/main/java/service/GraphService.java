package service;

import model.GraphDataBean;
import mybatis.GraphDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import java.util.ArrayList;
import java.util.List;

@Component
public class GraphService {

    @Autowired
    GraphDAO GraphQueries;

    public String gotoSaleGraph(GraphDataBean graphDataBean, ModelMap modelMap) {
        List<GraphDataBean> graphDataBeanList = new ArrayList<>();
        graphDataBeanList = GraphQueries.getSaleGraphDataList(graphDataBeanList, graphDataBean);
        modelMap.put("graphDataList", graphDataBeanList);
        return "admin/graph/saleGraph";
    }


}
