<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/deng/include/includeboot.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>平台公告</title>
</head>
<body>
	<div class="panel panel-default">
		<fieldset>
			<legend>查询区域</legend>
			<form method="POST" id="searchForm" class="form-inline">
				<div class="form-group">
					<label>标题</label>
					<input type="text" class="form-control" name="xt_title" placeholder="请输入标题">
				</div>
				<div class="form-group">
					<label>状态</label>
					<select class="form-control" name="xt_state" placeholder="请选择状态">
						<option value="">请选择</option>
						<option value="0">初稿</option>
						<option value="1">审核中</option>
						<option value="2">审核通过</option>
						<option value="3">审核未通过</option>
					</select>
				</div>
			</form>
			<div class="form-group" style="margin-left: 35px;margin-top: 25px;">
				<button class="btn btn-primary" onclick="search('datatables')">
					<i class="glyphicon glyphicon-search"></i>&nbsp;检索
				</button>
				<button class="btn btn-default" onclick="resetAll();">重置</button>
			</div>
		</fieldset>
	</div>
	<div class="panel-body">
		<div class="btn-group pull-right" style="margin-right: 20px;">
			<jEhcPermissionTag:jehcBtnTag modules="addXtNotice">
				<button class="btn btn-default" onclick="toXtNoticeAdd()">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
				</button>
			</jEhcPermissionTag:jehcBtnTag>
			<jEhcPermissionTag:jehcBtnTag modules="updateXtNotice">
				<button class="btn btn-default" onclick="toXtNoticeUpdate()">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
				</button>
			</jEhcPermissionTag:jehcBtnTag>
			<jEhcPermissionTag:jehcBtnTag modules="delXtNotice">
				<button class="btn btn-default" onclick="delXtNotice()">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
				</button>
			</jEhcPermissionTag:jehcBtnTag>
			<button class="btn btn-default" onclick="search('datatables')">
				<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>刷新
			</button>
		</div>
		<table id="datatables" class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkall" /><span></span></label></th>
					<th>序号</th>
					<th>标题</th>
					<th>状态</th>
					<th>创建时间</th>
					<th>创建人</th>
					<th>操作</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript" src="../view/pc/xt-view/xt-notice/xt-notice-list.js"></script> 
</html>
