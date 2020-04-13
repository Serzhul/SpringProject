package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import model.BoardDataBean;
import mybatis.BoardDao;

@Component
public class BoardService {

    @Autowired
    BoardDao boardQueries;

    public String gotoNoticeList(ModelMap modelMap) {
        List<BoardDataBean> noticeList = null;
        noticeList = boardQueries.getNoticeList();
        modelMap.put("noticeList",noticeList);
        modelMap.addAttribute("noticeList",noticeList);
        return "board/noticeList";
    }

    public String gotoContactList(ModelMap modelMap) {
        List<BoardDataBean> contactList = null;
        contactList = boardQueries.getContactList();
        modelMap.put("contactList",contactList);
        modelMap.addAttribute("contactList",contactList);
        System.out.println(contactList.iterator().toString());
        return "board/contactList";
    }
}
