package service;

import java.lang.reflect.InvocationTargetException;
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

    //admin --- 2020.04.16 ---
    public String gotoNoticeAndContactList(BoardDataBean boardDataBean, ModelMap modelMap) {
        List<BoardDataBean> RegisteredBoardList = null;
        boardDataBean = boardQueries.getTotalRows(boardDataBean);
        boardDataBean.setRows_on_page(3);
        boardDataBean.setStart_row(
                1+boardDataBean.getRows_on_page()*(boardDataBean.getPage_num()-1)
        );
        boardDataBean.setEnd_row(boardDataBean.getStart_row()+boardDataBean.getRows_on_page()-1);
        boardDataBean.setTotal_pages(boardDataBean.getTotal_rows()/boardDataBean.getRows_on_page());
        System.out.println(boardDataBean.toString());
        RegisteredBoardList = boardQueries.getBoardList(boardDataBean);
        System.out.println(boardDataBean.toString());
        modelMap.put("BoardInfoConfig",boardDataBean);
        modelMap.put("BoardInfoList",RegisteredBoardList);
        return "admin/board/list";
    }

    public String gotoRegisteredNotice(){
        return "admin/board/registNotice";
    }

    public String gotoRegisteredNotice(BoardDataBean boardDataBean, ModelMap modelMap) {
        boardQueries.insertNoticeData(boardDataBean);
        boardDataBean.setPage_num(1);
        return gotoNoticeAndContactList(boardDataBean, modelMap);
    }



    //admin --- 2020.04.16 ---
}
