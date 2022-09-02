<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-18
  Time: 오전 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <%@include file="../includes/header.jsp" %>
    </header>
    <div class="row">
        <div class="d-flex justify-content-center">
            <c:if test="${member.userName == reply_list.writer}">
                <form class="form-center" name="reply_detail" id="reply_detail" role="form" method="post"
                      autocomplete="off">
                    <div class="form-group">
                        <label class="form-label" for="content">댓글 내용</label>
                        <input class="form-control" type="text" id="content" name="content"
                               value="${reply_list.content}"/>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-warning" type="submit">수정</button>
                        <input class="btn btn-primary" type="button" value="취소" onclick="reply_cancel()">
                    </div>
                </form>
            </c:if>
            <c:if test="${member.userName != reply_list.writer}">
                <p class="h2">로그인 후 이용해주세요</p>
            </c:if>
        </div>
    </div>
    <footer>
        <%@include file="../includes/footer.jsp" %>
    </footer>
</div>
</body>
</html>
