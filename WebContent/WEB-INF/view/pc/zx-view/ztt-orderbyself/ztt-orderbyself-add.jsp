<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/deng/include/includeboot.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>自制单表新增页面</title>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h4>创建自制单表</h4>
		</div>
		<form class="form-horizontal" id="defaultForm" method="post">
			<div class="form-group">
				<label class="col-lg-3 control-label">订单号id</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="32"  data-bv-notempty data-bv-notempty-message="请输入订单号id"  name="order_id" placeholder="请输入订单号id">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">技术主管id</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="32"  data-bv-notempty data-bv-notempty-message="请输入技术主管id"  name="techmanager_id" placeholder="请输入技术主管id">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">工艺资料</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="255"  name="attachment" placeholder="请输入工艺资料">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">提交日期</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="32"  name="update_date" placeholder="请输入提交日期">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">生产调度人员id</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="32"  data-bv-notempty data-bv-notempty-message="请输入生产调度人员id"  name="product_dispatch_id" placeholder="请输入生产调度人员id">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">生产调度提交日期</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="32"  name="product_update_date" placeholder="请输入生产调度提交日期">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label"></label>
				<div class="col-lg-6">
					<button type="button" class="btn green" onclick="addZttOrderbyself()">保存</button>
					<button type="button" class="btn default" onclick="goback()">返回</button>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="../view/pc/zx-view/ztt-orderbyself/ztt-orderbyself-add.js"></script> 
</html>
