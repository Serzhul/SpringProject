package controller;

import dto.BookDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import service.BookService;

@Controller
@RequestMapping(value = "/admin/")
public class BookController {

    @Autowired
    BookService bookService;

    @RequestMapping(value="registerBook", method= RequestMethod.GET)
    public String goto_registerBookForm() {
        return bookService.goto_registerBookForm();
    }

    @RequestMapping(value = "registerBook" , method = RequestMethod.POST)
    public String goto_registerBookForm (MultipartHttpServletRequest multipart, @ModelAttribute("bookInfo")BookDTO bookInfo, ModelMap model) throws Exception{
        return bookService.goto_registerBookResult(multipart, bookInfo,model);
    }

    @RequestMapping(value = "registeredBookList")
    public String goto_RegisteredBookListController(ModelMap model){
        return bookService.goto_RegisteredBookList(model);
    }
}
