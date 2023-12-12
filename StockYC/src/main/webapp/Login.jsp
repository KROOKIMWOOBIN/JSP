<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<header>
	      <jsp:include page="Header.jsp"></jsp:include>
	</header>
	<div class="mx-auto" style="width: 550px;">
		<form class="border border-2 p-3" style="border-radius: 20px;" method="get" action="/StockYC/login.do">
		    <h3 class="h3 mb-2 fw-normal text-center mt-5">로그인</h3>
		    <div class="form-floating mt-5">
		      <input type="text" class="form-control" placeholder="아이디" name="loginId">
		      <label for="floatingID">아이디</label>
		    </div>
		    <div class="form-floating mt-5">
		      <input type="password" class="form-control" placeholder="비밀번호" name="loginPassword">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
			<hr style="margin-top: 60px">
		    <button class="btn btn-warning w-100 py-2" type="submit" style="margin-top: 40px">로그인</button>
	   </form>
   </div>
   <footer>
      <jsp:include page="Footer.jsp"></jsp:include>
   </footer>
</body>
</html>