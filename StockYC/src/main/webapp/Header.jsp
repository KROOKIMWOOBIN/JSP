<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
  <header class="p-3 mb-5 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-between justify-content-lg-start">
        <div class="d-flex align-items-center">
          <a href="Index.jsp" class="text-white text-decoration-none">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
              <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
            </svg>
          </a>
          <a href="Community.jsp" class="ms-2 ms-lg-5 text-white text-decoration-none">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
              <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
              <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
            </svg>
          </a>
        </div>
        <div class="text-end ms-lg-auto">
			<c:choose>
			    <c:when test="${idKey == null}">
			        <a href="Login.jsp"><button type="button" class="btn btn-outline-light me-2">Login</button></a>
			    </c:when>
			    <c:otherwise>
			        <a href="logout.do"><button type="button" class="btn btn-outline-light me-2">Logout</button></a>
			    </c:otherwise>
			</c:choose>
			<c:choose>
			    <c:when test="${idKey == null}">
			        <a href="Register.jsp"><button type="button" class="btn btn-warning me-2">Sign-up</button></a>
			    </c:when>
			    <c:otherwise>
			        <a href="Profile.jsp"><button type="button" class="btn btn-warning me-2">Profile</button></a>
			    </c:otherwise>
			</c:choose>
			<c:choose>
			    <c:when test="${idKey != null and idKey == 'Manager'}">
			        <a href="Manager.jsp"><button type="button" class="btn btn-outline-light me-2">Manager</button></a>
			    </c:when>
			</c:choose>
        </div>
      </div>
    </div>
  </header>
</body>
</html>
