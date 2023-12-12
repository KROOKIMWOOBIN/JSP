<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>
<style>
#inputText {
	background-color: #FFA500;
	color: white;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#inputText:hover {
	background-color: #FF8C00;
}

#center {
	display: flex;
	justify-content: center;
}
li {
    list-style: none;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 5px;
    width: 1200px;
    display: flex; 
}
button {
	background-color: #4169E1;
	color: white; 
	border: none;
	border-radius: 20px; 
}
.content {
	background-color: #f2f2f2;
	padding: 10px;
    border-radius: 5px;
    overflow: scroll;
}
</style>
<script>
function toggleContent(postId) {
    var contentElement = document.getElementById("content_" + postId);
    if (contentElement.style.display === "none") {
        contentElement.style.display = "block";
    } else {
        contentElement.style.display = "none";
    }
}
</script>
</head>
<body>
<header>
	<jsp:include page="Header.jsp"></jsp:include>
</header>
	<div style="display: flex; justify-content: center;">
		<h2>글 목록</h2>
		<ul style="margin-top: 50px">
			<c:forEach var="post" items="${postList}">
			    <li>${post.postId}. 제목: ${post.title} <br>작성자: ${post.userId} 
			        <form method="get" action="postdelect.do">
			            <input type="hidden" name="id" value="${post.postId}">
			            <c:choose>
			                <c:when test="${post.userId != idKey}">
			                    <button style="margin-left: 40px" disabled>삭제</button>
			                </c:when>
			                <c:otherwise>
			                    <button style="margin-left: 40px">삭제</button>
			                </c:otherwise>
			            </c:choose>
			        </form>
			        <form method="get" action="PostEdit.jsp">
			            <c:choose>
			                <c:when test="${post.userId != idKey}">
			                    <button style="margin-left: 40px" disabled>수정</button>
			                </c:when>
			                <c:otherwise>
			                    <button style="margin-left: 40px">수정</button>
			                </c:otherwise>
			            </c:choose>
			            <input type="hidden" name="postId" value="${post.postId}">
			            <input type="hidden" name="title" value="${post.title}">
			            <input type="hidden" name="content" value="${post.content}">
			        </form>
			        <!-- 보기 버튼 -->
			        <button onclick="toggleContent(${post.postId})" style="margin-left: 40px; width: 50px; height: 25px;">보기</button>
			        <!-- 글 내용 -->
			    </li>
				<div id="content_${post.postId}" style="display: none;" class="content">
				    ${post.content}
				</div>
			</c:forEach>
		</ul>
	</div>
	<div id="center">
		<c:choose>
			<c:when test="${empty sessionScope.idKey}">
				<span>로그인이 필요합니다. 로그인 후 이용해주세요.</span>
			</c:when>
			<c:otherwise>
				<a href="Writing.jsp"><button>글 쓰기</button></a>
				<form method="get" action="postselect.do">
					<button style="margin-left: 10px">새로고침</button>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>
</html>