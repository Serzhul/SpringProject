package service;

import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.BookDataBean;
import mybatis.BookDao;

@Component
public class BookService {

    @Autowired
    BookDao bookQueries;

    public String goto_registerBookForm() {
        return "admin/book/registerBookForm";
    }

    public String goto_registerBookResult (MultipartHttpServletRequest multipart, @ModelAttribute("bookInfo")BookDataBean bookInfo, ModelMap modelMap) throws Exception{
        MultipartFile multi = multipart.getFile("upload_file");
        String filename = multi.getOriginalFilename();
        System.out.println(filename);

        if(filename != null && !filename.equals("")){
            String uploadPath = multipart.getRealPath("/")+"/upload_file/";
            System.out.println(uploadPath);

            FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(
                    "C:\\Users\\Daewon Seo\\Desktop\\SpirngFinal\\src\\main\\webapp\\view\\images\\carousel\\"+multi.getOriginalFilename()));

            bookInfo.setBook_filename(filename);
            bookInfo.setBook_filesize((int) multi.getSize());
            System.out.println(bookInfo.toString());
        }
        else {
            bookInfo.setBook_filesize(0);
        }
        bookQueries.registerBook(bookInfo);
        modelMap.put("bookInfo",bookInfo);
        return "admin/book/registerBookResult";
    }

    public String goto_RegisteredBookList(BookDataBean bookDataBean, ModelMap modelMap){
        List<BookDataBean> RegisteredBookList = null;
        bookDataBean = bookQueries.getTotalRows(bookDataBean);
        bookDataBean.setRows_on_page(10);
        bookDataBean.setStart_row(
                1+bookDataBean.getRows_on_page()*(bookDataBean.getPage_num()-1)
        );
        bookDataBean.setEnd_row(bookDataBean.getStart_row()+bookDataBean.getRows_on_page()-1);
        bookDataBean.setTotal_pages(bookDataBean.getTotal_rows()/bookDataBean.getRows_on_page());
        System.out.println(bookDataBean.toString());
        RegisteredBookList = bookQueries.getRegisteredBookList(bookDataBean);
        modelMap.put("bookInfoConfig",bookDataBean);
        modelMap.put("bookInfoList",RegisteredBookList);
        return "admin/book/registeredBookList";
    }



}
