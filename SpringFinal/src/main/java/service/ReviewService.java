package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import model.BookDataBean;
import model.ReviewDataBean;
import mybatis.ReviewDao;

@Component
public class ReviewService {

    @Autowired
    ReviewDao reviewDAO;

    public String gotoReviewList(ModelMap modelMap) {
        List<ReviewDataBean> reviewList = null;
        reviewList = reviewDAO.getReviewList();
        modelMap.put("reviewList", reviewList);
        List<BookDataBean> reviewListBooksubject = null;
        reviewListBooksubject = reviewDAO.getReviewListBooksubject();
        modelMap.put("reviewListBooksubject", reviewListBooksubject);

//        modelMap.addAttribute("reviewList", reviewList);
        return "admin/review/reviewList";
    }
}
