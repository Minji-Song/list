<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="guestbook.model.Message"%>
<%@ page import="guestbook.service.MessageListView"%>
<%@ page import="guestbook.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String pageNumberStr = request.getParameter("page");
int pageNumber = 1;
if (pageNumberStr != null) {
	pageNumber = Integer.parseInt(pageNumberStr);
}

GetMessageListService messageListService = GetMessageListService.getInstance();
MessageListView viewData = messageListService.getMessageList(pageNumber);
%>
<c:set var="viewData" value="<%=viewData%>" />
<%@ include file="../include/header.jspf"%>

<script type="text/javascript"src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet" type="text/css"href="../css/DataTables/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

<script type="text/javascript"src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"src="../js/DataTables/jquery.dataTables.min.js"></script>

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
<script type="text/javascript">
function insertPopup( ) {	
	var wintype = "toolbar=no,width=250,height=100,top=150,left=150,directories=no,menubar=no,scrollbars=yes";
    window.open("", "popOpen", wintype);
	guest.target="popOpen";
	guest.action="writeMessage.jsp";
	guest.submit( );
}

</script>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        방명록
        <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">방명록</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Title</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
		<form method="post" name="guest">
			이름: <input type="text" name="guestName"> <br> 
			암호: <input ype="password" name="password"> <br> 
			메시지: <textarea name="message" cols="30" rows="3"></textarea><br>
		</form>
		<input type="button" onclick="insertPopup()" value="메시지 남기기" />
		<hr>
		

        <!-- /.box-body -->
        <div class="box-footer">
          		<c:if test="${viewData.isEmpty()}">
		등록된 메시지가 없습니다.
		</c:if>
		
		<c:if test="${!viewData.isEmpty()}">
			<table border="1">
				<c:forEach var="message" items="${viewData.messageList}">
					<tr>
						<td>메시지 번호: ${message.id} <br /> 손님 이름: ${message.guestName} <br />
							메시지: ${message.message} <br /> 
							<a href="confirmDeletion.jsp?messageId=${message.id}" onclick="window.open(this.href,'deletePopup','width=400,height=300'); return false;">[삭제하기]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		
			<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
				<a href="list.jsp?page=${pageNum}">[${pageNum}]</a>
			</c:forEach>
		
		</c:if>
        </div>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<%@ include file="../include/footer.jspf"%>