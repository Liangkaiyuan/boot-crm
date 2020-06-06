package cn.itcast.core.web.controller;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

 
import cn.itcast.core.bean.Workflow;
import cn.itcast.core.bean.Workflow_data;
 
import cn.itcast.core.service.WorkflowService;

@Controller
public class WorkflowController implements  Serializable  {
	// 依赖注入
	@Autowired
	private WorkflowService workflowService;
	 
	
	/*
	 * 创建流程的显示字段
	 */
	@RequestMapping(value = "/addworkflow.action")
	public String CreateWorkflow(Workflow workflow,HttpServletRequest request, HttpSession httpSession) {
		//获取用户信息
		//最后一个字段用来存储用户id
		String userid = (String) request.getSession().getAttribute("userid");
		
		//获取最大的流程表最大id信息并加1
		Integer workflowMaxId = workflowService.getWorkflowMaxId();
		workflow.setWorkflow_r("0");
		workflow.setWorkflow_s("流程状态");
		
		System.out.println("创建流程"+workflow.workflow_a);
		workflow.setWorkflow_id(workflowMaxId+1); 
		workflow.setWorkflow_uid(userid);
		 
		workflowService.CreateWorkflow(workflow);
		return "redirect:/workflow/list.action";
		
	}
	/*
	 * 跳转到创建流程界面
	 */
	@RequestMapping(value = "/toaddworkflow.action")
	public String ToCreateWorkflow() {
		return "addworkflow";
	}
	
	/*
	 * 查找全部流程的信息
	 */
	 
		@RequestMapping(value = "/workflow/list")
		public String findWorkflowList(@RequestParam(defaultValue="0")Integer start, @RequestParam(defaultValue="1000")Integer rows, 
				  Model model,HttpServletRequest request, HttpSession httpSession) {
			//获取session中的信息
			String uname = (String) request.getSession().getAttribute("username");
			String head_name = (String) request.getSession().getAttribute("head_name");
			if(uname!=null && head_name!=null) {
			 
			model.addAttribute("uname", uname);
			System.out.println("列表的用户名是："+uname);
			List<Workflow> workflow = workflowService.findWorkflowList(start,rows);
			model.addAttribute("page", workflow);
			
			return "workflowList";}
			else {
				return "redirect:/showlogin.action";
			}
		}
	    //新建流程时显示的信息
		//显示某个流程显示的字段信息
		//跳转至流程页面，通过流程id带出流程显示的字段，跳转到添加存储信息的页面
		@RequestMapping(value = "/workflow/onelist")
		public String ShowWorkflowOne(Integer workflow_id,Model model,HttpServletRequest request, HttpSession httpSession) {
			//获取session中的信息
			String uname = (String) request.getSession().getAttribute("username");
			String head_name = (String) request.getSession().getAttribute("head_name");
			if(uname!=null && head_name!=null) {
			 
			model.addAttribute("uname", uname);
			 
			List<Workflow> workflow = workflowService.ShowWorkflowOne(workflow_id);
			model.addAttribute("page", workflow);
			
			return "addworkflowdata";}
			else {
				return "redirect:/showlogin.action";
			}
		}
		
		
		
		
		
		/*新建流程
		 * 创建流程存储字段信息
		 * 传入字段对应的信息，用户id，流程id，审批流程id，审批节点信息   放在一个对象中
		 */
		@RequestMapping(value = "/workflow/addworkflowdata")
		public String addworkflowdata(Workflow_data workflow_data,Model model,Integer workflow_id,HttpServletRequest request, HttpSession httpSession) throws ParseException {
			
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String userid = (String) request.getSession().getAttribute("userid");
			String head_name = (String) request.getSession().getAttribute("head_name");
			if(uname!=null && head_name!=null) {
			 
				//获取流程信息存储表里的最大id
				Integer findWorkflowDataMaxId = workflowService.findWorkflowDataMaxId();
				if(findWorkflowDataMaxId == null) {
					findWorkflowDataMaxId = 1;
					workflow_data.setWorkflow_data_id(findWorkflowDataMaxId);
				}else {
					//设置主键
					workflow_data.setWorkflow_data_id(findWorkflowDataMaxId+1);
				}
				 
				//设置用户id
				workflow_data.setWorkflow_data_uid(userid);
				//设置流程状态
				/*
				 * 0：为草稿
				 * 1为已提交 未审核
				 * 2：审核完成
				 */
				workflow_data.setWorkflow_data_s("1");
				Date date =new Date();

				SimpleDateFormat bartDateFormat = new SimpleDateFormat
		  				("yyyy-mm-dd H:m:s"); 
				String date1 = bartDateFormat.format(date);
		  System.out.println(bartDateFormat.format(date));
		  
				System.out.println("日期"+date1);
				
				workflow_data.setWorkflow_data_createtime(date1);
				
				
				//添加对应的数据到数据信息存储表中
				workflowService.addworkflowdata(workflow_data);
				
				return "redirect:/workflow/notFinishworkflowdata.action";
			
			/*return "redirect:/workflow/findworkflowdata.action";
			*/
			}
			else {
				return "redirect:/showlogin.action";
			}
		}
	
		/*我的流程
		 * 通过用户id获取用户已经创建的流程，之后在通过另一个方法找到用户在该流程中所创建的数据
		 */
		@RequestMapping(value = "/workflow/findworkflowdata")
		public String findworkflowByUserid(Model model,HttpServletRequest request, HttpSession httpSession) {
			
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			//String转Integer
				 
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				
				
				//查询用户有关流程的方法
				List<Workflow> workflow = workflowService.findworkflowByUserid(userid);
				//添加到前端
				model.addAttribute("page", workflow);
				return "myworkflowList";
			}else {
				return "redirect:/showlogin.action";
			}
			
		}
		/*
		 * 未完成的流程
		 */
		@RequestMapping(value = "/workflow/notFinishworkflowdata")
		public String findNotFinishworkflowdata(Model model,HttpServletRequest request, HttpSession httpSession) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				//查询用户未审核完成的流程
				List<Workflow_data> workflow_data = workflowService.findNotFinishworkflowdata(userid);
				//添加到前端
				model.addAttribute("page", workflow_data);
				
				return "notFinishworkflowdata";
			}else {
				return "redirect:/showlogin.action";
			}
			
		} 
		
		
		/*
		 * 未完成的流程里面进入功能
		 */
		@RequestMapping(value = "/workflow/notFinishworkflowdataIn")
		public String findNotFinishworkflowdataIn(Integer workflow_id,Integer workflow_data_id,Model model,HttpServletRequest request, HttpSession httpSession) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				
				//查询该流程中对应的显示字段信息
				List<Workflow> workflow = workflowService.findNotFinishworkflowIN(workflow_id);
				model.addAttribute("workflow", workflow);
				//查询用户未审核完成的流程中的存储信息
				List<Workflow_data> workflow_data = workflowService.findNotFinishworkflowdataIN(userid,workflow_data_id);
				//添加到前端
				model.addAttribute("page", workflow_data);
				
				return "notFinishworkflowdataIn";
			}else {
				return "redirect:/showlogin.action";
			}
			
		} 
		
		
		
		
		
		/*
		 * 已完成的流程
		 */
		@RequestMapping(value = "/workflow/Finishworkflowdata")
		public String findFinishworkflowdata(Model model,HttpServletRequest request, HttpSession httpSession) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				//查询用户未审核完成的流程
				List<Workflow_data> workflow_data = workflowService.findFinishworkflowdata(userid);
				//添加到前端
				model.addAttribute("page", workflow_data);
				
				
				return "Finishworkflowdata";
			}else {
				return "redirect:/showlogin.action";
			}
			
		} 
		
		
		
		/*
		 * 已完成的流程里面进入功能
		 */
		@RequestMapping(value = "/workflow/FinishworkflowdataIn")
		public String findFinishworkflowdataIn(Integer workflow_id,Integer workflow_data_id,Model model,HttpServletRequest request, HttpSession httpSession) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				
				//查询已审核流程中对应的显示字段信息
				List<Workflow> workflow = workflowService.findFinishworkflowIN(workflow_id);
				model.addAttribute("workflow", workflow);
				//查询用户已审核完成的流程中的存储信息
				List<Workflow_data> workflow_data = workflowService.findFinishworkflowdataIN(userid,workflow_data_id);
				//添加到前端
				model.addAttribute("page", workflow_data);
				
				return "FinishworkflowdataIn";
			}else {
				return "redirect:/showlogin.action";
			}
			
		} 
		
		
		
	/**
	 * 编辑已经创建的流程
	 */
	 @RequestMapping(value = "/workflow/edit_workflow")
		public String editWorkflow(Model model,HttpServletRequest request, HttpSession httpSession,Integer workflow_id) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				//找到流程id对应的流程信息并将信息返回给前段进行修改显示，可以进行增减，返回新增流程时的页面
				List<Workflow> workflow= workflowService.findWorkflowByid(workflow_id);
				
				//查询用户未审核完成的流程
				//List<Workflow_data> workflow_data = workflowService.findFinishworkflowdata(userid);
				
				//添加到前端
				model.addAttribute("page", workflow);
				return "editworkflow";
				
			}else {
				return "redirect:/showlogin.action";
			}
		} 
	/**
	 * 更新流程
	 */
	 @RequestMapping(value = "/workflow/updateworkflow")
		public String updateWorkflow(Model model,HttpServletRequest request, HttpSession httpSession,Workflow workflow) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				//更新流程字段信息
				  workflowService.updateWorkflow(workflow);
				//添加到前端
				model.addAttribute("page", workflow);
				//返回流程列表
				return "redirect:/workflow/list.action";
				
			}else {
				return "redirect:/showlogin.action";
			}
		} 
	 /**
	  *查找有效流程
	  */
	 @RequestMapping(value = "/workflow/findworkflowNormal")
		public String findworkflowNormal(Model model,HttpServletRequest request, HttpSession httpSession) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				//更新流程字段信息
				  List<Workflow> findworkflowNormal = workflowService.findworkflowNormal();
				//添加到前端
				model.addAttribute("page", findworkflowNormal);
				//返回流程列表
				return "createWorkflow";
				
			}else {
				return "redirect:/showlogin.action";
			}
		} 
	 
	 
	 /**
	  *刪除流程 及將流程的有效值更新為2
	  */
	 @RequestMapping(value = "workflow/delete_workflow")
		public String deleteWorkflow(Model model,HttpServletRequest request, HttpSession httpSession,Integer workflow_id) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			 System.out.println("查找用户全部流程"+userid);
				if(uname!=null && head_name!=null) {
				//删除流程
				   workflowService.deleteWorkflow(workflow_id);
				//添加到前端
				//model.addAttribute("page", findworkflowNormal);
				//返回流程列表
				return "redirect:/workflow/list.action";
				
			}else {
				return "redirect:/showlogin.action";
			}
		}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
