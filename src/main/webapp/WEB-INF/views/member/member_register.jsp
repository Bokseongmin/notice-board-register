<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-20
  Time: 오전 7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header>
    <%@include file="/WEB-INF/views/includes/header.jsp" %>
</header>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <c:choose>
                <c:when test="${member == null}">
                    <form class="mb-3" role="form" method="post" autocomplete="off">
                        <div class="form-group">
                            <label class="form-label" for="userID">아이디</label>
                            <input class="form-control" type="text" id="userID" name="userID"/>
                            <p class="result">
                                <span class="msg">아이디를 확인해주세요</span>
                            </p>
                            <button class="btn btn-primary id_check" type="button">아이디 확인</button>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="userPass">패스워드</label>
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
                            <label class="form-label" for="userPass">닉네임</label>
                            <input class="form-control" type="text" id="userName" name="userName"/>
                        </div>
                        <button class="btn btn-primary" id="submit" type="submit" disabled="disabled">가입</button>
                        <p><a href="/">처음으로</a></p>
                    </form>
                </c:when>
                <c:otherwise>
                    <p>로그아웃 이후 이용해주세요</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <footer>
        <%@include file="/WEB-INF/views/includes/footer.jsp" %>
    </footer>
</div>
<script>
    $(".id_check").click(function () {

        var query = {userID: $("#userID").val()};

        $.ajax({
            url: "/member/id_check",
            type: "post",
            data: query,
            success: function (data) {

                if (data == 1) {
                    $(".result .msg").text("사용 불가");
                    $(".result .msg").attr("style", "color:#f00");
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $(".result .msg").text("사용 가능");
                    $(".result .msg").attr("style", "color:#00f");
                    $("#submit").removeAttr("disabled");
                }
            }
        });  // ajax 끝
    });
    $("#userID").keyup(function () {
        $(".result .msg").text("아이디를 확인해주십시오.");
        $(".result .msg").attr("style", "color:#000");

        $("#submit").attr("disabled", "disabled");

    });

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
</body>
</html>
