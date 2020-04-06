package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.BookDataBean;
import model.ReviewDataBean;
import mybatis.BookDao;
import mybatis.ReviewDao;

@Controller
@RequestMapping("/book/")
public class BookController {
	String book_m_category;

	@Autowired
	BookDao service; 
	
	@Autowired
	ReviewDao reviewservice;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request, HttpServletResponse arg1) {
		HttpSession session = request.getSession();

		
			
		if (request.getParameter("book_m_category") != null) {
			session.setAttribute("book_m_category", request.getParameter("book_m_category"));
			session.setAttribute("pageNum", 1);
		}
		
		book_m_category = (String) session.getAttribute("book_m_category");

		if (book_m_category == null) {
			book_m_category = "소설";
			session.setAttribute("book_m_category", "소설");
		}
		
	}

	@RequestMapping(value = "book_list")
	public String index(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		int pageSize = 5;//가져올 크기 지정
		int currentPage = 1;

		if (session.getAttribute("pageNum") == null) {
			session.setAttribute("pageNum", 1);
			System.out.println("2 " + currentPage);
		}
		try {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
			System.out.println("1 " + currentPage);
		} catch (Exception e) {

		}

		currentPage = (Integer) session.getAttribute("pageNum");
		String book_m_category=(String) session.getAttribute("book_m_category");
		System.out.println("book_m_category="+book_m_category);
		int count = service.getBookCount(book_m_category);//책 카테고리에 따른 수량 가져오기
		
		System.out.println("책갯수 : "+count);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (currentPage > pageCount) {
			currentPage = pageCount;
			session.setAttribute("pageNum", currentPage);
		}

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;		
		
		System.out.println(startRow + ":" + endRow);

		List<BookDataBean> booklist = service.getBooks(startRow, endRow, book_m_category);//카테고리별 책 정보 가져옴
		//리스트로 가져오기
		System.out.println("booklist의 크기 : "+ booklist.size());
		
		int number = count - (currentPage - 1) * pageSize;
		
		int bottomLine = 3;

		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("booklist", booklist);
		
		
		
		return "book/book_list";
	}
	
	@RequestMapping(value = "book_content")
	public String book_content(String isbn, Model m) throws Exception {		
		System.out.println("isbn : "+isbn);
		
		BookDataBean book_content_article=service.getBookInfo(isbn);
		List<ReviewDataBean> reviewList = reviewservice.getReviewList(isbn);
		m.addAttribute("book_content_article", book_content_article);
		m.addAttribute("reviewList", reviewList);
		
		return "book/book_content";
	}
	
	@RequestMapping(value="review/save")
	public void book_review_save(@RequestParam Map<String, Object> reviewMap) throws Exception{
		reviewservice.insertReview(reviewMap);	
	}
	
	@RequestMapping(value="review/del")
	public void book_review_del(@RequestParam Map<String, Object> reviewMap) throws Exception{
		System.out.println(reviewMap.toString());
		reviewservice.deleteReview(reviewMap);	
	}
	
	@RequestMapping(value="review/review_like")
	public void book_review_like(@RequestParam Map<String, Object> reviewMap) throws Exception{
		System.out.println(reviewMap.toString());
		reviewservice.likecntplue(reviewMap);	
	}
	
}
