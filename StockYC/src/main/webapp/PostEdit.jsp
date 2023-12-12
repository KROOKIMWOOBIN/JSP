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
	<form action="postedit.do" method="get">
	<c:set var="postId" value="${param.postId}"/> <!-- postId 값을 받아옴 -->
	<c:set var="title" value="${param.title}"/> <!-- title 값을 받아옴 -->
	<c:set var="content" value="${param.content}"/> <!-- userId 값을 받아옴 -->
	    <h3>글 번호</h3>
	    <input type="text" name="id" value="${postId}">
	    <br>
	    <h3>제목</h3>
	    <input type="text" name="title" value="${title}">
	    <br>
	    <h3>내용</h3>
	    <textarea name="content" rows="10" cols="50" >${content}</textarea> <!-- 글 내용을 입력받는 텍스트 에어리어 -->
	    <br>
	    <button>수정</button>
	    <a href="Community.jsp"><button>취소</button></a>
	</form>
</div>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>
</html>