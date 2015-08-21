<%@ page language="java" contentType="text/html" %>
<html>
<head>
<script>
function startTime() {
    var today=new Date();
    var day=today.getDay();
    var mon=today.getMonth();
    var year=today.getFullYear();
    var h=today.getHours();
    var m=today.getMinutes();
    var s=today.getSeconds();
    day=checkTime(day);
    mon=checkTime(mon);
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML = mon+" "+day+", "+year+"\n"+h+":"+m+":"+s;
    var t = setTimeout(function(){startTime()},500);
}

function checkTime(i) {
    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>
</head>
 <body onload="startTime()">

<div id="txt"></div>

</body>
</html>