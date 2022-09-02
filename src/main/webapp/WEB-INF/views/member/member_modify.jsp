<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-23
  Time: 오후 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
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
    <div class="row">
        <section id="container">
            <div class="col-md-auto">
                <c:if test="${member != null}">
                    <form class="form-center" role="form" method="post" autocomplete="off">
                        <div class="form-group">
                            <label class="form-label" for="userName">닉네임</label>
                            <input class="form-control" type="text" id="userName" name="userName" readonly="readonly"
                                   value="${member.userName}"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="userPass">새로운 패스워드</label>
                            <input class="form-control pass" type="password" id="userPass" name="userPass"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="userPassCheck">패스워드 확인</label>
                            <input class="form-control pass" type="password" id="userPassCheck" name="userPassCheck"/>
                            <p class="passCheck">
                                <span class="msg">비밀번호를 확인해주세요</span>
                            </p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-outline-primary me-2">수정</button>
                            <button onclick="location.href='/'" type="button" class="btn btn-primary">취소</button>
                        </div>
                    </form>
                </c:if>
                <c:if test="${member == null}">
                    <p>로그인 후 이용 바랍니다.</p>
                </c:if>
            </div>
        </section>
    </div>
    <footer>
        <%@include file="/WEB-INF/views/includes/footer.jsp" %>
    </footer>
    <script>
        $(".pass").keyup(function () {
            var pass1 = $("#userPass").val();
            var pass2 = $("#userPassCheck").val();

            if(pass1 != "" || pass2 != ""){
                if(pass1 == pass2){
                    $(".passCheck .msg").text("일치");
                    $(".passCheck .msg").attr("style", "color:#00f");
                    $("#submit").attr("disabled", "disabled");
                }else{
                    $(".passCheck .msg").text("불일치");
                    $(".passCheck .msg").attr("style", "color:#f00");
                    $("#submit").removeAttr("disabled");
                }
            }
        });
    </script>
</div>
</body>
</html>
