<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-12
  Time: 오후 11:53
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
</head>
<body>

<div id="root">
  <header>
    <%@include file="includes/header.jsp"%>
  </header>
  <section id="container">
    <h2>글 목록</h2>
    <table>
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
  </section>
  <hr />
  <footer>
    <%@include file="includes/footer.jsp"%>
  </footer>

</div>

</body>
</html>