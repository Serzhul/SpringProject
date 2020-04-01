package service;

import dao.ReviewDAO;
import dto.BoardDTO;
import dto.BookDTO;
import dto.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import java.util.List;

@Component
public class ReviewService {

    @Autowired
    ReviewDAO reviewDAO;

    public String gotoReviewList(ModelMap modelMap) {
        List<ReviewDTO> reviewList = null;
        reviewList = reviewDAO.getReviewList();
        modelMap.put("reviewList", reviewList);
        List<BookDTO> reviewListBooksubject = null;
        reviewListBooksubject = reviewDAO.getReviewListBooksubject();
        modelMap.put("reviewListBooksubject", reviewListBooksubject);

//        modelMap.addAttribute("reviewList", reviewList);
        return "review/reviewList";
    }
}
