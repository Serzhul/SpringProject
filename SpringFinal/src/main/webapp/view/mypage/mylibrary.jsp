<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.css-m7vpx0 {
  display:block;
}
.css-qw0dj1 {
    display: flex;
    align-items: flex-end;
    position: relative;
    float: left;
    padding-right: 100px;
    margin-top : 10px;
      margin-bottom : 50px;
}

.css-g2wylr {
    display: block;
    width: 110px;
    max-height: inherit;
}

.css-qw0dj1 .PortraitBook {
    width: 100%;
    height: 100%;
    max-width: inherit;
    display: flex;
    align-items: flex-end;
}

.css-cg78uv {
    position: relative;
    line-height: 0;
    width: 100%;
    height: 178px;
}

.css-ucph8a {
    line-height: 0;
    max-height: 178px;
    position: relative;
    width: 110px;
}

.viwerbutton-wrapper{
 margin: auto;

   width: 50%;
 display:block;
   
}

.viwerbutton {
   width: 50px;
    height: 30px;
    font-size: 16px;
    font-weight: bold;
    margin-top: 10px;
    box-shadow: rgba(31, 140, 230, 0.3) 1px 1px 1px 0px;
    background-color: #28a745;
    color: white;
    border-radius: 4px;
    border-width: 1px;
    border-style: solid;
    border-color: #a6f5b8;
    border-image: initial;

}

</style>
</head>

<body class="focus-free">
<section class="css-p4e9kp-container">
   <main>
      <div>
         <div class="css-1361tgj">
            <div class="BooksWrapper css-2uawkk">
            <c:forEach var="article" items="${library}">
   
               <div class="Book css-qw0dj1">
                  <div class="PortraitBook css-14kcwr6">
                     <div class="PortraitBook_Thumbnail css-cg78uv">
                        <div class="Thumbnail css-ucph8a">
                           <div class="css-19v5y1s">
                              <div class=" css-m7vpx0">
                                 <img src="<%=request.getContextPath()%>/view/images/carousel/${article.isbn}.jpg"
                                 class="css-g2wylr">
                              <div class="viwerbutton-wrapper">
                              <button type="button" id="viewer" name="viewer" viewer_isbn="${article.isbn}"
                              class="viwerbutton">보기</button>
                              </div>                              
                              </div>
                           
                           </div>
                        
                        </div>
                     
                     </div>
                  
                  </div>
               
               </div>
            </c:forEach>
            </div>
               
         </div>

</div>
</main>
</section>
</body>
<script type="text/javascript">
<%-- function viewer(isbn) {
   location.href="<%=request.getContextPath()%>/mypage/viewer?isbn="+isbn;
} --%>

//좋아요
$(document).on("click","button[name='viewer']", function(){
   var viewer_isbn = $(this).attr("viewer_isbn");
   var result = confirm("책을 보시겠습니까?");
   console.log(viewer_isbn);
    
    if(result){
       location.href="viewer?isbn="+viewer_isbn;
   }else{
       alert("취소하셨습니다");
   }
    
});
</script>
</html>