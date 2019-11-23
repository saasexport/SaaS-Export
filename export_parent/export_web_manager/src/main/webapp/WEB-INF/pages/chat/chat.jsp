<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 页面meta /-->
    <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-1.9.1.js"></script>
    <style type="text/css">
        a{
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
        button {
            cursor: pointer;
        }
    </style>
</head>

<body>
<div id="frameContent" class="content-wrapper" style="margin-left:0px;">


    <div id="message">消息列表(双击对应联系人进行聊天)</div>
    <div style="width: 100%;height: 100%;">
        <div style="width: 300px;height:400px;float: left;">
            <div id="msg-lists" style="width: 100%;height: 60%;border: 1px solid #000;">

            </div>
            <textarea id="msg-text" style="width: 100%;height: 40%;" placeholder="输入消息"></textarea>
        </div>
        <div id="contants-lists" style="width : 100px;height: 400px;border: 1px solid #000;margin-left: 20px;float: left;">

        </div>
    </div>
    <div style="margin-top: 420px;"><button onclick="sendMsgToUser()">发送消息</button></div>



</div>
</body>

</html>







<script type="text/javascript">
    var fromer="${sessionScope.loginUser.userName}";//发送者
    var sender="";//接收者
    var flag=true;//刚进入也面时
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        //TODO  优先级:高 这个页面是聊天室设置处,还没有编写完成
        websocket = new WebSocket("ws://localhost:8080/"+fromer);
    }
    else {
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
    }

    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        setMessageInnerHTML(event.data);
    }

    //连接关闭的回调方法
    websocket.onclose = function () {
        //setMessageInnerHTML("WebSocket连接关闭");
    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

    //将消息显示在网页上
    function setMessageInnerHTML(data) {
        var dataObj=eval("("+data+")");//转换为json对象
        if(dataObj.isInit=="1"){
            var contanList=dataObj.contacts;
            if(contanList.length>1){
                var strs="";
                for(var i=0;i<contanList.length;i++){
                    var contact=contanList[i];
                    if(contact!=fromer){
                        strs+="<a ondblclick=getToSend('"+contact+"')>"+contact+"</a> <span>在线</span>";
                    }
                }
                $("#contants-lists").html(strs);
            }
        }else{
            //接受别人发送的消息
            var msg=dataObj.msg;
            var time=dataObj.time;
            sender=dataObj.fromer;
            $("#message").html("正在与 <a>"+sender+"</a> 进行聊天");
            $("#msg-lists").append("<div >"+sender+": "+time+"</div><div ><pre>"+msg+"</pre></div>");
        }

    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }


    function getToSend(toUser){
        $("#message").html("正在与 <a>"+toUser+"</a> 进行聊天");
        sender=toUser;
    }

    //消息发送
    function sendMsgToUser(){
        if(sender=="" || sender==null){
            alert("请先指定发送对象");
            return false;
        }
        var msg=$("#msg-text").val().trim();
        if(msg!="" && msg!=null){
            $("#msg-text").val("")
        }else{
            alert("消息不能为空");
            return false;
        }
        var mydate = new Date();
        var t=mydate.toLocaleString();
        var str1 = {"fromer": fromer, "msg": msg,"sender":sender };
        var message=JSON.stringify(str1);
        $("#msg-lists").append("<div style='text-align:right'>我: "+t+" </div><div style='text-align:right'><pre>"+msg+"</pre></div>");
        websocket.send(message);
    }
</script>