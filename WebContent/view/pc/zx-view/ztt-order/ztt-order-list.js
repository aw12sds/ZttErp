var grid;
$(document)
		.ready(
				function() {
					// ///////////jehc扩展属性目的可方便使用（boot.js文件datatablesCallBack方法使用）
					// 如弹窗分页查找根据条件
					// 可能此时的form发生变化 此时 可以解决该类问题
					var opt = {
						searchformId : 'searchForm'
					};
					
					var options = DataTablesPaging
							.pagingOptions({
								ajax : function(data, callback, settings) {
									datatablesCallBack(
											data,
											callback,
											settings,
											'../zttOrderController/getZttOrderListByCondition',
											opt);
								},// 渲染数据
								// 在第一位置追加序列号
								fnRowCallback : function(nRow, aData,
										iDisplayIndex) {
									jQuery('td:eq(1)', nRow).html(
											iDisplayIndex + 1);
									return nRow;
								},
								order : [],// 取消默认排序查询,否则复选框一列会出现小箭头
								// 列表表头字段
								colums : [
										{
											sClass : "text-center",
											width : "50px",
											data : "id",
											render : function(data, type, full,
													meta) {
												return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" name="checkId" class="checkchild " value="'
														+ data
														+ ","
														+ full.state
														+ '" /><span></span></label>';
											},
											bSortable : false
										},

										{
											data : 'id'
										},
										{
											data : 'product_order_number',
											render : function(data, type, row,
													meta) {
												if (row.product_order_number == ''){
													return "无工令号";
												}else{
													return row.product_order_number;
												}
												
											}
											
										},
										{
											data : 'client'
										},
										{
											data : 'product_name'
										},
										{
											data : 'amount'
										},
										{
											data : 'zttordertime'
										},
										{
											data : 'personname'
										},
										{
											data : 'state',
											render : function(data, type, row,
													meta) {
												return InitBDataCallFnByKey(
														"ZttOrder", data);
											}
										},
										{
											data : "id",
											width : "150px",
											render : function(data, type, row,
													meta) {
												
												var opt = "<a href=\"javascript:toZttOrderDetail('"
														+ data
														+ "','"+row.state+"')\"><span class='glyphicon glyphicon-eye-open' title='详情'></span></a>&emsp;";
												return opt;
											}
										},
										{
											data : "id",
											width : "150px",
											render : function(data, type, row,
													meta) {
												
												var opt;
												if (row.state == '0') {
													opt= "<a href=\"javascript:toApply('"
															+ data
															+ "')\"><span class='glyphicon glyphicon-transfer text-danger' title='申请审批'></span></a>&emsp;";
												} else {
													opt= "<a href=\"javascript:approval('"
															+ data
															+ "')\"><span class='glyphicon glyphicon-list-alt text-warning' title='审批记录'></span></a>&emsp;";
												}
												opt+="<a href=\"javascript:showLcProcessInstance('"
												+ data
													+"')\"><span class='glyphicon glyphicon-tag text-warning' title='查看流程图'></span>";
												return opt;
											}
										}]
							});
					grid = $('#datatables').dataTable(options);
					// 实现全选反选
					docheckboxall('checkall', 'checkchild');
					// 实现单击行选中
					clickrowselected('datatables');
					InitBDataCombo("ZttOrder","state");
				});
// 新增
function toZttOrderAdd() {
	tlocation('../zttOrderController/toZttOrderAdd');
}
// 修改
function toZttOrderUpdate() {
	if ($(".checkchild:checked").length != 1) {
		toastrBoot(4, "选择数据非法");
		return;
	}
	var id = $(".checkchild:checked").val();
	tlocation("../zttOrderController/toZttOrderUpdate?id=" + id);
}
// 详情
function toZttOrderDetail(id,state) {
	tlocation("../zttOrderController/toZttOrderDetail?id=" + id+"&state="+state);
}
// 删除
function delZttOrder() {
	if (returncheckedLength('checkchild') <= 0) {
		toastrBoot(4, "请选择要删除的数据");
		return;
	}
	var str = $(".checkchild:checked").val();
	var strs = str.split(",");
	var id = strs[0];
	var status = strs[1];
	if(status!=0){
		toastrBoot(4,"只有待申请状态的数据可以删除");
		return;
	}
	msgTishCallFnBoot("确定要删除所选择的数据？",
			function() {
				var id = returncheckIds('checkId').join(",");
				var params = {
					id : id
				};
				ajaxBReq('../zttOrderController/delZttOrder', params,
						[ 'datatables' ]);
			})
}
// 申请
function toApply(id) {
	var str = $(".checkchild:checked").val();
	var strs = str.split(",");
	var id = strs[0];
	var status = strs[1];
	if (status != 0) {
		toastrBoot(4, "只有待申请状态的数据可以申请");
		return;
	}
	msgTishCallFnBoot("确定要申请审批吗？", function() {
		var params = {
			apply_id : id
		};
		ajaxBReq('../zttOrderController/toApply', params, [ 'datatables' ]);
	})
}
function approval(id, state) {
	if (state == "1") {
		return;
	}
	approval_record(id);
}
// 保存
function downloadattachment(id) {
	layer.open({
		title : '下载附件',
		type : 2,
		area : [ '500px', '500px' ],
		btn : [ '关闭'],
		content : "../zttOrderController/Downloadattachment?id=" + id

	})
};

function approval_record(id) {
	$('#approvalModal').modal();
	// ///////////jehc扩展属性目的可方便使用（boot.js文件datatablesCallBack方法使用） 如弹窗分页查找根据条件
	// 可能此时的form发生变化 此时 可以解决该类问题
	var options = DataTablesPaging.pagingOptions({
		ajax : function(data, callback, settings) {
			datatablesCallBack(data, callback, settings,
					'../lcApprovalController/getLcApprovalListByCondition?model_biz_id='
							+ id, null);
		},// 渲染数据
		// 在第一位置追加序列号
		fnRowCallback : function(nRow, aData, iDisplayIndex) {
			jQuery('td:eq(0)', nRow).html(iDisplayIndex + 1);
			return nRow;
		},
		order : [],// 取消默认排序查询,否则复选框一列会出现小箭头
		// 列表表头字段
		colums : [ {
			sClass : "text-center",
			width : "50px",
			data : "lc_approval_id",
			render : function(data, type, full, meta) {
				return '';
			},
			bSortable : false
		}, {
			data : 'lc_status_id',
			render : function(data, type, row, meta) {
				if (data == "yes") {
					return "主管审批通过";
				} else if (data == "no") {
					return "审批不通过";
				} else if (data == "madebyself") {
					return "自制单,进入工艺流程";
				} else if (data == "outside") {
					return "外协单,进入采购流程";
				} else if (data == "outsidecheck") {
					return "外协单,进入采购检验流程";
				} else if (data == "selftech") {
					return "自制单,进入生产调度流程";
				}

			}
		}, {
			data : 'lc_approval_remark'
		}, {
			data : 'lc_approval_time',
			render : function(data, type, row, meta) {
				return dateformat(data);
			}
		}, {
			data : 'xt_userinfo_realName'
		} ]
	});
	approval_grid = $('#datatables_approval').dataTable(options);
}
function showLcProcessInstance(id){
	/*lcProcessInstanceWin = Ext.create('Ext.Window',{
		layout:'fit',
		width:clientWidth*0.8,                    
		height:clientHeight*0.8,
		maximizable:true,
		minimizable:true,
		animateTarget:document.body,
		plain:true,
		modal:true,
		headerPosition:'right',
		title:'实例监控图',
		html:'<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="../lcProcessController/loadLcProcessInstanceImg?processInstanceId='+id+'"></iframe>',
		listeners:{
			minimize:function(win,opts){
				if(!win.collapse()){
					win.collapse();
				}else{
					win.expand();
				}
			}
		}
	});
	lcProcessInstanceWin.show();*/
	$.ajax({
		 
		   type: 'POST',
		   url: "../zttOrderController/getZttOrderInstanceById",
		  data: { id: id},
		  success:function(data){
			  var id=data;
			  layer.open({
					title : '查看流程图',
					type : 2,
					area : [ '1500px', '600px' ],
					btn : [ '关闭'],
					content : "../lcProcessController/loadLcProcessInstanceImg?processInstanceId=" + id

				})
		  }
		});
	
}