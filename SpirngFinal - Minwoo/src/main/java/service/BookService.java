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
        return "admin/registerBookForm";
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
        return "admin/registerBookResult";
    }

    public String goto_RegisteredBookList(ModelMap modelMap){
        List<BookDataBean> RegisteredBookList = null;
        RegisteredBookList = bookQueries.getRegisteredBookList();
        modelMap.put("bookInfoList",RegisteredBookList);
        return "admin/registeredBookList";
    }



}
