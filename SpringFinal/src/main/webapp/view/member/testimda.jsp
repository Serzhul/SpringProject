<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
   <!-- Bootstrap -->
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="${path}/resources/css/style.css" media="screen" title="no title" charset="utf-8">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>


      <article class="container">
        <div class="page-header">
          <h1>ȸ������ <small>Sign up</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
            <div class="form-group">
              <label for="InputId">���̵�</label>
              <input type="text" class="form-control" id="Id" placeholder="���̵�">
            </div>
			
            <div class="form-group">
              <label for="InputPassword1">��й�ȣ</label>
              <input type="password" class="form-control" id="Password" placeholder="��й�ȣ">
            </div>
			
            <div class="form-group">
              <label for="InputPassword2">��й�ȣ Ȯ��</label>
              <input type="password" class="form-control" id="Password2" placeholder="��й�ȣ Ȯ��">
              <p class="help-block">��й�ȣ Ȯ���� ���� �ٽ� �ѹ� �Է� �� �ּ���</p>
            </div>
            <div class="form-group">
              <label for="username">�̸�</label>
              <input type="text" class="form-control" id="Name" placeholder="�̸��� �Է��� �ּ���">
            </div>
                     
			<div class="form-group">
              <label for="InputEmail">��ȭ ��ȣ</label>
              <input type="text" class="form-control" id="PhoneNum" placeholder="��ȭ ��ȣ�� �Է��� �ּ���">
            </div>

            <div class="form-group">
              <label for="InputEmail">�̸��� �ּ�</label>
              <input type="email" class="form-control" id="Email" placeholder="�̸��� �ּҸ� �Է��� �ּ���">
            </div>
			
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">ȸ������<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">�������<i class="fa fa-times spaceLeft"></i></button>
            </div>
        </div>

      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
