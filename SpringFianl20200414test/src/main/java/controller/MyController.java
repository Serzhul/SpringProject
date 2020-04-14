package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.BookDataBean;
import model.LibraryDataBean;
import model.MemberDataBean;
import model.MyCartDataBean;
import model.MyWishDataBean;
import mybatis.MyPageDao;

@Controller
@RequestMapping("/mypage/")
public class MyController {
	
	@Autowired
	MyPageDao mypageservice;

	public void initProcess(HttpServletRequest request) {
		// HttpSession session = request.getSession();
	}

	@RequestMapping(value = "mymain")
	public String mymain(HttpServletRequest request, Model m) throws Exception {
		HttpSession session = request.getSession();	
		MemberDataBean memberid=(MemberDataBean)session.getAttribute("member");
		String id=memberid.getId();
		MemberDataBean member= mypageservice.getmemberInfo(id);
		
		m.addAttribute("member", member);

		return "mypage/mymain";
	}
	
	@RequestMapping(value = "mylibrary")
	public String mylibrary(HttpServletRequest request, Model m) throws Exception {
		HttpSession session = request.getSession();	
		MemberDataBean memberid=(MemberDataBean)session.getAttribute("member");
		String id=memberid.getId();
		
		List<LibraryDataBean> library=mypageservice.getlibrary(id);
		m.addAttribute("library", library);
		return "mypage/mylibrary";
	}
	
	@RequestMapping(value = "mycart")
	public String mycart(HttpServletRequest request, Model m) throws Exception {
		HttpSession session = request.getSession();	
		MemberDataBean memberid=(MemberDataBean)session.getAttribute("member");
		String id=memberid.getId();
		List<MyCartDataBean> mycartList=mypageservice.getmycartList(id);
		System.out.println(mycartList.toString());
		m.addAttribute("mycartList", mycartList);
		return "mypage/mycart";
	}
	
	@RequestMapping(value = "deleteCart")
	public void deleteCart(@RequestParam Map<String, Object> map) throws Exception {
		mypageservice.deleteCart(map);
	}
	
	@RequestMapping(value = "mywish")
	public String mywish(HttpServletRequest request, Model m) throws Exception {
		HttpSession session = request.getSession();	
		MemberDataBean memberid=(MemberDataBean)session.getAttribute("member");
		String id=memberid.getId();
		List<MyWishDataBean> mywishList=mypageservice.getmywishList(id);
		m.addAttribute("mywishList", mywishList);
		return "mypage/mywish";
	}
	
	@RequestMapping(value = "deleteWish")
	public void deleteWish(@RequestParam Map<String, Object> map) throws Exception {
		mypageservice.deleteWish(map);
	}
	
	@RequestMapping(value = "viewer")
	public String view(@RequestParam String isbn, Model m, HttpServletRequest  request) throws Exception {
		HttpSession session = request.getSession();	
		MemberDataBean memberid=(MemberDataBean)session.getAttribute("member");
		
		session.setAttribute("isbn", isbn);
		String id=memberid.getId();
		String path = request.getServletContext().getRealPath("/");		
		String viewbookfilename=mypageservice.getbookFileName(isbn);		
		String pagetest="";		
		
		path=path+"view/booktxt/"+viewbookfilename+".txt";
		//path=path+"view/booktxt/pride and prejudice.txt";
	
		BufferedReader reader = new BufferedReader(new FileReader (path));
	    String         line = null;
	    StringBuilder  stringBuilder = new StringBuilder();
	    String         ls = System.getProperty("line.separator");

	    try {
	        while((line = reader.readLine()) != null) {
	            stringBuilder.append(line);
	            stringBuilder.append(ls);
	        }	       
	    } finally {
	        reader.close();
	    }
		
	    
	   
	    
		/*List<String> booklet = new ArrayList<String>();
		for(int i=0; i<stringBuilder.toString().length(); i=i+1000){
			if (i+1000<stringBuilder.toString().length()) {			
				booklet.add(stringBuilder.toString().substring(i, i+1000));
			} else {
				booklet.add(stringBuilder.toString().substring(i));
			}		
		}	*/	
		
		//이어보기가 없을때
		if (mypageservice.checkResume(isbn, id) == 0) {
			System.out.println("없는거 실행");
			mypageservice.insertResume(isbn, id);
			pagetest = "0";
			session.setAttribute("pageNum", "0");
		} else {// 이어보기가 있을때
			System.out.println("있는거 실행");
			String resume = mypageservice.getResume(isbn, id);
			pagetest = resume;
			session.setAttribute("pageNum", resume);
		}

		
		
		
		int pageSize = 1;//가져올 크기 지정
		int currentPage = Integer.parseInt(pagetest);
		
		if (session.getAttribute("pageNum") == null) {
			session.setAttribute("pageNum", 0);
		}
		try {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {

		}
		
		int count = stringBuilder.toString().length()/1000 +1;//책 페이지 겟수 가져오기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if (currentPage > pageCount) {
			currentPage = pageCount;
			session.setAttribute("pageNum", currentPage);
		}

		int startRow = 1 + (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;		
				
		int number = count - (currentPage - 1) * pageSize;
		
		int bottomLine = 1;
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		String str1 = "";
		String str2 = "";
		int start = 1000 * currentPage;
		int end = start + 1000;
		if (end > stringBuilder.toString().length())
			end = stringBuilder.toString().length();
		str1 = stringBuilder.toString().substring(start, end);
		//str1=str1.replace("\n", " ");
		str2 = str1.replace("\n", "<br>");
		

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
		
		
		//if(currentPage!=0){
			mypageservice.saveResume(isbn, id, currentPage);
		//}
		
		
		m.addAttribute("str1", str1);
		m.addAttribute("str2", str2);
		return "mypage/viewer";
		
	}
}
