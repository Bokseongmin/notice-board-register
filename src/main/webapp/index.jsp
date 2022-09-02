<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .form-center {
            margin: 0 auto;
            width: 500px;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <%@include file="/WEB-INF/views/includes/header.jsp" %>
    </header>
    <!--<nav>
        <%@include file="/WEB-INF/views/includes/nav.jsp" %>
    </nav>-->
    <div class="row">
        <div class="d-flex justify-content-center">
            <c:if test="${member == null}">
                <form class="form-center" role="form" method="post" autocomplete="off" action="/member/login">
                    <div class="form-group">
                        <label class="form-label" for="userID">아이디</label>
                        <input class="form-control" type="text" id="userID" name="userID"/>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="userPass">비밀번호</label>
                        <input class="form-control" type="password" id="userPass" name="userPass"/>
                    </div>
                    <div class="mt-1">
                        <button class="btn btn-primary" type="submit">로그인</button>
                        <button type="button" class="btn btn-secondary" onclick="location.href='/member/member_register'">회원가입
                        </button>
                    </div>
                </form>
            </c:if>
            <c:if test="${msg == false}">
                <p class="h4">
                    로그인 실패
                </p>
            </c:if>
            <c:if test="${member != null}">
                <div>
                <div class="h4">${member.userName}님 환영합니다.</div>
                    <button type="button" class="btn btn-primary" onclick="location.href='member/member_modify'">개인정보
                        수정
                    </button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='member/logout'">로그아웃
                    </button>
                    <button type="button" class="btn btn-danger" onclick="location.href='member/member_delete'">회원탈퇴
                    </button>
                </div>
            </c:if>
        </div>
    </div>
    <footer>
        <%@include file="WEB-INF/views/includes/footer.jsp" %>
    </footer>
</div>
</body>
</html>