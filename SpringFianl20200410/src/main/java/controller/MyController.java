package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String view(@RequestParam String isbn, Model m) throws Exception {
		System.out.println(isbn);
		m.addAttribute("isbn", isbn);
		return "mypage/viewer";
	}
}
