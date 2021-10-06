<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
     <link rel="stylesheet" type="text/css" href="/include/css/ui-lightness/jquery-ui-1.8.16.custom.css" />
     <link rel="stylesheet" type="text/css" href="/include/css/ui.jqgrid.css" />
<!-- css 파일과 js파일을 포함시키는 순서가 중요하다! -->

    <!-- jqGrid의 표준 스타일 임포트-->
    <link rel="stylesheet" href="resources/include/css/ui.jqgrid.css" type="text/css">
    <!-- jQuery UI의 표준 스타일 임포트-->
    <link rel="stylesheet" href="resources/jquery-ui-1.11.4.custom/jquery-ui.css" type="text/css">
    <!-- jQuery 라이브러리 임포트-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <!-- jQuery UI 라이브러리 임포트-->
    <script src="resources/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>

    <!-- jqGrid 라이브러리 임포트-->
    <script src="resources/js/i18n/grid.locale-kr.js"></script>
    <script src="resources/js/jquery.jqGrid.min.js"></script>
	<script type="text/javascript">

	$(function(){
		$('#pagination').html('<p>안녕<p>');

		$("#list2").jqGrid({
		    url : 'jdbc:mariadb://localhost:3306/practice',
		    datatype : "json",
		    colNames : ['Inv No', 'Date', 'Client', 'Amount', 'Tax'],
		    colModel:[
		           {name:'id', index:'id', width:55},
		           {name:'invdate', index:'invdate', width:90},
		           {name:'name', index:'name asc, invdate', width:100},
		           {name:'amount', index:'amount', width:80, align:"right"},
		           {name:'txt', index:'tax', width:80, align:"right"}
		    ],
		    rowNum:10,
		    rowList:[10,20,30],
		    pager:'#pager2',
		    sortname:'id',
		    viewrecords: true,
		    sortorder:"desc",
		    caption:"JSON Example",
		    jsonReader: {
		         repeatitems:false
		    }
		});

		$("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});


	});//function()
	</script>

</head>


	<table id="list2"></table>
	<div id="pager2"></div>







<title>List</title>
<link rel="stylesheet" type="text/css" href="test.css"/>
<script src="/js/alert.js" type = text/javascript></script>

</head>
<body>

<header>
    <div class="row">
        <div class="bg-dark text-white p-5">
            <h1>교육일지 레이아웃 수정</h1>
        </div>
    </div>
</header>


<div class="container">
    <table class="table table-hover">
        <h2>
            게시글 목록
        </h2>
        <tr>
            <th>No</th>
            <th>date</th>
            <th>title</th>
        </tr>
          <c:forEach var="l" items="${tmp}">
              <tr onclick="location.href='/detail/${l.id}'"> <!-- 이 부분 수정! -->
                  <td>${l.id}</td>
                  <td>${l.date}</td>
                  <td>${l.title}</td>
              </tr>
          </c:forEach>
    </table>
</div>

<div class="tableWrap">
     <table id="mainGrid"></table>
     <div id="pager"></div>
</div>





<nav aria-label="...">
    <ul class="pagination justify-content-center">
        <c:if test="${paging.prev}">
            <span><a class="page-link" href='<c:url value="/tmp?page=${paging.startPage-1}"/>'>이전</a></span>
        </c:if>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
            <span><a class="page-link" href='<c:url value="/tmp?page=${num}"/>'>${num}</a></span>
        </c:forEach>
        <c:if test="${paging.next && paging.endPage>0}">
            <span><a class="page-link" href='<c:url value="/tmp?page=${paging.endPage+1}"/>'>다음</a></span>
        </c:if>
        <form class="navbar-form pull-right">
                <input type="text" class="span2">
                <button class="btn btn-primary" onclick="location.href='/tmp/${detail.id}'">검색</button> <!-- 검색 한 내용 -->
        </form>
    </ul>

    <br>

</nav>



<div class="container">
    <form class = "container" action="/insertProc"  method="post">
        <div class = "mb-3">
            <label class="form-label" id = "tdate"> <h3>날짜 </h3></label>
            <div style="color:red; display:none;" id = "hdate">날짜를 입력해주세요  </div>
            <input type="date" id = "date" name="date" onmouseup ="datestrcheck()">
        </div>
        <div class = "mb-3">
            <label class="form-label" id = "ttitle"> <h3>제목 </h3></label>
            <div style="color:red;display:none;" id = "htitle">제목을 입력하세요</div>
            <input type="text input-lg" class="form-control"  id = "title" name="title" onkeyup="titlestrcheck()">

        </div>
        <div class = "mb-3">
            <label class="form-label" id = "tassign"> <h3>수행과제 </h3></label>
            <textarea class="form-control"  rows="10" id = "assign" name="assign" onkeyup="assignstrcheck()"></textarea>
        </div>
        <div class = "mb-3">
            <label class="form-label" id = "tperform"> <h3>수행과정</h3> </label>
            <textarea class="form-control"  rows="10" id = "perform" name="perform" onkeyup="performstrcheck()"></textarea>
        </div>
        <div class = "mb-3">
            <label class="form-label" id = "tfail"> <h3>실패 사례</h3> </label>
            <textarea class="form-control"  rows="10" id = "fail" name="fail" onkeyup="failstrcheck()"></textarea>
        </div>

        <button type="submit" class="btn btn-primary"> 제출</button>
        <button type="submit" class="btn btn-primary" onclick="alerttest()"> test</button>

    </form>

</div>


<div class = "mb-5 container-fluid">
    <hr>
    <p>@ cloudStudying <a href="#"> ojtojtojt  </a> <a href="#"> 레이아웃 푸터 연습</a></p>
</div>
<script type="text/javascript" src="test.js"></script>
<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>



</html>
