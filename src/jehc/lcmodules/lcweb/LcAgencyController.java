package jehc.lcmodules.lcweb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jehc.lcmodules.activitiutil.ActivitiUtil;
import jehc.lcmodules.lcmodel.LcApply;
import jehc.lcmodules.lcservice.LcApplyService;
import jehc.xtmodules.xtcore.allutils.StringUtil;
import jehc.xtmodules.xtcore.base.BaseAction;
import jehc.xtmodules.xtservice.XtUserinfoService;
import jehc.zxmodules.service.ZttOrderService;
import jehc.zxmodules.service.ZttPurchaseService;
/**
 * 代办事项
 * @author 
 *
 */
@Controller
@RequestMapping("/lcAgencyController")
public class LcAgencyController extends BaseAction{
	@Autowired
	ActivitiUtil activitiUtil;
	@Autowired
	private LcApplyService lcApplyService;
	@Autowired
	private XtUserinfoService xtUserinfoService;
	@Autowired
	private ZttOrderService zttOrderService;
	@Autowired
	private ZttPurchaseService zttPurchaseService;
	
	/**
	* 载入初始化页面
	* @param request 
	* @return
	*/
	@RequestMapping(value="/loadLcAgency",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView loadLcAgency(HttpServletRequest request){
		return new ModelAndView("pc/lc-view/lc-agency/lc-agency-list");
	}
	
	/**
	* 查找个人任务
	* @param request 
	*/
	@SuppressWarnings({ "unchecked", "deprecation" })
	@ResponseBody
	@RequestMapping(value="/getAssigneeTaskPageList",method={RequestMethod.POST,RequestMethod.GET})
	public String getLcApprovalListByCondition(HttpServletRequest request){
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("assignee", getXtUid());
		commonPager(condition, request);
		Map<String, Object> map = activitiUtil.getAssigneeTaskPageList(condition);
		List<Task> list = (List<Task>)map.get("TaskList");
		int total = new Integer(map.get("TaskCount").toString());
		JSONArray jsonArray = new JSONArray();  
		Map<String, Object> model = new HashMap<String, Object>();
		for(int i = 0; i < list.size(); i++){
			Task task = list.get(i);
			model.put("category", task.getCategory());
			if(!StringUtil.isEmpty(task.getAssignee())){
				model.put("assignee", xtUserinfoService.getXtUserinfoById(task.getAssignee()).getXt_userinfo_realName());
			}else{
				model.put("assignee", task.getAssignee());
			}
			model.put("description", task.getDescription());
			model.put("executionId", task.getExecutionId());
			model.put("formKey", task.getFormKey());
			model.put("taskId", task.getId());
			model.put("name", task.getName());
			if(!StringUtil.isEmpty(task.getOwner())){
				model.put("owner", xtUserinfoService.getXtUserinfoById(task.getOwner()).getXt_userinfo_realName());
			}else{
				model.put("owner", task.getOwner());
			}
			model.put("parentTaskId", task.getParentTaskId());
			model.put("priority", task.getPriority());
			model.put("processDefinitionId", task.getProcessDefinitionId());
			model.put("processInstanceId", task.getProcessInstanceId());
			Map<String, Object> tasks = activitiUtil.getTask(task.getId());
			Map<String, Object> applyMap = new HashMap<String, Object>();
			applyMap.put("lc_apply_model_biz_id",tasks.get("businessKey") );
			List<LcApply> applys = lcApplyService.getLcApplyListByCondition(applyMap);
			if(null != applys && applys.size() > 0){
				model.put("apply_user", xtUserinfoService.getXtUserinfoById(applys.get(0).getXt_userinfo_id()).getXt_userinfo_realName());
			}
			String xt_constantRemark=applys.get(0).getXt_constantRemark();
			if(xt_constantRemark.equals("业务人员下单表")){
				String des=zttOrderService.getZttOrderById(applys.get(0).getLc_apply_model_biz_id()).getProduct_order_number()+" ,"+
						zttOrderService.getZttOrderById(applys.get(0).getLc_apply_model_biz_id()).getProduct_name();
				model.put("describetion",des);
				model.put("state", zttOrderService.getZttOrderById(applys.get(0).getLc_apply_model_biz_id()).getState());
				model.put("applytime", zttOrderService.getZttOrderById(applys.get(0).getLc_apply_model_biz_id()).getZttordertime());
			}
			else if(xt_constantRemark.equals("采购流程")){
				String des=zttPurchaseService.getZttPurchaseById(applys.get(0).getLc_apply_model_biz_id()).getProduct_order_number()+" ,"+zttPurchaseService.getZttPurchaseById(applys.get(0).getLc_apply_model_biz_id()).getProject()+" ,"+
						zttPurchaseService.getZttPurchaseById(applys.get(0).getLc_apply_model_biz_id()).getPurchase_stardard();
				model.put("describetion", des);
				model.put("applytime", zttPurchaseService.getZttPurchaseById(applys.get(0).getLc_apply_model_biz_id()).getApply_time());
			}
			else{
				model.put("Product_order_number","");
				model.put("state","");
				model.put("applytime","");
			}
			model.put("taskDefinitionKey", task.getTaskDefinitionKey());
			model.put("tenantId", task.getTenantId());
			model.put("createTime", task.getCreateTime().toGMTString());
			model.put("delegationState", task.getDelegationState());
			model.put("dueDate", task.getDueDate());
			model.put("processVariables", task.getProcessVariables());
            jsonArray.add(model);
		}
		return outPageBootStr(jsonArray,total, request);
	}
	
	/**
	* 查找候选人任务
	* @param request 
	*/
	@SuppressWarnings({ "unchecked", "deprecation" })
	@ResponseBody
	@RequestMapping(value="/getCandidateTaskPageList",method={RequestMethod.POST,RequestMethod.GET})
	public String getCandidateTaskPageList(HttpServletRequest request){
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("candidateUser", getXtUid());
		commonPager(condition, request);
		Map<String, Object> map = activitiUtil.getCandidateTaskPageList(condition);
		List<Task> list = (List<Task>)map.get("TaskList");
		int total = new Integer(map.get("TaskCount").toString());
		JSONArray jsonArray = new JSONArray();  
		Map<String, Object> model = new HashMap<String, Object>();
		for(int i = 0; i < list.size(); i++){
			Task task = list.get(i);
			model.put("assignee", task.getCategory());
			model.put("category", task.getAssignee());
			model.put("description", task.getDescription());
			model.put("executionId", task.getExecutionId());
			model.put("formKey", task.getFormKey());
			model.put("taskId", task.getId());
			model.put("name", task.getName());
			model.put("owner", task.getOwner());
			model.put("parentTaskId", task.getParentTaskId());
			model.put("priority", task.getPriority());
			model.put("processDefinitionId", task.getProcessDefinitionId());
			model.put("processInstanceId", task.getProcessInstanceId());
			Map<String, Object> tasks = activitiUtil.getTask(task.getId());
			Map<String, Object> applyMap = new HashMap<String, Object>();
			applyMap.put("lc_apply_model_biz_id",tasks.get("businessKey") );
			List<LcApply> applys = lcApplyService.getLcApplyListByCondition(applyMap);
			if(null != applys && applys.size() > 0){
				model.put("apply_user", xtUserinfoService.getXtUserinfoById(applys.get(0).getXt_userinfo_id()).getXt_userinfo_realName());
			}
			model.put("taskDefinitionKey", task.getTaskDefinitionKey());
			model.put("tenantId", task.getTenantId());
			model.put("createTime", task.getCreateTime().toGMTString());
			model.put("delegationState", task.getDelegationState());
			model.put("dueDate", task.getDueDate());
			model.put("processVariables", task.getProcessVariables());
            jsonArray.add(model);
		}
		return outPageStr(jsonArray,total, request);
	}
	
	/**
	* 查找处理组任务
	* @param request 
	*/
	@SuppressWarnings({ "unchecked", "deprecation" })
	@ResponseBody
	@RequestMapping(value="/getCandidateGroupTaskPageList",method={RequestMethod.POST,RequestMethod.GET})
	public String getCandidateGroupTaskPageList(HttpServletRequest request){
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("candidateGroup", getXtUdid());
		commonPager(condition, request);
		Map<String, Object> map = activitiUtil.getCandidateGroupTaskPageList(condition);
		List<Task> list = (List<Task>)map.get("TaskList");
		int total = new Integer(map.get("TaskCount").toString());
		JSONArray jsonArray = new JSONArray();  
		Map<String, Object> model = new HashMap<String, Object>();
		for(int i = 0; i < list.size(); i++){
			Task task = list.get(i);
			model.put("assignee", task.getCategory());
			model.put("category", task.getAssignee());
			model.put("description", task.getDescription());
			model.put("executionId", task.getExecutionId());
			model.put("formKey", task.getFormKey());
			model.put("taskId", task.getId());
			model.put("name", task.getName());
			model.put("owner", task.getOwner());
			model.put("parentTaskId", task.getParentTaskId());
			model.put("priority", task.getPriority());
			model.put("processDefinitionId", task.getProcessDefinitionId());
			model.put("processInstanceId", task.getProcessInstanceId());
			Map<String, Object> tasks = activitiUtil.getTask(task.getId());
			Map<String, Object> applyMap = new HashMap<String, Object>();
			applyMap.put("lc_apply_model_biz_id",tasks.get("businessKey") );
			List<LcApply> applys = lcApplyService.getLcApplyListByCondition(applyMap);
			if(null != applys && applys.size() > 0){
				model.put("apply_user", xtUserinfoService.getXtUserinfoById(applys.get(0).getXt_userinfo_id()).getXt_userinfo_realName());
			}
			model.put("taskDefinitionKey", task.getTaskDefinitionKey());
			model.put("tenantId", task.getTenantId());
			model.put("createTime", task.getCreateTime().toGMTString());
			model.put("delegationState", task.getDelegationState());
			model.put("dueDate", task.getDueDate());
			model.put("processVariables", task.getProcessVariables());
            jsonArray.add(model);
		}
		return outPageStr(jsonArray,total, request);
	}
}
