<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/deng/include/includeboot.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>办公用品管理编辑页面</title>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h4>编辑办公用品管理</h4>
		</div>
		<form class="form-horizontal" id="defaultForm" method="post">
			<div class="form-group" style="display:none;">
				<label class="col-lg-3 control-label">办公用品ID</label>
				<div class="col-lg-6">
					<input class="form-control" type="hidden" name="office_id"  placeholder="请输入办公用品ID" value="${zxOffice.office_id }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">办公用品名称</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="255"  name="name" placeholder="请输入办公用品名称" value="${zxOffice.name }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">办公用品编号</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="100"  name="num" placeholder="请输入办公用品编号" value="${zxOffice.num }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">分类ID</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="255"  name="classify_id" placeholder="请输入分类ID" value="${zxOffice.classify_id }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">度量衡，单位</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="10"  name="unit" placeholder="请输入度量衡，单位" value="${zxOffice.unit }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">状态</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="1"  data-bv-notempty data-bv-notempty-message="请输入状态"  name="status" placeholder="请输入状态" value="${zxOffice.status }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">创建时间</label>
				<div class="col-lg-6">
					<input class="form_datetime form-control" name="create_date"  placeholder="请选择时间" value="${zxOffice.create_date }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">规格型号</label>
				<div class="col-lg-6">
					<input class="form-control" type="text" maxlength="255"  name="standard" placeholder="请输入规格型号" value="${zxOffice.standard }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label"></label>
				<div class="col-lg-6">
					<button type="button" class="btn green" onclick="updateZxOffice()">保存</button>
					<button type="button" class="btn default" onclick="goback()">返回</button>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="../view/pc/zx-view/zx-office/zx-office-update.js"></script> 
</html>
