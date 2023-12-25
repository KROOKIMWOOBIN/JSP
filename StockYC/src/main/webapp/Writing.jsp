<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Writing</title>
<style type="text/css">
#center {
	display: flex;
	justify-content: center;
	align-items: flex-start;
}
button {
	background-color: #4169E1;
	color: white; 
	border: none;
	border-radius: 20px; 
}
</style>
</head>
<body>
<header>
	<jsp:include page="Header.jsp"></jsp:include>
</header>
	
<h3 class="text-center">글 쓰기</h3>
<div id="center">
	<form action="postinsert.do" method="get"> <!-- 글 쓰기를 처리하는 페이지의 주소를 입력해주세요 -->
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" name="title" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="10" cols="50"></textarea>
		</div>
		<button class="btn btn-warning me-2">작성</button>
	</form>
</div>
<div id="center">
	<a href="Community.jsp"><button type="button" class="btn btn-warning me-2">취소</button></a>
</div>

<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>
</html>