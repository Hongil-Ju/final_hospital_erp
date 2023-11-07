<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="/vendors/styles/equipment/list.css">
<link rel="stylesheet" href="/vendors/styles/surgery/list.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>수술실/비품관리</h1>
	<br>
<h2>수술실 예약</h2>
<div class="clearfix mb-20">
	<div class="pull-right">
		<input type="button" class="btn btn-outline-primary" value="나의 예약" onclick="location.href='scheduleList'">
	</div>
</div>
<div class="pd-20 card-box mb-30">
	<table class="table hover multiple-select-row data-table-export nowrap datatable2 no-footer dtr-inline" id="DataTables_Table_2" role="grid">
		<thead>
			<tr role="row">
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="no: activate to sort column ascending">no</th>
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="항목: activate to sort column ascending">호수</th>
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="시리얼 넘버: activate to sort column ascending">운영 시간</th>
				<th class="sorting" tabindex="0" aria-controls="DataTables_Table_2" rowspan="1" colspan="1" aria-label="대여자: activate to sort column ascending">예약하기</th>
		</thead>
		<tbody>
			<c:forEach items="${allSurgeries}" var="list" varStatus="status">
				<tr role="row" class="">
					<td>${status.count}</td>
					<td>${list.surNum}</td>
					<td>00:00 ~ 24:00</td>
					<td><span class="badge badge-primary"><a onclick="location.href='scheduleInsert?surCd=${list.surCd}'" id="a2">예약하기</a></span></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
		<br>
</div>
<div class="clearfix mb-20">
	<div class="pull-right">
		<a href="#" class="btn-block" data-toggle="modal" data-target="#Medium-modal" type="button">
			<button class="btn btn-outline-primary">수술실 관리</button>
		</a>
		<div class="modal fade" id="Medium-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel">수술실 관리</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered">
							<tbody>
								<c:forEach items="${allSurgeries}" var="list">
									<tr role="row" class="">
										<td>
											<input type="hidden" value="${list.surCd}">
											<input class="form-control" type="text" value="${list.surNum}">
										</td>
										<td>
											<button class="btn btn-outline-primary surgery-update-btn">수정</button>
											<button class="btn btn-outline-primary surgery-delete-btn">삭제</button>
										</td>
									</tr>
								</c:forEach>
								<tr>
									<th scope="row">
										<input type="text" placeholder="호수 입력" class="form-control" style="width: 120px;">
									</th>
									<td>
										<button class="btn btn-outline-primary surgery-insert-btn">수술실 등록</button>
									</td>
								</tr>
							</tbody>
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


<script src="/src/plugins/switchery/switchery.min.js"></script>
<script src="/vendors/scripts/surgery/list.js"></script>