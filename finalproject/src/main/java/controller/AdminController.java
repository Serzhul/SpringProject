package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.BookDataBean;
import service.BookService;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {

    @Autowired
    BookService bookService;

    //admin --- 2020.04.16 ---
    @RequestMapping(value="register_book", method = RequestMethod.GET)
    public String goto_registerBookForm() {
        return bookService.goto_registerBookForm();
    }

    @RequestMapping(value = "register_book" , method = RequestMethod.POST)
    public String goto_registerBookForm (MultipartHttpServletRequest multipart, @ModelAttribute("bookInfo")BookDataBean bookInfo, ModelMap model) throws Exception{
        return bookService.goto_registerBookResult(multipart, bookInfo,model);
    }

    @RequestMapping(value = "registered_book_list")
    public String goto_RegisteredBookListController(@ModelAttribute("RegisteredBookListData") BookDataBean bookDataBean, ModelMap modelMap){
        System.out.println("pageNum_Parameter : "+bookDataBean.getPage_num());
        return bookService.goto_RegisteredBookList(bookDataBean, modelMap);
    }
    //admin --- 2020.04.16 ---
}
