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
	
<div class="col-lg-12" style="display: flex; justify-content: center;">
	<ol class="list-group list-group-numbered fw-bold">
		<c:forEach var="post" items="${postList}">
			<li class="list-group-item d-flex justify-content-between align-items-center mt-3">
				<div class="ms-2 me-auto">
					<div class="">제목: ${post.title}</div>
					작성자: ${post.userId}
				</div>
				<div class="d-flex align-items-center">
					<form method="get" action="postdelect.do">
						<input type="hidden" name="id" value="${post.postId}">
						<c:choose>
							<c:when test="${post.userId != idKey}">
								<button class="btn btn-warning me-2 rounded-pill" disabled>삭제</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-warning me-2 rounded-pill">삭제</button>
							</c:otherwise>
						</c:choose>
					</form>
					<form method="get" action="PostEdit.jsp">
						<c:choose>
							<c:when test="${post.userId != idKey}">
								<button class="btn btn-warning me-2 rounded-pill" disabled>수정</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-warning me-2 rounded-pill">수정</button>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="postId" value="${post.postId}">
						<input type="hidden" name="title" value="${post.title}">
						<input type="hidden" name="content" value="${post.content}">
					</form>
					<button onclick="toggleContent(${post.postId})" class="btn btn-warning me-2 rounded-pill">내용 보기</button>
				</div>
			</li>
			<div id="content_${post.postId}" style="display: none; width: 100%;" class="content">
				<textarea class="form-control" rows="4" style="width: 100%;" readonly>${post.content}</textarea>
			</div>
		</c:forEach>
	</ol>
</div>

	
	<div id="center">
		<c:choose>
			<c:when test="${empty sessionScope.idKey}">
				<div class="card pt-5 pb-5" style="width: 30rem; margin-top: 80px; margin-bottom: 80px;">
				  <div class="card-body text-center">
				    <h2 class="card-title mb-4">커뮤니티</h2><hr>
				    <p class="card-text">로그인이 필요합니다.</p>
				    <p class="card-text">로그인 후 이용 부탁드립니다.</p>
				    <a href="Login.jsp"><button type="button" class="btn btn-warning me-2">Login</button></a>
				    <a href="Register.jsp"><button type="button" class="btn btn-warning me-2">Sign-up</button></a>
				  </div>
				</div>
			</c:when>
			<c:otherwise>
				<a href="Writing.jsp"><button type="button" class="btn btn-warning me-2 mt-3">글 쓰기</button></a>
				<form method="get" action="postselect.do">
					<button class="btn btn-warning me-2 mt-3">새로고침</button>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>
</html>