<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-15
  Time: 오전 12:33
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
        function cntPer() {
            var sel = document.getElementById('cntPerPage').value;
            location.href = "board_list_search?nowPage=${page.nowPage}&cntPerPage=" + sel;
        }

        function searchBtn() {
            let searchType = document.getElementsByName("searchType")[0].value;
            let keyword = document.getElementsByName("keyword")[0].value;
            location.href = "board_list_search?nowPage=${page.nowPage}&cntPerPage=${page.cntPerPage}&searchType=" + searchType + "&keyword=" + keyword;
        }
    </script>
</head>
<body>

<!--<div id="root">-->
<div class="container">
    <header>
        <%@include file="includes/header.jsp" %>
    </header>
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
                <thead>
                <tr>
                    <th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                </tr>
                </thead>
                <!-- 목록 시작 -->
                <c:forEach items="${list}" var="list">
                    <tr>
                        <td>${list.bno}</td>
                        <td>
                            <!--<a href="/board_read?bno=${list.bno}">${list.title}</a>-->
                            <a href="/board_read?bno=${list.bno}&nowPage=${page.nowPage}&cntPerPage=${page.cntPerPage}${page.searchType_keyword}">${list.title}</a>
                        </td>
                        <td>${list.writer}</td>
                        <td>${list.date}</td>
                    </tr>
                </c:forEach>
                <!-- 목록 끝 -->
            </table>
            <div class="d-flex justify-content-center">
                <ul class="pagination">
                    <c:if test="${page.prev}">
                        <li class="page-item">
                            <a class="page-link" href="/board_list_search?nowPage=${page.startPage - 1}&cntPerPage=${page.cntPerPage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="${page.startPage}" end="${page.lastPage}" var="nowPage">
                        <li class="page-item" <c:out value="${select == nowPage ? 'class=page-item active' : ''}"/>>
                            <a class="page-link" href="/board_list_search?nowPage=${nowPage}&cntPerPage=${page.cntPerPage}${page.searchType_keyword}">${nowPage}</a>
                        </li>
                        <!--<c:if test="${select != nowPage}">
                        <a href="/board_list_search?nowPage=${nowPage}&cntPerPage=${page.cntPerPage}${page.searchType_keyword}">${nowPage}</a>
                    </c:if>
                        <c:if test="${select == nowPage}">
                            <b class="page-link">${nowPage}</b>
                        </c:if> -->
                    </c:forEach>
                    <c:if test="${page.next}">
                        <li class="page-item">
                            <a class="page-link" href="/board_list_search?nowPage=${page.lastPage + 1}&cntPerPage=${page.cntPerPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <!--검색-->
            <div class="search row">
                <div class="col-xs-2 col-sm-2">
                    <select name="searchType" class="form-control">
                        <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
                        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
                        <option value="title_content"
                                <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용
                        </option>
                        <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
                    </select>
                </div>
                <div class="col-xs-10 col-sm-10">
                    <div class="input-group">
                        <input class="form-control" type="text" name="keyword" value="${page.keyword}"/>
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" onclick="searchBtn()">검색</button>
                        </span>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <hr/>
    <footer>
        <%@include file="includes/footer.jsp" %>
    </footer>

</div>

</body>
</html>