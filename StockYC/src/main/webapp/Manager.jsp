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
<div>
<h1>회원 목록</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>PW</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>삭제</th>
            <!-- 추가적인 필드들 -->
        </tr>
    	<c:forEach var="member" items="${ memberList }">
    	<tr>
			<td>${member.id }</td>
			<td>${member.password }</td>
			<td>${member.name }</td>
			<td>${member.email }</td>
			<form method="get" action="memberdel">
	            <td><button type="submit">삭제</button></td>
	            <input type="hidden" name="id" value="${member.id}">
	        </form>
		</tr>
    	</c:forEach>
    </table>
<form method="get" action="memberlist">
    <div style="display: flex; justify-content: center; margin-top: 100px">
    	<button>새로고침</button>
	</div>
</form>
</div>
<div>
<h1>게시판 목록</h1>
<table>
        <tr>
            <th>POST</th>
            <th>USER</th>
            <th>TITLE</th>
            <th>CONTENT</th>
            <th>삭제</th>
            <!-- 추가적인 필드들 -->
        </tr>
    	<c:forEach var="post" items="${ postList }">
    	<tr>
			<td>${post.postId }</td>
			<td>${post.userId }</td>
			<td>${post.title }</td>
			<td>${post.content }</td>
			<form method="get" action="postdel.do">
	            <td><button type="submit">삭제</button></td>
	            <input type="hidden" name="id" value="${post.postId}">
	        </form>
		</tr>
    	</c:forEach>
    </table>
<form method="get" action="postlist.do">
    <div style="display: flex; justify-content: center; margin-top: 100px">
    	<button>새로고침</button>
	</div>
</form>
</div>
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>

