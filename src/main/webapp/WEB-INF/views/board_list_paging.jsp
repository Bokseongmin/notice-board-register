<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-13
  Time: 오후 11:17
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
        function cntPer() {
            var sel = document.getElementById('cntPerPage').value;
            location.href = "board_list_paging?nowPage=${page.nowPage}&cntPerPage=" + sel;
        }
    </script>
</head>
<body>

<div class="container">
    <header>
        <%@include file="includes/header.jsp"%>
    </header>
    <div class="row">
    <section id="container">
        <form method="post">
            <div style="margin-bottom: 5px; float: right;">
                <select id="cntPerPage" name="sel" onchange="cntPer()">
                    <option value="5"
                            <c:if test="${page.cntPerPage== 5}">selected</c:if>>5개씩
                    </option>
                    <option value="10"
                            <c:if test="${page.cntPerPage == 10}">selected</c:if>>10개씩
                    </option>
                    <option value="15"
                            <c:if test="${page.cntPerPage == 15}">selected</c:if>>15개씩
                    </option>
                    <option value="20"
                            <c:if test="${page.cntPerPage == 20}">selected</c:if>>20개씩
                    </option>
                </select>
            </div> <!-- 옵션선택 끝 -->
        <h2>글 목록</h2>
        <table class="table table-hover">
            <tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일자</th></tr>
            <!-- 목록 시작 -->
            <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list.bno}</td>
                    <td>
                        <a href="/board_read?bno=${list.bno}">${list.title}</a>
                    </td>
                    <td>${list.writer}</td>
                    <td>${list.date}</td>
                </tr>
            </c:forEach>
            <!-- 목록 끝 -->
        </table>
            <div style="">
                <c:if test="${page.prev}">
                    <span>[ <a href="/board_list_paging?nowPage=${page.startPage - 1}&cntPerPage=${page.cntPerPage}">이전</a> ]</span>
                </c:if>
                <c:forEach begin="${page.startPage}" end="${page.lastPage}" var="nowPage">
                            <span>
                                <c:if test="${select != nowPage}">
                                    <a href="/board_list_paging?nowPage=${nowPage}&cntPerPage=${page.cntPerPage}">${nowPage}</a>
                                </c:if>
                                <c:if test="${select == nowPage}">
                                    <b>${nowPage}</b>
                                </c:if>
                            </span>
                </c:forEach>
                <c:if test="${page.next}">
                    <span>[ <a href="/board_list_paging?nowPage=${page.lastPage + 1}&cntPerPage=${page.cntPerPage}">다음</a> ]</span>
                </c:if>
            </div>
        </form>
    </section>
    <hr />
    <footer>
        <%@include file="includes/footer.jsp"%>
    </footer>
    </div>
</div>

</body>
</html>