package service;

import dao.BoardDAO;
import dao.BookDAO;
import dto.BoardDTO;
import dto.BookDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.FileOutputStream;
import java.util.List;

@Component
public class BookService {

    @Autowired
    BookDAO bookQueries;

    public String goto_registerBookForm() {
        return "registerBookForm";
    }

    public String goto_registerBookResult (MultipartHttpServletRequest multipart, @ModelAttribute("bookInfo")BookDTO bookInfo, ModelMap modelMap) throws Exception{
        MultipartFile multi = multipart.getFile("upload_file");
        String filename = multi.getOriginalFilename();
        System.out.println(filename);

        if(filename != null && !filename.equals("")){
            String uploadPath = multipart.getRealPath("/")+"/upload_file/";
            System.out.println(uploadPath);

            FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(
                    "D:\\A_AllProjectData\\team\\local\\adminProject\\SpringFinal1\\src\\main\\webapp\\imgs\\"+multi.getOriginalFilename()));

            bookInfo.setBook_filename(filename);
            bookInfo.setBook_filesize((int) multi.getSize());
            System.out.println(bookInfo.toString());
        }
        else {
            bookInfo.setBook_filesize(0);
        }
        bookQueries.registerBook(bookInfo);
        modelMap.put("bookInfo",bookInfo);
        return "registerBookResult";
    }

    public String goto_RegisteredBookList(ModelMap modelMap){
        List<BookDTO> RegisteredBookList = null;
        RegisteredBookList = bookQueries.getRegisteredBookList();
        modelMap.put("bookInfoList",RegisteredBookList);
        return "registeredBookList";
    }



}
