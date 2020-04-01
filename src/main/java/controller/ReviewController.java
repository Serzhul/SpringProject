package controller;

import dto.BookDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import service.ReviewService;

@Controller
@RequestMapping(value = "/reviewController/")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = "ReviewList")
    public String goto_reviewList(ModelMap modelMap) {
        return reviewService.gotoReviewList(modelMap);
    }
}
