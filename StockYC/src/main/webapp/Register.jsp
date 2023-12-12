<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>

	<header>
	      <jsp:include page="Header.jsp"></jsp:include>
	</header>
	<div class="mx-auto" style="width: 550px;">
		<form class="border border-2 p-3" style="border-radius: 20px;" method="get" action="/StockYC/joinC.do">
		    <h3 class="h3 mb-3 mt-3 fw-normal text-center">회원가입</h3>
		    <div class="form-floating">
		      <input type="text" class="form-control" placeholder="이름" name="name">
		      <label for="floatingID">이름</label>
		    </div>
		    <div class="form-floating mt-5">
		      <input type="text" class="form-control" placeholder="아이디" name="id">
		      <label for="floatingID">아이디</label>
		    </div>
		    <div class="form-floating mt-5">
		      <input type="password" class="form-control" placeholder="비밀번호" name="password">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
		    <div class="form-floating mt-5">
		      <input type="password" class="form-control"  placeholder="비밀번호 확인">
		      <label for="floatingPasswordCheck">비밀번호 확인</label>
		    </div>
		    <div class="form-floating mt-5">
		      <input type="email" class="form-control"  placeholder="이메일" name="email">
		      <label for="floatingInput">이메일</label>
		    </div>
			<hr style="margin-top: 30px">
		    <button class="btn btn-warning w-100 py-2" type="submit" style="margin-top: 15px">회원가입</button>
	   </form>
   </div>
   <footer>
      <jsp:include page="Footer.jsp"></jsp:include>
   </footer>
</body>
</html>