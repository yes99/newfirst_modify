
var dateflag = 0;
var titleflag = 0;
var assignflag = 0;
var performflag = 0;
var failflag = 0;

function alerttest(){
/*
    var date = '<%=date%>';
    var title = '<%=title%>';
    var assign = '<%=assign%>';
    var perform = '<%=perform%>';
    var fail = '<%=fail%>';
*/

    var date = document.getElementById('date').value;
    var title = document.getElementById('title').value;
    var assign = document.getElementById('assign').value;
    var perform = document.getElementById('perform').value;
    var fail = document.getElementById('fail').value;

    //var hdate = document.getElementById('hdate').innerHTML;
    //var htitle = document.getElementById('htitle').innerHTML;
    //var hhdate = document.getElementById('hdate').innerHTML.style.visibility;
    //var displayhdate = hdate.style.display;
/*
    const target = document.getElementById('title'); // 요소의 id 값이 target이라 가정
    const clientRect = target.getBoundingClientRect(); // DomRect 구하기 (각종 좌표값이 들어있는 객체)
    const relativeTop = clientRect.top; // Viewport의 시작지점을 기준으로한 상대좌표 Y 값.
*/




    console.log(hdate, htitle);
    console.log(date, title, assign, perform, fail);
    //console.log(relativeTop)
    alert("stop pelase");

/*
    fail, perfrom, assign 은 appendtag 형식으로 나타나게 함
*/
    if(fail.length == 0)
    {
        document.getElementById("assign").focus();
        var warnletter = $('<p style="color:red;" id = "hfail">수행 과제를 입력해 주세요</p>');
        $('#tfail').append(warnletter);
        failflag = 1;
        var target = document.getElementById("tfail");
        event.preventDefault();
    }

    if(perform.length == 0)
    {
        document.getElementById("assign").focus();
        var warnletter = $('<p style="color:red; display:block;" id = "hperform">수행 과정를 입력해 주세요</p>');
        $('#tperform').append(warnletter);
        performflag = 1;
        var target = document.getElementById("tperform");
        event.preventDefault();
    }
    if(assign.length == 0)
    {
        document.getElementById("assign").focus();
        var warnletter = $('<div style="color:red; display:block;" id = "hassign">실패 사례를 입력해 주세요</div>');
        $('#tassign').append(warnletter);
        assignflag = 1;
        var target = document.getElementById("tassign");
        event.preventDefault();
    }

/*
   date, title 은 히든 처리를 해서 보이지 않는것을 특정조건에서 보이게 한다 라는 식으로 함.
*/

    if(title.length == 0)
    {
        document.getElementById("title").focus();
        document.getElementById("htitle").style.display = "block";
        //alert("stop length is 0");
        titleflag = 1;
        var target = document.getElementById("ttitle");
        event.preventDefault();
    }

    if(date.length == 0)
    {
        document.getElementById("date").focus();
        document.getElementById("hdate").style.display = "block";
        dateflag = 1;
        var target = document.getElementById("tdate");
        event.preventDefault();
    }

    var targetTop = target.getBoundingClientRect().top;
    var abTop = window.pageYOffset + target.getBoundingClientRect().top;
    console.log("hihihihihihihihihi", abTop);
    console.log("check", dateflag, titleflag, assignflag, performflag, failflag);

    window.scrollTo(0 ,abTop);
    //ScrollIntoView 랑 focus랑 같이 쓸수 없음 왜

}

/*
    처음에는 strcheck로 한번에 다 해결하려고 했는데, 불안정 해서 하나만 키업으로 입력을 해도
    주의문이 한꺼번에 다 없어지는 현상이 발생함.
    각각 다른 함수로 만들어서 따로 적용하니 해결됨
*/

function failstrcheck(){
   var fail = document.getElementById('fail').value;
   if(failflag == 1)
    {
         document.getElementById("hfail").style.display = "none";
         failflag = 0;
    }
}
function performstrcheck(){
    var perform = document.getElementById('perform').value;
    if(performflag == 1)
    {
         document.getElementById("hperform").style.display = "none";
         performflag = 0;
    }
}
function assignstrcheck(){
    var assign = document.getElementById('assign').value;

    if(assignflag == 1)
    {
         document.getElementById("hassign").style.display = "none";
         assignflag = 0;
    }
}
function titlestrcheck(){

    var title = document.getElementById('title').value;
    if(titleflag == 1)
    {
         document.getElementById("htitle").style.display = "none";
         titleflag = 0;
    }
}
function datestrcheck(){
    var date = document.getElementById('date').value;
    if(dateflag == 1)
    {
         document.getElementById("hdate").style.display = "none";
         dateflag = 0;
    }
}



function strcheck(){



}