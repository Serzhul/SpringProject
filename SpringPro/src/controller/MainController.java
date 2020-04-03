package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import dao.BookDao;
import model.BookDataBean;


public class MainController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	}

	@RequestMapping(value = "index")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8"); 
		
		int rank = 9;
		
		BookDao service = BookDao.getInstance();
		
		List<BookDataBean> booklist = service.getBooks();
		
		List<BookDataBean> bestseller = service.getBestSeller(rank);
		
		request.setAttribute("booklist", booklist);
		request.setAttribute("bestseller", bestseller);
		
		return "/view/main/index.jsp";
	}
	
	
}
