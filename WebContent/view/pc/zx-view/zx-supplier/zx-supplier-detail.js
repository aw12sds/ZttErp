//返回r
function goback(){
	tlocation("../zxSupplierController/loadZxSupplier");
}
//初始化日期选择器
$(document).ready(function(){
	datetimeInit();
	InitMyDataCombo("zx_zhiwu","title","title_");
    $("#classify").append("<option value=''>请选择</option><option value='A'>A</option><option value='B'>B</option><option value='C'>C</option><option value='D'>D</option>");
    $("#type").append("<option value=''>请选择</option><option value='1'>供应商</option><option value='2'>加工商</option>");
    $("#pay_type").append("<option value=''>请选择</option><option value='1'>全款</option><option value='2'>货到付款</option><option value='3'>预付款</option>");
    $("#is_connect").append("<option value=''>请选择</option><option value='1'>是</option><option value='0'>否</option>");
    $("#judge_cycle").append("<option value=''>请选择</option><option value='1'>年</option><option value='2'>季度</option><option value='3'>月</option>");
    
    $("#classify").val($("#classify_").val());
    $("#type").val($("#type_").val());
    $("#pay_type").val($("#pay_type_").val());
    $("#is_connect").val($("#is_connect_").val());
    $("#judge_cycle").val($("#judge_cycle_").val());
});
function InitMyDataCombo(ckey,id,value_id){
	var str = "<option value=''>请选择</option>";
	$.ajax({
	   type:"GET",
	   url:"../xtCommonController/getXtDataDictionaryList",
	   data:"ckey="+ckey,
	   success: function(data){
         $.each(data, function(i, item){
         	 str += "<option value=" + item.xt_data_dictionary_id + ">" + item.xt_data_dictionary_name + "</option>";
         })
         $("#"+id).append(str);
         try {
      	   if(null != value_id && '' != value_id){
      		   if('undefined' != typeof($('#'+value_id).val()) && null != $('#'+value_id).val() && '' != $('#'+value_id).val() && '请选择' != $('#'+value_id).val()){
      			   $('#'+id).val($('#'+value_id).val());
      		   }
             }
		   } catch (e) {
				console.log("读取下拉框为数据字典类型并赋值出现异常，异常信息："+e);
		   }
	   }
	});
}

function selectsupplyer(){
	var upid="suppler";
	layer.open({
		title: '选择供应商',
		type: 2, 
		area: ['800px', '500px'],
		btn: ['关闭'],
		content: "../zttOrderController/selectsuppler?upid="+upid
	 
	}); 
}