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
import model.MemberDataBean;
import model.ReviewDataBean;
import model.WishDataBean;
import mybatis.BookDao;
import mybatis.MyCartDao;
import mybatis.ReviewDao;
import mybatis.ReviewLikeDao;
import mybatis.WishDao;

@Controller
@RequestMapping("/book/")
public class BookController {
	String book_m_category;

	@Autowired
	BookDao service; 
	
	@Autowired
	ReviewDao reviewservice;
	
	@Autowired
	ReviewLikeDao reviewlikeservice;
	
	@Autowired
	WishDao wishservice;
	
	@Autowired
	MyCartDao mycartservice;
	
	
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
	public String book_content(String isbn, Model m, HttpServletRequest request) throws Exception {	
		HttpSession session = request.getSession();
		MemberDataBean m2 = new MemberDataBean();
		m2 = (MemberDataBean)session.getAttribute("member");
		BookDataBean book_content_article=service.getBookInfo(isbn);
		List<ReviewDataBean> reviewList = reviewservice.getReviewList(isbn);
		
		//리뷰 상태 저장하는 변수
		String reviewcheck="";
		
		//위시리스트 상태 저장하는 변수m2.getId와 isbn을 이용하여 체크
		String wishcheck="no";
		if(m2!=null){
		int wish=wishservice.getwishcheck(m2.getId(), isbn);
			System.out.println(wish);
			if(wish==0){
				wishcheck="no";
			}else{
				wishcheck="yes";
			}
			
			for(int i=0; i<reviewList.size(); i++){
				String useisbn=reviewList.get(i).getIsbn();
				String useid=reviewList.get(i).getId();
				reviewList.get(i).setLike_cnt(reviewlikeservice.getReviewLikeCnt(useisbn, useid));//리뷰 좋아요 개수 체크
				reviewlikeservice.getReviewLikeCheck(reviewList.get(i).getNum(), m2.getId());//리뷰를 했는지체크 하는 메소드
				
				if(reviewlikeservice.getReviewLikeCheck(reviewList.get(i).getNum(), m2.getId()).isEmpty()){
					//리뷰에 좋아요 했을때 상태를 저장함
					reviewList.get(i).setWritercheck("yes");
				}else{
					//리뷰에 안했을때 상태를 저장함
					reviewList.get(i).setWritercheck("no");
				}
				
				//내가 쓴 리뷰가 존재하는지 체크
				if((useisbn.equals(isbn)) && (useid.equals(m2.getId()))){
					reviewcheck="yes";
				}else{
					reviewcheck="no";
				}
			}
			
			if(reviewList.isEmpty()) {
				reviewcheck="no";
			}
		}	
		m.addAttribute("book_content_article", book_content_article);
		m.addAttribute("reviewList", reviewList);
		m.addAttribute("reviewcheck",reviewcheck);
		m.addAttribute("wishcheck", wishcheck);
		
		return "book/book_content";
	}
	
	@RequestMapping(value="review/save")
	public void book_review_save(@RequestParam Map<String, Object> reviewMap) throws Exception{
		reviewservice.insertReview(reviewMap);	
	}
	
	@RequestMapping(value="review/del")
	public void book_review_del(@RequestParam Map<String, Object> reviewMap) throws Exception{
		reviewservice.deleteReview(reviewMap);	
	}
	
	@RequestMapping(value="review/review_like")
	public void book_review_like(@RequestParam Map<String, Object> reviewMap) throws Exception{
		reviewlikeservice.likecntplue(reviewMap);	
	}
	
	@RequestMapping(value="wish/wish_on")
	public void book_wish_on(@RequestParam Map<String, Object> reviewMap) throws Exception{
		wishservice.insertWish(reviewMap);
	}
	
	@RequestMapping(value="wish/wish_off")
	public void book_wish_off(@RequestParam Map<String, Object> reviewMap) throws Exception{
		wishservice.deleteWish(reviewMap);
	}
	
	@RequestMapping(value="cart/addcart")
	public void book_add_cart(@RequestParam Map<String, Object> reviewMap) throws Exception{
		mycartservice.insertMyCart(reviewMap);
	}
	
}
