<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-13
  Time: 오후 7:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="d-flex align-items-center col-md-3 mb-2 mb-md-0"></div>
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="/board_list" class="nav-link px-2 link-dark">글목록</a></li>
            <li><a href="/board_write" class="nav-link px-2 link-dark">글작성</a></li>
            <li><a href="/board_list_paging" class="nav-link px-2 link-dark">글 목록 + 페이징</a></li>
            <li><a href="/board_list_search" class="nav-link px-2 link-dark">글 목록 + 페이징 + 검색</a></li>
        </ul>

        <div class="col-md-3 text-end">
            <c:choose>
                <c:when test="${member != null}">
                    <div class="dropdown text-end">
                        <a href="#" class="link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                           aria-expanded="false">
                                ${member.userName}
                        </a>
                        <ul class="dropdown-menu text-small">
                            <li><a class="dropdown-item" href="/member/member_modify">회원정보 수정</a></li>
                            <c:if test="${member.verify == 9}">
                                <li>
                                    <a  class="dropdown-item" href="/">관리자 화면</a>
                                </li>
                            </c:if>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <button onclick="location.href='/'" type="button" class="btn btn-outline-primary me-2">Login</button>
                    <button onclick="location.href='/member/member_register'" type="button" class="btn btn-primary">
                        Sign-up
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>