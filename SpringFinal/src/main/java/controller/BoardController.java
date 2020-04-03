package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {

    @Autowired
    BoardService service;

    @RequestMapping(value = "notice_list")
    public String gotoNoticeList(ModelMap modelMap){
        return service.gotoNoticeList(modelMap);
    }

    @RequestMapping(value = "contact_list")
    public String gotoContactList(ModelMap modelMap){
        return service.gotoContactList(modelMap);
    }


}
