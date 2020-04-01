package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.BoardService;
import service.BookService;

@Controller
@RequestMapping("/boardController/")
public class BoardController {

    @Autowired
    BoardService service;

    @RequestMapping(value = "noticeList")
    public String gotoNoticeList(ModelMap modelMap){
        return service.gotoNoticeList(modelMap);
    }

    @RequestMapping(value = "contactList")
    public String gotoContactList(ModelMap modelMap){
        return service.gotoContactList(modelMap);
    }


}
