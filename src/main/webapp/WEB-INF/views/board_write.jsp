<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-12
  Time: 오후 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        function insert() {
            document.board_insert.action = "/write_insert";
            document.board_insert.submit();
        }

        function cancel() {
            document.board_insert.action = "/board_list";
            document.board_insert.submit();
        }
    </script>
    <style>
        .form-center {
            margin:0 auto;
            width:500px;
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
            <c:if test="${msg!= 'login_error'}">
                <form class="form-center" name="board_insert" role="form" method="post" autocomplete="off">
                    <div class="form-group">
                        <label class="form-label" for="title">글 제목</label>
                        <input class="form-control" type="text" id="title" name="title"/>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="content">글 내용</label>
                        <textarea class="form-control" id="content" name="content"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="writer">작성자</label>
                        <input class="form-control" type="text" id="writer" name="writer" value="${member.userName}"
                               readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit" onclick="insert()">작성</button>
                        <button class="btn btn-danger" type="submit" onclick="cancel()">취소</button>
                    </div>
                </form>
            </c:if>
            <c:if test="${msg=='login_error'}">
                <p>로그인을 하셔야 글을 작성할 수 있습니다.</p>
                <p><a href="/">홈으로</a></p>
            </c:if>
        </div>
    </section>
    </div>
    <footer>
        <%@include file="/WEB-INF/views/includes/footer.jsp" %>
    </footer>
</div>
</body>
</html>
