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
</head>
<body>
<div id="frameContent" class="content-wrapper" style="margin-left:0px;">
    <section class="content-header">
        <h1>
            统计分析
            <small>市场价产品</small>
        </h1>
    </section>
    <section class="content">
        <div class="box box-primary">
            <div id="main" style="width: 100%; height:400px;"></div>
        </div>
    </section>
</div>
</body>

<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">

    $.get("/stat/getMakertData.do",function (getMakertData) {

        var titles = [];
        var values = [];

        for (var i = 0;i<getMakertData.length;i++){
            titles[i]=getMakertData[i].name;
            values[i]=getMakertData[i].value;
        }

        var myChart = echarts.init(document.getElementById('main'));


        var option = {
            angleAxis: {
                type: 'category',
                data: values,
                z: 10
            },
            radiusAxis: {
            },
            polar: {
            },
            series: [{
                type: 'bar',
                data: values,
                coordinateSystem: 'polar',
                name: 'A',
                stack: 'a'
            }, {
                type: 'bar',
                data: titles,
                coordinateSystem: 'polar',
                name: 'B',
                stack: 'a'
            }, {
                type: 'bar',
                data: values,
                coordinateSystem: 'polar',
                name: 'C',
                stack: 'a'
            }],
            legend: {
                show: true,
                data: ['A', 'B', 'C']
            }
        };

        myChart.setOption(option);
    })
    /*$.get("/stat/getMakertData.do", function (getMakertData) {

        var titles = [];
        var values = [];

        for (var i=0; i<getMakertData.length; i++){
            titles[i] = getMakertData[i].name;
            values[i] = getMakertData[i].value;
        }

        var myChart = echarts.init(document.getElementById('main'));

        var option = {
            xAxis: {
                type: 'category',
                data: titles,
                axisLabel: {
                    rotate:70
                }
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: values,
                type: 'bar'
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    })*/
</script>

</html>