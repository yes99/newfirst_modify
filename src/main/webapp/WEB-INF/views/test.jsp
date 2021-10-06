<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>User List</title>

    <link rel="stylesheet" type="text/css" href="/css/ui.jqgrid.css">
    <script type="text/javascript"          src="/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"          src="/js/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript"          src="/js/jquery.jqGrid.min.js"></script>



</head>
<body>

<h2> TEST!!!! </h2>
<h2> TEST!!!! </h2>
<h2> TEST!!!! </h2>
<h2> TEST!!!! </h2>
<h2> TEST!!!! </h2>
<h2> TEST!!!! </h2>
<table id="list"></table>
<div id="jqGridPager"></div>
<script type="text/javascript">

              $(document).ready(function(){
                  $("#list").jqGrid({
                      url:"/board.do", //ajax 요청주소
                      datatype:"jsonp", //결과물 받을 데이터 타입

                      caption:"kkkkkklist",
                      mtype : "GET",
                      height:"auto",
                      rowNum:100,
                      sortname: 'id',
                      sortorder: "desc",
                      colNames:["id","date","title"],
                      colModel:[
                                {name:"id", index:"id", width : 70,  align:"center"},
                                {name:"date", index:"date",width : 70,  align:"center"},
                                {name:"title", index:"title", width : 70, align:"center"},
                               ],
                      viewrecords:true,
                      pager: "#jqGridPager"
                  });
              });
          </script>


</body>
</html>
