package service;

import dao.BoardDAO;
import dto.BoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import java.util.List;

@Component
public class BoardService {

    @Autowired
    BoardDAO boardQueries;

    public String gotoNoticeList(ModelMap modelMap) {
        List<BoardDTO> noticeList = null;
        noticeList = boardQueries.getNoticeList();
        modelMap.put("noticeList",noticeList);
        modelMap.addAttribute("noticeList",noticeList);
        return "board/noticeList";
    }

    public String gotoContactList(ModelMap modelMap) {
        List<BoardDTO> contactList = null;
        contactList = boardQueries.getContactList();
        modelMap.put("contactList",contactList);
        modelMap.addAttribute("contactList",contactList);
        System.out.println(contactList.iterator().toString());
        return "board/contactList";
    }
}
