package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ReviewService;

@Controller
@RequestMapping(value = "/review/")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = "review_list")
    public String goto_reviewList(ModelMap modelMap) {
        return reviewService.gotoReviewList(modelMap);
    }
}
