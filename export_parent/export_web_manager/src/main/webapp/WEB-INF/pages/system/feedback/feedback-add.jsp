<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../base.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数据 - AdminLTE2定制版</title>
</head>
<body>
<div id="frameContent" class="content-wrapper" style="margin-left:0px;">
    <section class="content-header">
        <h1>
            系统管理
            <small>反馈管理</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
        </ol>
    </section>
    <section class="content">

        <!--订单信息-->
        <div class="panel panel-default">
            <div class="panel-heading">意见反馈</div>
            <form id="editForm" action="/system/feedback/add.do" method="post" >
                      <input type="hidden" name="inputBy" value="${sessionScope.loginUser.userName}">

<%--                <input type="hidden" name="companyId" value="${company.id}">--%>
<%--                <input type="hidden" name="companyName" id="companyName" value="${company.name}">--%>
                <div class="row data-type" style="margin: 0px">
                    <div class="col-md-2 title">反馈标题</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" placeholder="反馈标题" name="title" value="">
                    </div>


                    <div class="col-md-2 title">联系电话</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" placeholder="联系电话" name="tel" value="">
                    </div>
                    <div class="col-md-2 title">反馈类型</div>
                    <div class="col-md-4 data">
                        <select class="form-control" name="classType">

                            <option value="">请选择</option>
                            <option value="1">管理</option>
                            <option value="2">安全</option>
                            <option value="3">建议</option>
                            <option value="4">其他</option>
                        </select>
                    </div>
                    <div class="col-md-2 title">是否公开</div>
                    <div class="col-md-4 data">
                        <select class="form-control"  name="isShare">
                            <option value="">请选择</option>
                            <option value="1">公开</option>
                            <option value="0">不公开</option>
                        </select>
                    </div>

                    <div class="col-md-2 title rowHeight2x">反馈内容</div>
                    <div class="col-md-4 data rowHeight2x">
                        <textarea class="form-control" rows="3" name="content"></textarea>
                    </div>

<%--                    <div class="col-md-2 title rowHeight2x">要求</div>--%>
<%--                    <div class="col-md-4 data  rowHeight2x">--%>
<%--                        <textarea class="form-control" rows="3" placeholder="要求" name="productRequest">${.productRequest}</textarea>--%>
<%--                    </div>--%>
                </div>
            </form>
        </div>
        <!--订单信息/-->

        <!--工具栏-->
        <div class="box-tools text-center">
            <button type="button" onclick='document.getElementById("editForm").submit()' class="btn bg-maroon">保存</button>
            <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
        </div>
    </section>
</div>
</body>

</html>