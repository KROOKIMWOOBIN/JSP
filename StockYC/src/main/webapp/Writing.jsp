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
<div id="center">
	<form action="postinsert.do" method="get"> <!-- 글 쓰기를 처리하는 페이지의 주소를 입력해주세요 -->
	    <h3>제목</h3>
	    <input type="text" name="title">
	    <br>
	    <h3>내용</h3>
	    <textarea name="content" rows="10" cols="50"></textarea> <!-- 글 내용을 입력받는 텍스트 에어리어 -->
	    <br>
	    <button>작성</button>
	    <a href="Community.jsp"><button>취소</button></a>
	</form>
</div>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>
</html>