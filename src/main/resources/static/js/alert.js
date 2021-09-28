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
    var target = document.getElementById("ttitle");
    var targetTop = target.getBoundingClientRect().top;
    var abTop = window.pageYOffset + target.getBoundingClientRect().top;


    console.log(hdate, htitle);
    console.log(date, title, assign, perform, fail);
    //console.log(relativeTop)
    alert("stop pelase");
    /*if(!date)
    {
        //hhdate = "visible";
        document.getElementById("hdate").style.display = "block";
        alert("stop");
        event.preventDefault();
    }*/

    if(title.length == 0)
    {
        document.getElementById("title").focus();
        document.getElementById("htitle").style.display = "block";
        //alert("stop length is 0");


        event.preventDefault();
    }
/*



    if(!assign ||!perform ||!fail )
        {

            event.preventDefault();

            return 0
        }
        else{
            alert("full");
        }
*/


    console.log("hihihihihihihihihi");
    window.scrollTo(0 ,abTop);
    //ScrollIntoView 랑 focus랑 같이 쓸수 없음 왜

}