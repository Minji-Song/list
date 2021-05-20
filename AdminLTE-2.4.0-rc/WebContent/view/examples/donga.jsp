<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet" type="text/css" href="../css/DataTables/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/DataTables/jquery.dataTables.min.js"></script>
<script>
	var $hs = jQuery.noConflict();
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				var g = "https://api.rss2json.com/v1/api.json?rss_url=";
				var donga = "https://it.donga.com/feeds/rss/news/";
				var keys = "&api_key=bdl3lrsxdpnhqm6hhhler7hufnnecux4bwztd19b";
				var counts = "&count=200";
				
				$.ajax({
					url : g + donga + keys + counts, 
					dataType : "json",
					success : function(data) {
						$("#example tbody").empty();
						$.each(data.items, function(i, d) {
							var pubDate = d["pubDate"];
							var date = moment(pubDate).format('YYYY-MM-DD HH:mm:ss');
							var category = d["categories"];
							var thumbnail = d["thumbnail"];
							var title = d["title"];
							var author = d["author"];
							var link = d["link"];
							
							$("#example tbody").append(
									'<tr><td>' +date + '</td><td><img height="50" width="70" alt="" src="'+thumbnail+'"></td><td><a href="'+link+'" target="_blank">'
											+ title + '</a></td><td>'
											+ author + '</td></tr>');
						});
					},
					complete : function(data) {
						$hs('#example').DataTable({
							"language" : {
								"sEmptyTable" : "데이터가 없습니다",
								"sInfo" : "_START_ - _END_ / _TOTAL_",
								"sInfoEmpty" : "0 - 0 / 0",
								"sInfoFiltered" : "(총 _MAX_ 개)",
								"sInfoPostFix" : "",
								"sInfoThousands" : ",",
								"sLengthMenu" : "페이지당 줄수 _MENU_",
								"sLoadingRecords" : "읽는중...",
								"sProcessing" : "처리중...",
								"sSearch" : "검색:",
								"sZeroRecords" : "검색 결과가 없습니다",
								"oPaginate" : {
									"sFirst" : "처음",
									"sLast" : "마지막",
									"sNext" : "다음",
									"sPrevious" : "이전"
								},
								"oAria" : {
									"sSortAscending" : ": 오름차순 정렬",
									"sSortDescending" : ": 내림차순 정렬"
								}
							}
						});
					}
				});
			});
</script>

<style type="text/css">
/*기본 세팅*/
* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

body {
	font: 12px Margun Gothic, "맑은고딕", gulim, "굴림", sans-serif;
	color: #333;
	padding-top: 20px;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
	font-weight: normal;
}

a {
	color: #333;
	text-decoration: none;
	outline: none;
}

h1 {
	font-size: 2em;
	text-align: center;
	margin-bottom: 10px;
	color: #c00;
}
</style>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1 style="text-align: left;">동아일보 게시판</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">Blank page</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Title</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="content">
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>날짜</th>
									<th>썸네일</th>
									<th>제목</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tfoot>
								<hr>
							</tfoot>
							<tbody>

							</tbody>
						</table>

					</div>
					<!-- /.box-body -->
					<div class="box-footer">Footer</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
<%@ include file="../include/footer.jspf" %>