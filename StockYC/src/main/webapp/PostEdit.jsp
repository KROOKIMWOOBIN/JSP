<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PostEdit</title>
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

<div id="center">
	<form action="postedit.do" method="get"> <!-- 글 쓰기를 처리하는 페이지의 주소를 입력해주세요 -->
	<c:set var="postId" value="${param.postId}"/> <!-- postId 값을 받아옴 -->
	<c:set var="title" value="${param.title}"/> <!-- title 값을 받아옴 -->
	<c:set var="content" value="${param.content}"/> <!-- userId 값을 받아옴 -->
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">글 번호</label>
		  <input type="text" name="id" value="${postId}" class="form-control" id="exampleFormControlInput1" readonly>
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" name="title" value="${title}" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="10" cols="50">${content}</textarea>
		</div>
		<button class="btn btn-warning me-2">수정</button>
	</form>
</div>
<div id="center">
	<a href="Community.jsp"><button class="btn btn-warning me-2">취소</button></a>
</div>

<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>
</html>