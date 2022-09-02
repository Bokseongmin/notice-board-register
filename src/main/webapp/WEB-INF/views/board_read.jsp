<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-12
  Time: 오후 11:59
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
        function board_list() {
            location.href = "/board_list_search?nowPage=${page.nowPage}&cntPerPage=${page.cntPerPage}&searchType=${page.searchType}&keyword=${page.keyword}";
        }

        function board_update() {
            document.board_detail.action = "/board_update?nowPage=${page.nowPage}&cntPerPage=${page.cntPerPage}&searchType=${page.searchType}&keyword=${page.keyword}";
            document.getElementById("board_detail").submit();
        }

        function board_delete() {
            document.board_detail.action = "/board_delete";
            document.getElementById("board_detail").submit();
        }

        function reply_update(rno) {
            self.location = "/reply/reply_update?bno=${read.bno}" +
                "&nowPage=${page.nowPage}" +
                "&cntPerPage=${page.cntPerPage}" +
                "&searchType=${page.searchType}" +
                "&keyword=${page.keyword}" +
                "&rno=" + rno;
        }

        function reply_delete(rno) {
            self.location = "/reply/reply_delete?bno=${read.bno}" +
                "&nowPage=${page.nowPage}" +
                "&cntPerPage=${page.cntPerPage}" +
                "&searchType=${page.searchType}" +
                "&keyword=${page.keyword}" +
                "&rno=" + rno;
        }
    </script>
</head>
<body>

<div class="container">
    <header>
        <%@include file="includes/header.jsp" %>
    </header>
    <section id="container">
        <form name="board_detail" id="board_detail" role="form" method="post" autocomplete="off">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="bno">글 번호</label>
                <input class="form-control" type="text" id="bno" name="bno" value="${read.bno}"
                       readonly="readonly"/>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="title">글 제목</label>
                <input class="form-control" type="text" id="title" name="title" value="${read.title}"/>
            </div>
            <div class="form-group">
                <label class="form-label" for="content">글 내용</label>
                <textarea class="form-control" style="height: 20vh; resize: none;" id="content" name="content">${read.content}</textarea>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="writer">작성자</label>
                <input class="form-control" type="text" id="writer" name="writer" value="${read.writer}"
                       readonly="readonly"/>
                <label>작성 날짜</label><span>${read.date}</span>
            </div>
            <div class="form-group">
                <c:if test="${read.writer == member.userName}">
                <input class="btn btn-warning" type="button" value="수정"
                       onclick="board_update()">
                <input class="btn btn-danger" type="button" value="삭제"
                       onclick="board_delete()">
                </c:if>
                <input class="btn btn-primary" type="button" value="목록"
                       onclick="board_list()">
            </div>
        </form>
        <!-- 게시물 끝 -->
        <div id="reply">
            <ol class="replyList">
                <c:forEach items="${reply_list}" var="reply_list">
                    <li>
                        <p>
                            <span class="glyphicon glyphicon-user"></span>
                                ${reply_list.writer}
                            작성 날짜 : ${reply_list.date}
                        </p>
                        <p>${reply_list.content}</p>
                        <p>
                            <c:if test="${member.userName == reply_list.writer}">
                            <input class="btn btn-warning btn-xs" type="button" value="수정"
                                   onclick="reply_update(${reply_list.rno})">
                            <input class="btn btn-danger btn-xs" type="button" value="삭제"
                                   onclick="reply_delete(${reply_list.rno})">
                            </c:if>
                        </p>
                    </li>
                </c:forEach>
            </ol>
            <c:if test="${member != null}">
                <div>
                    <form method="post" action="/reply/reply_write">
                        <input type="hidden" id="r_bno" name="r_bno" value="${read.bno}" readonly="readonly"/>
                        <input type="hidden" id="nowPage" name="nowPage" value="${page.nowPage}" readonly="readonly"/>
                        <input type="hidden" id="cntPerPage" name="cntPerPage" value="${page.cntPerPage}"
                               readonly="readonly"/>
                        <input type="hidden" id="searchType" name="searchType" value="${page.searchType}"
                               readonly="readonly"/>
                        <input type="hidden" id="keyword" name="keyword" value="${page.keyword}" readonly="readonly"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="writer">댓글 작성자</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" name="writer" value="${member.userName}" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="content">댓글 내용</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" cols="50" name="content"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="hidden" name="bno" value="${read.bno}">
                                <button class="btn btn-success" type="submit">댓글 작성</button>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>
            <c:if test="${member == null}">
                <p>로그인을 하셔야 댓글을 작성할 수 있습니다.</p>
                <p><a href="/">홈으로</a></p>
            </c:if>
        </div>
    </section>
    <hr/>
    <footer>
        <%@include file="includes/footer.jsp" %>
    </footer>
</div>
</body>
</html>
