<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/deng/include/include.jsp"%>
<%@ include file="/deng/include/includeboot.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
td
{
text-align:center;
}
</style>
</head>
<script type="text/javascript">
    var id = "${taskData.businessKey }"; 
</script>
<body>
	<div class="panel panel-default padding-10 no-margin">
		<fieldset id="printAll${zxCarApply.id }">
			<div class="container-fluid  col-md-10 col-md-offset-1">
				<div class="row">
					<form class="form-horizontal" id="defaultForm" method="post">
						<table class="table table-bordered">
							<caption class="text-center h3 no-margin bold" id="caption">业务人员下单表</caption>
							<input class="form-control" type="hidden" maxlength="255"  name="state" id="state">
							<input class="form-control" type="hidden" maxlength="255"  name="order_id" id="order_id">
							<tbody>
								<tr>
									<td class="col-md-2 text-center">申&ensp;请&ensp;人</td>
									<td class="col-md-2">${applyUser.xt_userinfo_realName }</td>
									<td class="col-md-2 text-center">部&emsp;&emsp;门</td>
									<td class="col-md-2">${applyUser.xt_departinfo_name }</td>
									<td class="col-md-2 text-center">申请日期</td>
									<td class="col-md-2"><label id="zttordertime" /></td>
								</tr>
								<tr>
								<td class="text-center">工令号</td>
									<td><label id="product_order_number" /></td>
									<td class="text-center">订单号/申请号</td>
									<td><label id="order_number" /></td>
									<td class="text-center">合同号</td>
									<td colspan="3"><label id="contract_number" /></td>
								</tr>
								<tr>
									<td class="text-center">客户</td>
									<td colspan="2"><label id="client" /></td>
									<td class="text-center">联系人</td>
									<td colspan="2"><label id="linkman" /></td>
								</tr>
								<tr>
									<td class="text-center">产品名称</td>
									<td colspan="2"><label id="product_name" /></td>
									<td class="text-center">规格</td>
									<td colspan="2"><label id="stardard" /></td>
								</tr>
								<tr>
									<td>单位</td>
									<td><label id="unit" /></td>
									<td>数量</td>
									<td><label id="amount" /></td>
									<td>单价</td>
									<td><label id="single_price" /></td>

								</tr>
								<tr>
									<td class="text-center">总价</td>
									<td colspan="2"><label id="sum_price" /></td>
									<td class="text-center">交货日期</td>
									<td colspan="2"><label id="end_data" /></td>


								</tr>
								<tr>
									<td class="text-center">附件</td>
									<td colspan="2">
									<label id="attachment" style="display: none;"></label>
									<button class="btn btn-primary"
											data-toggle="button"
											onclick="downloadattachment('${taskData.businessKey }')">查看附件</button>
											<input class="form-control" type="hidden" maxlength="255"  name="attachment" id="attachment">
											</td>
											<td class="text-center">查看图纸</td>
									<td colspan="2"><button class="btn btn-primary"
											data-toggle="button"
											onclick="downloadattachmenttech('${taskData.businessKey }')">查看附件</button>
											<input class="form-control" type="hidden" maxlength="255"  name="techmanager_attachment" id="techmanager_attachment">
											</td>
											
								</tr>
								<tr>
									<td class="text-center">机械加工工艺过程</td>
									<td colspan="2"><button class="btn btn-primary"
											data-toggle="button"
											onclick="progressupload()">查看</button>
											<label id="id"></label>
											</td>
									<td class="text-center" id="selfcheckreport">自检报告</td>
									<td colspan="2" id="selfcheckreport1"><button class="btn btn-primary"
											data-toggle="button"
											onclick="uploadself_checkattachment()">上传</button>
											<input class="form-control" type="hidden" maxlength="255"  name="producter_selfcheck_attachment" id="producter_selfcheck_attachment">
											</td>
											
								</tr>
								<tr>
											<td class="text-center" id="checkreport"  style="display:none">检验报告</td>
									<td colspan="2" id="checkreport1"  style="display:none"><button class="btn btn-primary"
											data-toggle="button"
											onclick="selfcheckreport('${taskData.businessKey }')">查看</button>
											<input class="form-control" type="hidden" maxlength="255"  name="checker_attachment" id="checker_attachment">
											</td>
								</tr>
							</tbody>
						</table>
						<div class="col-lg-6" style="text-align:center">
						<button type="button" class="btn btn-danger"
								onclick="waitarrival('${taskData.businessKey}')">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>等待到货
							</button>
						<button type="button" class="btn btn-warning"
								onclick="finisharrament('${taskData.businessKey}')">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>已完成安排
							</button>
							<button type="button" class="btn btn-success"
								onclick='approveZttOrderApply(${taskData.task.id },"",this)'>
								<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>已完成生产
							</button>
						</div>
					</form>
				</div>
			</div>
		</fieldset>
	</div>
</body>
<script type="text/javascript"
	src="../view/pc/lc-view/lc-task/approval_orderApplyselftechproduct.js"></script>
</html>
