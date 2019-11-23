<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../base.jsp" %>
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
    <!-- 内容头部 -->
    <section class="content-header">
        <h1>
            财务管理
            <small>发票管理</small>
        </h1>
    </section>
    <!-- 内容头部 /-->

    <!-- 正文区域 -->
    <section class="content">

        <!--订单信息-->
        <div class="panel panel-default">
            <div class="panel-heading">发票查看</div>
            <div class="row data-type" style="margin: 0px">
                <div class="col-md-2 title">发票号</div>
                <div class="col-md-4 data">
                    ${invoice.invoiceId}
                </div>

                <div class="row data-type" style="margin: 0px">
                    <div class="col-md-2 title">订单号</div>
                    <div class="col-md-4 data">
                        ${invoice.scNo}
                    </div>

                    <div class="row data-type" style="margin: 0px">
                        <div class="col-md-2 title">提单号</div>
                        <div class="col-md-4 data">
                            ${invoice.blNo}
                        </div>

                        <div class="col-md-2 title">创建人</div>
                        <div class="col-md-4 data">
                            ${invoice.createBy}
                        </div>

                        <div class="col-md-2 title">创建部门</div>
                        <div class="col-md-4 data">
                            ${invoice.createDept}
                        </div>

                        <div class="col-md-2 title">总金额</div>
                        <div class="col-md-4 data">
                            ${invoice.amount}
                        </div>

                        <div class="col-md-2 title">制单日期</div>
                        <div class="col-md-4 data">
                            <fmt:formatDate value="${invoice.createTime}" pattern="yyyy-MM-dd"/>
                        </div>


                        <div class="col-md-2 title">状态</div>
                        <div class="col-md-4 data">
                            ${finance.state == "0"?"草稿":finance.state =="1"?"未上报":"已上报"}
                        </div>
                    </div>
                </div>
                <!--订单信息/-->

                <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
                </div>
                <!--工具栏/-->
            </div>
        </div>
    </section>
    <!-- 正文区域 /-->

</div>
<!-- 内容区域 /-->
</body>
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<link rel="stylesheet" href="../../css/style.css">
<script>
    $('#signingDate').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    });
    $('#deliveryPeriod').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    });
</script>
</html>