<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/deng/include/includeboot.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>6S编辑页面</title>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h4>编辑6S信息</h4>
		</div>
		<form class="form-horizontal" id="defaultForm" method="post">
			<input type="hidden" id="id" name='id' value="${zxSixS.id}"/>
			<input type="hidden" id="status" name='status' value="${zxSixS.status}"/>
			<input type="hidden" id="user_id" name='user_id' value="${zxSixS.user_id}"/>
			<input type="hidden" id="state" name='state' value="${zxSixS.state}"/>
			<input type="hidden" id="create_date" name='create_date' value="${zxSixS.create_date}"/>
			<div class="form-group">
				<label class="col-lg-3 control-label">标题</label>
				<div class="col-lg-6">
					<textarea class="form-control" cols="100" style="height:200px" maxlength="100" data-bv-notempty data-bv-notempty-message="请输入标题"  name="title" placeholder="请输入标题">${zxSixS.title }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">检查日期</label>
				<div class="col-lg-3">
					<input class="form_date form-control" readonly="readonly" id="check_date" name="check_date" value="${zxSixS.check_date}" placeholder="请选择检查日期">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label"></label>
				<div class="col-lg-6">
					<button type="button" class="btn green" onclick="updateZxSixS()">保存</button>
					<button type="button" class="btn default" onclick="goback()">返回</button>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="../view/pc/zx-view/zx-six-s/zx-six-s-update.js"></script> 
</html>
