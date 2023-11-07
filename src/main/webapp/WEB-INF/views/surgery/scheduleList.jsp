<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>수술실/비품관리</h1>
	<br>
<h2>나의 수술실 예약 내역</h2>
	<br><br>

<table class="table table-bordered">
    <thead>
        <tr id="table-top">
            <th scope="col">수술실</th>
			<th scope="col">날짜</th>
            <th scope="col">시작 시간</th>
            <th scope="col">종료 시간</th>
			<th scope="col">취소</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${scheduleList}" var="list">
            <tr>
                <th scope="row" value="${list.surNum}">${list.surNum}</th>
                <td class="param-date">${list.dateString}</td>
                <td>${list.startNumString}</td>
                <td>${list.endNumString}</td>
                <td value="${list.schCd}">
                    <span class="badge badge-primary"><a class="surgery-schedule-update-btn" id="a2">수정하기</a></span>
                    <span class="badge badge-primary"><a class="surgery-schedule-delete-btn" id="a2">취소하기</a></span>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    <br>
<script src="/vendors/scripts/surgery/scheduleList.js"></script>