<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>수술실/비품관리</h1>
	<br>
<h2>비품 조회</h2>
	<br><br>
<div class="pd-20 card-box mb-30">
	<div class="collapse collapse-box" id="basic-table">
		<div class="code-box">
			<div class="clearfix">
				<a href="javascript:;" class="btn btn-primary btn-sm code-copy pull-left" data-clipboard-target="#basic-table-code"><i class="fa fa-clipboard"></i> Copy Code</a>
				<a href="#basic-table" class="btn btn-primary btn-sm pull-right" rel="content-y" data-toggle="collapse" role="button"><i class="fa fa-eye-slash"></i> Hide Code</a>
			</div>
			<pre><code class="xml copy-pre hljs" id="basic-table-code">
				<span class="hljs-tag">&lt;<span class="hljs-name">table</span> <span class="hljs-attr">class</span>=<span class="hljs-string">"table"</span>&gt;</span>
				<span class="hljs-tag">&lt;<span class="hljs-name">thead</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">tr</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">th</span> <span class="hljs-attr">scope</span>=<span class="hljs-string">"col"</span>&gt;</span>#<span class="hljs-tag">&lt;/<span class="hljs-name">th</span>&gt;</span>
					<span class="hljs-tag">&lt;/<span class="hljs-name">tr</span>&gt;</span>
				<span class="hljs-tag">&lt;/<span class="hljs-name">thead</span>&gt;</span>
				<span class="hljs-tag">&lt;<span class="hljs-name">tbody</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">tr</span>&gt;</span>
					<span class="hljs-tag">&lt;<span class="hljs-name">th</span> <span class="hljs-attr">scope</span>=<span class="hljs-string">"row"</span>&gt;</span>1<span class="hljs-tag">&lt;/<span class="hljs-name">th</span>&gt;</span>
					<span class="hljs-tag">&lt;/<span class="hljs-name">tr</span>&gt;</span>
				<span class="hljs-tag">&lt;/<span class="hljs-name">tbody</span>&gt;</span>
				<span class="hljs-tag">&lt;/<span class="hljs-name">table</span>&gt;</span>
			</code></pre>
		</div>
	</div>
	<div id="DataTables_Table_2_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
		<div class="clearfix mb-20">
			<div class="pull-left">
				<c:forEach items="${categories}" var="category">
					<button class="btn btn-outline-primary category-filter-btn" value="${category.codeName}">${category.codeName}</button>
				</c:forEach>
				<button class="btn btn-outline-primary" onclick="location.href='../equipment/list'">전체보기</button>
			</div>
			<div class="pull-right">
				총 ${number}개
			</div>
			<!-- <div class="pull-right">
				'대여가능'만 보기 <input type="checkbox" checked="" data-size="" data-color="#0099ff" data-switchery="true" style="color: rgb(0, 153, 255);">
			</div> -->
		</div>
		<table class="table hover multiple-select-row data-table-export nowrap datatable2 no-footer dtr-inline" id="DataTables_Table_2" role="grid">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="no: activate to sort column ascending">no</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="항목: activate to sort column ascending">항목</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="시리얼 넘버: activate to sort column ascending">시리얼 넘버</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="대여자: activate to sort column ascending">대여자</th>
					<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="대여가능여부: activate to sort column ascending">대여가능여부</th></tr>
			</thead>
			<tbody>

				
				<c:forEach items="${allEquipments}" var="list" varStatus="status">
					<tr role="row" class="">
						<td value="${list.equCd}">${status.count}</td>
						<td>${list.codeName}</td>
						<td><a id="a1" onclick="location.href='data/${list.equCd}'">${list.equSnum}</a></td>
						<td>
							<c:choose> 
								<c:when test="${empty list.equipmentHistoryVO.memName}">
									-
								</c:when>
								<c:when test="${list.equipmentHistoryVO.ehReturn eq 0}">
									-
								</c:when>
								<c:otherwise>
									${list.equipmentHistoryVO.memName}
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose> 
								<c:when test="${list.equipmentHistoryVO.ehReturn eq 0}">
									<span class="badge badge-primary">
										<a class="history-insert-btn" id="a2" onclick="location.href='../equipment/historyInsert?equCd=${list.equCd}'">대여가능</a>
									</span>
								</c:when>
								<c:when test="${list.equipmentHistoryVO.ehReturn eq 1 && memberVO.memCd eq list.equipmentHistoryVO.memCd}">
									<span class="badge badge-success">
										<input type="hidden" value="${list.equipmentHistoryVO.ehCd}">
										<input type="hidden" value="${memberVO.memCd}">
										<a class="history-delete-btn" id="a2" href="../equipment/historyDelete?ehCd=${list.equipmentHistoryVO.ehCd}&&memCd=${memberVO.memCd}" onclick='return confirm("해당 비품을 반납 하시겠습니까?");'>반납하기</a>
										<!-- <a class="history-delete-btn" id="a2" onclick="location.href='../equipment/historyDelete?ehCd=${list.equipmentHistoryVO.ehCd}&&memCd=${memberVO.memCd}'">반납하기</a> -->
									</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-secondary">대여불가</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="clearfix mb-20">
	<div class="pull-right">
		<a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal-1" type="button" style="display: block;">
			<button class="btn btn-outline-primary">비품등록</button>
		</a>
		<div class="modal fade" id="Medium-modal-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel">비품 등록</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<div class="pd-20 card-box mb-30">
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">시리얼넘버</label>
								<div class="col-sm-12 col-md-10">
									<input class="form-control" type="text" name="equSnum" placeholder="serial number">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">항목</label>
								<div class="col-sm-12 col-md-10">
									<select class="custom-select col-12" name="codeName">
										<option selected="">choose category</option>
										<c:forEach items="${categories}" var="category">
											<option value="${category.codeName}">${category.codeName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">구매날짜</label>
								<div class="col-sm-12 col-md-10">
									<input class="form-control date-picker" id="date-picker" placeholder="Click to select Date" type="text" name="equPdate" readonly style="background-color: white;">
								</div>
							</div>
							<div class="clearfix mb-20">
								<div class="pull-right">
									<input type="button" id="" class="btn btn-outline-primary equipment-insert-btn" value="비품등록"></button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal-2" type="button" style="display: block;">
			<button class="btn btn-outline-primary">항목관리</button>
		</a>
		<div class="modal fade" id="Medium-modal-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel">항목관리</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<c:forEach items="${categories}" var="category" varStatus="status">
								<tr role="row" class="">
									<td value="${category.codeCd}">
										${status.count}
									</td>
									<td class="td-1">
										<input class="form-control category" type="text" name="" value="${category.codeName}">
									</td>
									<td class="td-2">
										<button class="btn btn-outline-primary category-update-btn">수정</button>
										<button class="btn btn-outline-primary category-delete-btn">삭제</button>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td>-</td>
								<td><input type="text" placeholder="추가할 항목의 이름을 써주세요." class="form-control" value=""></td>
								<td><button class="btn btn-outline-primary category-insert-btn">항목 등록</button></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>

<script src="/vendors/scripts/equipment/list.js"></script>

