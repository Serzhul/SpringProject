package controller;

import model.GraphDataBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import service.BookService;
import service.GraphService;

@Controller
@RequestMapping(value = "/graph/")
public class GraphController {

    @Autowired
    GraphService graphService;

    @RequestMapping(value = "saleGraph")
    public String goto_RegisteredBookListController(@ModelAttribute("saleGraphData") GraphDataBean graphDataBean, ModelMap model) {
        return graphService.gotoSaleGraph(graphDataBean, model);
    }
}
