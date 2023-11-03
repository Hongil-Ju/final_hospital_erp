<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="/vendors/styles/surgery/scheduleInsert.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>수술실/비품관리</h1>
	<br>
<h2>수술실 예약</h2>
	<br><br>

<c:forEach items="${list}" var="eachList">
    <input type="hidden" class="reservator" reservator="${eachList.memName}">
    <input type="hidden" class="start-time" timeid="${eachList.startNum}">
    <input type="hidden" class="end-time" timeid="${eachList.endNum}">
</c:forEach>

<div id="schedule-insert-all-component">
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">조회 날짜</label>
        <div>
            <input class="form-control date-picker" id="datepicker" placeholder="Select Reservation Date" type="text" value="${ldt}" readonly style="background-color: white;">
            <button class="btn btn-outline-primary date-change-btn" style="display: none;">날짜 변경 조회</button>
            <a id="hidden-link" href=""></a>
        </div>
    </div>
    <br><br>
    <table class="time-table-1">
        <tr>
            <th scope="row">선택한 날짜</th>
            <th>호수</th>
            <th>예약자!!!</th>
        </tr>
        <tr id="table-top">
            <th scope="col" class="param-date" id="${ldt}">${ldt}</th>
            <th scope="col">${surgeryVO.surNum}</th>
            <th scope="col">${memberVO.memName}</th>
            <input id="surCd" type="hidden" value="${surgeryVO.surCd}">
            <input id="memCd" type="hidden" value="${memberVO.memCd}">
        </tr>
    </table>
        <br><br><br>
    <table class="time-table-1">
        <tr>
            <th>00:00 ~ 01:00</th>
            <th>01:00 ~ 02:00</th>
            <th>02:00 ~ 03:00</th>
            <th>03:00 ~ 04:00</th>
            <th>04:00 ~ 05:00</th>
            <th>05:00 ~ 06:00</th>
            <th>06:00 ~ 07:00</th>
            <th>07:00 ~ 08:00</th>
        </tr>
        <tr>
            <th id="0" class="t time-select"></th>
            <th id="1" class="t time-select"></th>
            <th id="2" class="t time-select"></th>
            <th id="3" class="t time-select"></th>
            <th id="4" class="t time-select"></th>
            <th id="5" class="t time-select"></th>
            <th id="6" class="t time-select"></th>
            <th id="7" class="t time-select"></th>
        </tr>
    </table>
        <br>
    <table class="time-table-1">
        <tr>
            <th>08:00 ~ 09:00</th>
            <th>09:00 ~ 10:00</th>
            <th>10:00 ~ 11:00</th>
            <th>11:00 ~ 12:00</th>
            <th>12:00 ~ 13:00</th>
            <th>13:00 ~ 14:00</th>
            <th>14:00 ~ 15:00</th>
            <th>15:00 ~ 16:00</th>
        </tr>
        <tr>
            <th id="8" class="t time-select"></th>
            <th id="9" class="t time-select"></th>
            <th id="10" class="t time-select"></th>
            <th id="11" class="t time-select"></th>
            <th id="12" class="t time-select"></th>
            <th id="13" class="t time-select"></th>
            <th id="14" class="t time-select"></th>
            <th id="15" class="t time-select"></th>
        </tr>
    </table>
        <br>
    <table class="time-table-1">
        <tr>
            <th>16:00 ~ 17:00</th>
            <th>17:00 ~ 18:00</th>
            <th>18:00 ~ 19:00</th>
            <th>19:00 ~ 20:00</th>
            <th>20:00 ~ 21:00</th>
            <th>21:00 ~ 22:00</th>
            <th>22:00 ~ 23:00</th>
            <th>23:00 ~ 24:00</th>
        </tr>
        <tr>
            <th id="16" class="t time-select"></th>
            <th id="17" class="t time-select"></th>
            <th id="18" class="t time-select"></th>
            <th id="19" class="t time-select"></th>
            <th id="20" class="t time-select"></th>
            <th id="21" class="t time-select"></th>
            <th id="22" class="t time-select"></th>
            <th id="23" class="t time-select"></th>
        </tr>
    </table>
        <br>
    <span class="description"><span class="green-dot">●</span><span> : 예약 가능</span></span>
        <br>
    <span class="description"><span class="red-dot">●</span><span> : 예약 불가</span></span>
        <br><br>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">시작 시간</label>
        <div>
            <select class="custom-select col-12 surgery-start">
                <option value="0">00:00</option>
                <option value="1">01:00</option>
                <option value="2">02:00</option>
                <option value="3">03:00</option>
                <option value="4">04:00</option>
                <option value="5">05:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">종료 시간</label>
        <div>
            <select class="custom-select col-12 surgery-end">
                <option value="1">01:00</option>
                <option value="2">02:00</option>
                <option value="3">03:00</option>
                <option value="4">04:00</option>
                <option value="5">05:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
                <option value="24">24:00</option>
            </select>
        </div>
    </div>
        <br>
    <!-- <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label" style="font-weight: bold; font-size: large; text-align: center;">참가 인원 선택</label>
        <div>
            <select class="custom-select col-12 particiant-select">
                <c:forEach items="${surgeryParticiantList}" var="particiant">
                    <option value="${particiant.depName}&nbsp;${particiant.memName}&nbsp;${particiant.memCd}">${particiant.depName}&nbsp;${particiant.memName}&nbsp;${particiant.memCd}</option>
                </c:forEach>
            </select>
            <button class="btn btn-outline-primary particiant-insert">인원 등록</button>
            <button class="btn btn-outline-primary all-particiant-delete">인원 초기화</button>
        </div>
    </div>
    <div class="bootstrap-tagsinput" id="particiant-place">
    </div> -->
        <br><br>
    <div class="clearfix mb-20">
        <div id="schedule-insert-btn">
            <input type="button" class="btn btn-outline-primary" value="수술실 예약"></button>
        </div>
    </div>
        <br>
</div>

<script src="/vendors/scripts/surgery/scheduleInsert.js"></script>