<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>User List</title>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.5/css/ui.jqgrid.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.5/js/jquery.jqgrid.min.js"></script>



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
                      url:"http://jsonplaceholder.typicode.com/posts", //ajax 요청주소
                      datatype:"json", //결과물 받을 데이터 타입

                      caption:"kkkkkklist",
                      mtype : "GET",
                      height:"auto",
                      rowNum:10,
                      rowList:[10,20,30],
                      sortname: 'id',
                      sortorder: "desc",
                      colNames:["userId","date","title", "body" ],
                      colModel:[
                                {name:"userId", index:"d", width : 70,  align:"center"},
                                {name:"id", index:"dd",width : 70,  align:"center"},
                                {name:"title", index:"ddd", width : 70, align:"center"},
                                {name:"body", index:"ddddd", width : 70, align:"center"}
                                
                               ],
                      jsonReader : {
                      repeatitems : false,
                      root : "rows",
                      page: "page",
                      total: "total",
                      records: "records"
                      },




                      viewrecords:true,
                      emptyrecords: "nono",
                      loadtext : "잠시만 기다려 주세요",						//로딩중 표시할 텍스트




                      pager: "#jqGridPager"
                  });
              });
          </script>


</body>
</html>
