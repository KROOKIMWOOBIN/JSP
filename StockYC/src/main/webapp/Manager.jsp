<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="Servlet.DB.userDTO" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manager</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            background-color: #20B2AA;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 20px;
        }
        button:hover {
            background-color: #008B8B;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>

<div class="container text-end">
	<div class="row">
		<div class="col card me-3">
			<form method="get" action="memberlist">
					<button class="btn btn-warning me-3 mt-4">
			        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
			  				<path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"></path>
			  				<path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"></path>
						</svg>
			        </button>
			    <div style="display: flex; justify-content: center; margin-top: 10px">
			    	<h3>회원 관리</h3>
				</div>
			</form>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">PW</th>
			      <th scope="col">NAME</th>
			      <th scope="col">EMAIL</th>
			      <th scope="col">삭제</th>
			    </tr>
			    <c:forEach var="member" items="${ memberList }">
			    <tr>
					<td>${member.id }</td>
					<td>${member.password }</td>
					<td>${member.name }</td>
					<td>${member.email }</td>
					<form method="get" action="memberdel">
				           <td><button class="btn btn-warning">삭제</button></td>
				           <input type="hidden" name="id" value="${member.id}">
				    </form>
				</tr>
			    </c:forEach>
			  </thead>
			</table>
		</div>
		
		<div class="col card me-3">
			<form method="get" action="postlist.do">
				<button class="btn btn-warning me-3 mt-4">
			       	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
			  			<path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"></path>
			  			<path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"></path>
					</svg>
			    </button>
			    <div style="display: flex; justify-content: center; margin-top: 10px">
			    	<h3>게시판 관리</h3>
				</div>
			</form>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">POST</th>
			      <th scope="col">USER</th>
			      <th scope="col">TITLE</th>
			      <th scope="col">CONTENT</th>
			      <th scope="col">삭제</th>
			    </tr>
			    <c:forEach var="post" items="${ postList }">
			    	<tr>
						<td>${post.postId }</td>
						<td>${post.userId }</td>
						<td>${post.title }</td>
						<td>${post.content }</td>
						<form method="get" action="postdel.do">
				            <td><button class="btn btn-warning">삭제</button></td>
				            <input type="hidden" name="id" value="${post.postId}">
				        </form>
					</tr>
			    </c:forEach>
			  </thead>
			</table>
		</div>
	</div>
</div>
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>

