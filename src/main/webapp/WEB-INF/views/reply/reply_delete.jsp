<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-19
  Time: 오전 7:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>게시판</title>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function reply_cancel() {
            self.location = "/board_read?bno=${page.bno}" +
                "&nowPage=${page.nowPage}" +
                "&cntPerPage=${page.cntPerPage}" +
                "&searchType=${page.searchType}" +
                "&keyword=${page.keyword}";
        }
    </script>
</head>
<body>
<div class="container">
    <header>
        <%@include file="../includes/header.jsp"%>
    </header>
    <section id="container">
        <c:if test="${member.userName == reply_list.writer}">
        <form name="reply_detail" id="reply_detail" role="form" method="post" autocomplete="off">
            <p class="h2">정말로 삭제하시겠습니까?</p>
            <div class="form-group">
                <button class="btn btn-danger btn-xs" type="submit">예, 삭제합니다.</button><br/>
                <input class="btn btn-warning btn-xs" type="button" value="아니요" onclick="reply_cancel()">
            </div>
        </form>
        </c:if>
        <c:if test="${member.userName != reply_list.writer}">
            <p class="h2">로그인 후 이용해주세요</p>
        </c:if>
    </section>
    <footer>
        <%@include file="../includes/footer.jsp"%>
    </footer>
</div>
</body>
</html>