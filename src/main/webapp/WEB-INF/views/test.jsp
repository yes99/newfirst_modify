<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset=UTF-8>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>User List</title>

        <!--link rel="stylesheet" type="text/css" href="/css/ui.jqgrid.css">
        <script type="text/javascript"          src="/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript"          src="/js/i18n/grid.locale-kr.js"></script>
        <script type="text/javascript"          src="/js/jquery.jqGrid.min.js"></script-->

        <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.5/css/ui.jqgrid.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.5/js/jquery.jqgrid.min.js"></script>
        <!--> 버전이 다르니까 왜 안되는거지>????<-->

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
            $(document).ready(function() {
                $("#list").jqGrid({
                    url: "/board.do", //ajax 요청주소
                    datatype: "json", //결과물 받을 데이터 타입

                    caption: "kkkkkklist",
                    mtype: "GET",
                    height: "auto",
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    sortname: 'id',
                    sortorder: "desc",
                    colNames: ["id", "date", "title", "assign", "perform", "fail"],
                    colModel: [{
                        name: "id",
                        index: "id",
                        width: 70,
                        align: "center"
                    }, {
                        name: "date",
                        index: "date",
                        width: 70,
                        align: "center"
                    }, {
                        name: "title",
                        index: "title",
                        width: 70,
                        align: "center"
                    }, {
                        name: "assign",
                        index: "assign",
                        width: 70,
                        align: "center"
                    }, {
                        name: "perform",
                        index: "perform",
                        width: 70,
                        align: "center"
                    }, {
                        name: "fail",
                        index: "fail",
                        width: 70,
                        align: "center"
                    }, ],
                    jsonReader: {
                        repeatitems: false,
                        root: "rows",
                        page: "page",
                        total: "total",
                        records: "records"
                    },




                    viewrecords: true,
                    emptyrecords: "nononononononono",
                    loadtext: "잠시만 기다려 주세요", //로딩중 표시할 텍스트




                    pager: "#jqGridPager"
                });
            });
        </script>


    </body>

    </html>