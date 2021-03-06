var taskForm;
var approvalFieldSet;
var taskFieldSet;
Ext.onReady(function(){
	initTaskForm();
	Ext.create('Ext.container.Viewport',{
		layout:'border',
		xtype:'viewport',
		items:taskForm
	});
	Ext.getCmp('task_id').setValue($("#taskId").val());
	Ext.getCmp('task_name').setValue($("#taskName").val());
	Ext.getCmp('task_type').setValue($("#taskType").val());
	loadFormDataCallBack(taskForm,'../zxApplyPhoneCardController/getZxApplyPhoneCardById?id='+ $("#phoneCardApplyId").val(),callFnUpdate);
});
function initTaskForm(){
	taskFieldSet = Ext.create('Ext.form.FieldSet',{
		anchor:'100%',
		title:'任务信息',
		items:[
       {
			layout:"column",
			items:[
			{
				fieldLabel:'任务ID',
				xtype:'textfield',
				name:'task_id',
				id:'task_id',
				hidden:true
			},
			{
				fieldLabel:'任务名称',
				xtype:'textfield',
				name:'task_name',
				id:'task_name',
				maxLength:100,
				readOnly:true,
				width:450
			},
			{
				fieldLabel:'任务类型',
				xtype:'textfield',
				name:'task_type',
				id:'task_type',
				readOnly:true,
				width:450
			}
			]
		},
		{
			layout:"column",
			items:[
				{
					fieldLabel:'申请人',
					xtype:'textfield',
					id:'apply_user_name',
					readOnly:true,
					width:450
				},
				{
					fieldLabel:'部门',
					xtype:'textfield',
					id:'zxcardepart',
					readOnly:true,
					width:450
				},
				{
					fieldLabel:'职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务',
					xtype:'textfield',
					id :'apply_post_name',
					readOnly:true,
					maxLength:32,
					width:450
				},
				{
					fieldLabel:'入职时间',
					xtype:'datetimefield',
					readOnly:true,
					id :'entry_time',
					width:450
				},
				{
					fieldLabel:'转正时间',
					xtype:'datetimefield',
					readOnly:true,
					id :'positive_time',
					width:450
				},
				{
					fieldLabel:'申请时间',
					xtype:'datetimefield',
					format:'Y-m-d H:i:s',
					name:'apply_time',
					readOnly:true,
					width:450
				},
				{
					fieldLabel:'申请事项',
					xtype:'fieldcontainer',
					defaultType: 'radiofield',
					readOnly:true,
					layout:'hbox',
					items:[
					       {
					    	   boxLabel:'初次申请',
					    	   name:'apply_matter',
					    	   inputValue:'1',
					    	   readOnly:true,
					    	   id:'radio1'
					       },
					       {
					    	   boxLabel:'出差',
					    	   name:'apply_matter',
					    	   inputValue:'2',
					    	   readOnly:true,
					    	   id:'radio2'
					       },
					       {
					    	   boxLabel:'申请调整',
					    	   name:'apply_matter',
					    	   inputValue:'3',
					    	   readOnly:true,
					    	   id:'radio3'
					       },
					       {
					    	   boxLabel:'加入集团网',
					    	   name:'apply_matter',
					    	   inputValue:'4',
					    	   readOnly:true,
					    	   id:'radio4'
					       },
					       {
					    	   boxLabel:'其他:',
					    	   name:'apply_matter',
					    	   inputValue:'5',
					    	   readOnly:true,
					    	   id:'radio5'
					       },
					       {
								fieldLabel:'',
								xtype:'textfield',
								name:'apply_matter',
								readOnly:true,
								hidden:true,
								id :'other',
								maxLength:32,
								width:145
							}
					       ]
				}
			]
		},
		{
			layout:"column",
			items:[
				{
					fieldLabel:'申请描述',
					xtype:'textfield',
					name:'description',
					readOnly:true,
					width:980
				}
			]
		}
	]
	});
	
	approvalFieldSet = Ext.create('Ext.form.FieldSet',{
		anchor:'100%',
		title:'审批信息',
		items:[{
			fieldLabel:'批注',
			xtype:'textareafield',
			name:'remark',
			id:'remark',
			maxLength:65536,
			width:980
		},{
			fieldLabel:'审批结果',
			xtype:'textfield',
			name:'task_status',
			id:'task_status',
			hidden:true
		},{
			layout:"column",
			items:[
				{
					xtype:'button',
					text:'驳回',
					style:'float:right;margin:10px 30px 10px 0px',
					labelAlign:"right", 
					listeners:{
						click:function(){
							approvalSubmit("no");
						}
					}
				},{
					xtype:'button',
					text:'同意',
					style:'float:right;margin:10px',
					labelAlign:"right", 
					listeners:{
						click:function(){
							approvalSubmit("yes");
						}
					}
				}
			]
		}]
	});
	taskForm = Ext.create('Ext.FormPanel',{
		xtype:'form',
		width:1050,
		height:800,
		waitMsgTarget:true,
		defaultType:'textfield',
		autoScroll:true,
		/**新方法使用开始**/
		scrollable:true,
		scrollable:'x',
		scrollable:'y',
		/**新方法使用结束**/
		fieldDefaults:{
			labelWidth:100,
			labelAlign:'left',
			flex:1,
			margin:'2 5 4 5'
		},
		items:[
		    taskFieldSet,
		    approvalFieldSet
		]
	});
}

function callFnUpdate(form, action){
	var phoneApply = action.result.data.phoneApply;
	var apply_matter = action.result.data.apply_matter;
	if(null != phoneApply){
		Ext.getCmp('apply_user_name').setValue(phoneApply.xt_userinfo_realName);
		Ext.getCmp('zxcardepart').setValue(phoneApply.xt_departinfo_name);
		Ext.getCmp('apply_post_name').setValue(phoneApply.xt_post_name);
		Ext.getCmp('entry_time').setValue(phoneApply.xt_userinfo_intime);
	}
	var radio = apply_matter.substring(0,1);
	if(radio == "5"){
		Ext.getCmp('radio5').setValue(true);
		Ext.getCmp('other').setValue(apply_matter.substring(2,apply_matter.length));
		Ext.getCmp('other').show();
	}else if(radio =="1"){
		Ext.getCmp('radio1').setValue(true);
	}else if(radio =="2"){
		Ext.getCmp('radio2').setValue(true);
	}else if(radio =="3"){
		Ext.getCmp('radio3').setValue(true);
	}else{
		Ext.getCmp('radio4').setValue(true);
	}
}
function callFnSubmit(form, action){
	var approvalFormWin = parent.Ext.getCmp('approvalFormWin');  
	approvalFormWin.close();
	var grid = parent.Ext.getCmp('grid');  
	grids.getStore().reload();
}

function approvalSubmit(status){
	if(taskForm.form.isValid()){   
		Ext.Msg.confirm('提示','确定要提交当前表单信息内容？',function(btn){
			var params = {task_id:Ext.getCmp('task_id').getValue(),task_status:status,remark:Ext.getCmp('remark').getValue()};
			ajaxRequestCallFn('../zxApplyPhoneCardController/approvalPhoneCard',null,params,"审批中，请稍等....",callFnSubmit);
		});
	}else { 
		msgTishi('请输入必填项');
	}
}
