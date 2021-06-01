<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			게시글 쓰기<small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">게시글 쓰기</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Default box -->
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">게시글 쓰기</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse" data-toggle="tooltip" title="Collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button type="button" class="btn btn-box-tool" data-widget="remove"
						data-toggle="tooltip" title="Remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
				<table border="1" width="100%">
					<tr>
						<td>번호</td>
						<td>${articleData.article.number}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${articleData.article.writer.name}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><c:out value='${articleData.article.title}' /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><u:pre value='${articleData.content}' /></td>
					</tr>
					<tr>
						<td colspan="2"><c:set var="pageNo"
								value="${empty param.pageNo ? '1' : param.pageNo}" /> <a
							href="boardlist.do?pageNo=${pageNo}">[목록]</a> <c:if
								test="${authUser.id == articleData.article.writer.id}">
								<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
								<a href="delete.do?no=${articleData.article.number}">[게시글삭제]</a>
							</c:if></td>
					</tr>
				</table>
			</div>
			<!-- /.box-body -->
			<div class="box-footer"></div>
			<!-- /.box-footer-->
		</div>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@ include file="../include/footer.jspf"%>
