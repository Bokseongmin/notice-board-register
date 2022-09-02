<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-24
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form role="form" method="post" autocomplete="off">
    <p>
        <label for="userName">닉네임</label>
        <input type="text" id="userName" name="userName" value="${member.userName}"/>
    </p>
    <p>
        <label for="userPass">비밀번호 확인</label>
        <input type="password" id="userPass" name="userPass"/>
    </p>
    <p>
        <button type="submit">회원탈퇴</button>
    </p>
    <p>
        <a href="/">처음으로</a>
    </p>
</form>

<c:if test="${msg==false}">
    <p>
        입력한 비밀번호가 틀립니다.
    </p>
</c:if>
</body>
</html>
