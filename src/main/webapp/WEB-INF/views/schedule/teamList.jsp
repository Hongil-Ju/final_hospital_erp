<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link rel="stylesheet" href="/vendors/styles/schedule/teamList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- main -->
<h1>일정관리</h1>
	<br>
<h2>과 일정</h2>
    <br><br>

<c:forEach items="${scheduleList}" var="schedule">
    <input type="hidden" class="sch" codeCd="${schedule.codeCd}" memCd="${schedule.memCd}" startNum="${schedule.startNum}" endNum="${schedule.endNum}">
</c:forEach>

<div class="pd-20 card-box mb-30">
    <div class="pull-left"><h3 style="display: inline;">${ldt}</h3>&nbsp;&nbsp;&nbsp;&nbsp;<h4 style="display: inline;">${department} 일정</h4></div>
    <div class="pull-right">
        <input class="date-picker" id="datepicker" placeholder=" Select Date" type="text" value="" readonly style="background-color: white;">

        <select class="select" name="">
            <option selected="" value="0">전체 팀</option>
            <c:forEach items="${teams}" var="team">
                <option value="${team.depCd}">${team.depName}</option>
            </c:forEach>
        </select>
        <button class="btn btn-outline-primary filter-btn">조회</button>
        <a id="hidden-link" href=""></a>
    </div>
        <br><br><br>
    <div class="pull-right">
        총 ${total}명
    </div>
    <div class="pull-left">
        <span class="description"><span class="red-dot">●</span><span>: 연차</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="description"><span class="green-dot">●</span><span>: 수술</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="description"><span class="yellow-dot">●</span><span>: 진료</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="description"><span class="purple-dot">●</span><span>: 개인 일정</span></span>
            <br><br>
    </div>
    <c:forEach items="${members}" var="member">
        <table class="time-table-1">
            <tr>
                <th class="" rowspan="3"><span style="color: dimgrey; font-size: smaller;">${member.depName}</span><br><span class="${member.memCd}" id="off">${member.memName}</span></th>
                <th class="topper">1</th>
                <th class="topper">2</th>
                <th class="topper">3</th>
                <th class="topper">4</th>
                <th class="topper">5</th>
                <th class="topper">6</th>
                <th class="topper">7</th>
                <th class="topper">8</th>
                <th class="topper">9</th>
                <th class="topper">10</th>
                <th class="topper">11</th>
                <th class="topper">12</th>
                <th class="topper">13</th>
                <th class="topper">14</th>
                <th class="topper">15</th>
                <th class="topper">16</th>
                <th class="topper">17</th>
                <th class="topper">18</th>
                <th class="topper">19</th>
                <th class="topper">20</th>
                <th class="topper">21</th>
                <th class="topper">22</th>
                <th class="topper">23</th>
                <th class="topper">24</th>
            </tr>
            <tr>
                <th id="${member.memCd}-1" time="1" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-2" time="2" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-3" time="3" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-4" time="4" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-5" time="5" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-6" time="6" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-7" time="7" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-8" time="8" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-9" time="9" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-10" time="10" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-11" time="11" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-12" time="12" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-13" time="13" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-14" time="14" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-15" time="15" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-16" time="16" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-17" time="17" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-18" time="18" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-19" time="19" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-20" time="20" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-21" time="21" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-22" time="22" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-23" time="23" class="bottom n" rowspan="2"></th>
                <th id="${member.memCd}-24" time="24" class="bottom n" rowspan="2"></th>
            </tr>
            <tr>
            </tr>
        </table>
            <br>
    </c:forEach>
</div>

<script src="/vendors/scripts/schedule/teamList.js"></script>