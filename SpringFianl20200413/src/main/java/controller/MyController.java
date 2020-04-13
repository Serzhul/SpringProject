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
	public String view(@RequestParam String isbn, Model m, HttpServletRequest  req) throws Exception {
		System.out.println(isbn);
		String path = req.getServletContext().getRealPath("/");
		
		String viewbookfilename=mypageservice.getbookFileName(isbn);
		
		/*path=path+"view/booktxt/"+viewbookfilename+".txt";

	
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
	    }*/
		
		path=path+"view/booktxt/pride and prejudice.txt";

		
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
		
	    
	    System.out.println("length : "+stringBuilder.length());
		List<String> booklet = new ArrayList<String>();
		for(int i=0; i<stringBuilder.toString().length(); i=i+1000){
			if (i+1000<stringBuilder.toString().length()) {			
				booklet.add(stringBuilder.toString().substring(i, i+1000));
			} else {
				booklet.add(stringBuilder.toString().substring(i));
			}		
		}
		
		
		//System.out.println(viewbookfilename);
		//m.addAttribute("isbn", isbn);
		//m.addAttribute("viewbookfilename", stringBuilder.toString());
		m.addAttribute("booklet", booklet);
		return "mypage/viewer";
	}
}
