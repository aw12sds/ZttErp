<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/deng/include/include.jsp"%>
<%@ include file="/deng/include/includeboot.jsp"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${syspath}/deng/source/plugins/other/bztree/css/bootstrapStyle/bootstrapStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${syspath}/deng/source/plugins/other/bztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${syspath}/deng/source/plugins/other/bztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript"
	src="${syspath}/deng/source/plugins/other/bztree/js/jquery.ztree.exedit.js"></script>
</head>
</head>
<body>
	<div class="panel panel-default padding-10 no-margin">

		<div class="container-fluid">
			<div class="row col-md-8 col-md-offset-2">
				<form method="POST" id="searchForm" class="form-inline">
					<div class="form-group">
						<input class="form-control" type="hidden" maxlength="32"
							id="order_id" name="order_id"
							value="${zttOrderCheckHistory.order_id }"> <input
							class="form-control" type="hidden" maxlength="32" id="state"
							name="state" value="0">
					</div>
					<div class="btn-group pull-right" style="margin-right: 20px;">
						<button class="btn btn-default" onclick="toZttPurchaseAdd()">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>申请审批
						</button>
					</div>
					<table id="datatables"
						class="table table-bordered table-striped table-hover">
						<thead>
							<tr class="text-bold">
								<th><label
									class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input
										type="checkbox" class="checkall" /><span></span></label></th>
								<th class="col-md-1 text-center">序号</th>
								<th class="col-md-1 text-center">状态</th>
								<th class="col-md-2 text-center">时间</th>
								<th class="col-md-1 text-center">报告简要</th>
								<th class="col-md-1 text-center">操作</th>
							</tr>
						</thead>
						<tfoot>
						</tfoot>
					</table>
				</form>
			</div>

		</div>


	</div>

</body>
<script type="text/javascript"
	src="../view/pc/zx-view/ztt-purchase/zttpurchase_checkhistory.js"></script>
</html>
