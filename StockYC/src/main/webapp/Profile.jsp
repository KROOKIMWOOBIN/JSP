<%@page import="Servlet.DB.userDTO"%>
<%@page import="Servlet.DB.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
<header>
	<jsp:include page="Header.jsp" />
</header>
<c:set var="dto" value="${userDAO().getData(sessionScope.idKey)}" />
<div id="Profil">
    <div id="Profil-box">
        <div class="mx-auto" style="width: 550px;">
            <div class="border border-2 p-3" style="border-radius: 20px;">
                <h3 class="h3 mb-3 mt-3 fw-normal text-center">회원 수정</h3>
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" placeholder="이름" value="${dto.name}" readonly>
                </div>
                <div class="form-group mt-5">
                    <label for="username">아이디</label>
                    <input type="text" class="form-control" id="username" placeholder="아이디" value="${dto.id}" readonly>
                </div>
                <div class="form-group mt-5">
                    <form method="get" action="/StockYC/changeC.do">
                        <label for="password">비밀번호</label>
                        <div class="d-flex align-items-center">
                            <input type="text" class="form-control" placeholder="비밀번호" name="password" value="${dto.password}" style="width: 800px;">
        					<button class="btn btn-warning py-2" type="submit" style="margin-left: 10px; width: 150px;">변경</button>
        				</div>
                    </form>
                </div>
                <div class="form-group mt-5">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" placeholder="이메일" value="${dto.email}" readonly>
                </div>
                <hr style="margin-top: 30px">
                <a href="resignC.do"><button class="btn btn-warning w-100 py-2" type="submit" style="margin-top: 15px">회원 탈퇴</button></a>
                <a href="Index.jsp"><button class="btn btn-warning w-100 py-2" type="submit" style="margin-top: 15px">취소</button></a>
            </div>
        </div>
    </div>
</div>
<footer>
	<jsp:include page="Footer.jsp" />
</footer>
</body>
</html>
