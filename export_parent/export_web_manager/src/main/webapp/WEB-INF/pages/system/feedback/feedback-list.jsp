<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../../base.jsp"%>

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
</head>
<script>
    function deleteById() {
        var id = getCheckId()
        if (id) {
            if (confirm("你确认要删除此条记录吗？")) {
                location.href = "/system/feedback/delete.do?id=" + id;
            }
        } else {
            alert("请勾选待处理的记录，且每次只能勾选一个")
        }
    }
</script>
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
    <!-- 内容头部 /-->

    <!-- 正文区域 -->
    <section class="content">

        <!-- .box-body -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">反馈列表</h3>
            </div>

            <div class="box-body">

                <!-- 数据表格 -->
                <div class="table-box">

                    <!--工具栏-->
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            <div class="btn-group">
                                <c:if test="${loginUser.degree!=0}">
                                    <button type="button" class="btn btn-default" title="新建"
                                            onclick='location.href="/system/feedback/toAdd.do"'><i
                                            class="fa fa-file-o"></i>
                                        新建
                                    </button>
                                    <button type="button" class="btn btn-default" title="删除" onclick='deleteById()'><i
                                            class="fa fa-trash-o"></i> 删除
                                    </button>
                                </c:if>

                                <button type="button" class="btn btn-default" title="刷新"
                                        onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="box-tools pull-right">
                        <div class="has-feedback">
                            <input type="text" class="form-control input-sm" placeholder="搜索">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </div>
                    <!--工具栏/-->

                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th class="" style="padding-right:0px;">

                            </th>
                            <th class="sorting">反馈时间</th>
                            <th class="sorting">反馈类型</th>
                            <th class="sorting">反馈主题</th>
                            <th class="sorting">反馈人</th>
                            <th class="sorting">反馈内容</th>
                            <th class="sorting">回复状态</th>

                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.list}" var="item">
                            <tr>
                                <td><input name="ids" value="${item.feedbackId}" type="checkbox"></td>
                                <%--<td>

                                        ${item.inputTime}
                                </td>--%>
                                <td><fmt:formatDate  value="${item.inputTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>


                                <c:if test="${item.classType==1}">
                                    <td>管理问题</td>
                                </c:if>
                                <c:if test="${item.classType==2}">
                                    <td>安全问题</td>
                                </c:if>
                                <c:if test="${item.classType==2}">
                                    <td>建议</td>
                                </c:if>
                                <c:if test="${item.classType==2}">
                                    <td>其他问题</td>
                                </c:if>
                                <td>${item.title}</td>
                                <td>${item.inputBy}</td>
                                <td>${item.content}</td>
                                <td>${item.state ==0?'未审核':'已审核'}</td>


                                <th class="text-center">

                                    <c:if test="${loginUser.degree!=0}">
                                        <button type="button" class="btn bg-olive btn-xs"
                                                onclick='location.href="/system/feedback/toView.do?id=${item.feedbackId}"'>
                                            查看
                                        </button>
                                    </c:if>
                                    <c:if test="${loginUser.degree==0}">
                                        <button type="button" class="btn bg-olive btn-xs"
                                                onclick='location.href="/system/feedback/toProcess.do?id=${item.feedbackId}"'>
                                            处理
                                        </button>
                                    </c:if>
                                </th>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


            <div class="box-footer">
                <jsp:include page="../../common/page.jsp">
                    <jsp:param value="/system/feedback/list.do" name="pageUrl"/>
                </jsp:include>
            </div>
            <!-- /.box-footer-->

        </div>
    </section>
</div>
</body>
<script>
    $('#inputTime').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
    });
</script>
</html>