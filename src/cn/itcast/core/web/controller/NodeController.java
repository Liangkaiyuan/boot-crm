package cn.itcast.core.web.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.itcast.core.bean.Approval_new;
import cn.itcast.core.bean.Workflow;
import cn.itcast.core.bean.Workflow_data;
import cn.itcast.core.bean.BaseDict;
import cn.itcast.core.bean.Node;
import cn.itcast.core.bean.Node_approval;
import cn.itcast.core.bean.Node_new;
import cn.itcast.core.service.NodeService;
/**
 * 节点信息
 * @author Administrator
 *
 */
@Controller
public class NodeController implements  Serializable  {
	
	// 依赖注入
		@Autowired
		private NodeService nodeService;
		

		/**
		 * 跳转到添加节点信息界面
		 * @return
		 */
		@RequestMapping(value = "/toaddnode.action")
		public String toAddnode() {
			return "addnode";
		}
		
		//添加审批节点信息
		@RequestMapping(value = "/addNode_approval.action")
		public String addNode_approval(String workflow_name,Model model,HttpServletRequest request, 
				HttpSession httpSession,Node_approval node_approval ) {
			String uname = (String) request.getSession().getAttribute("username");
			model.addAttribute("uname", uname);
			String uid = (String) request.getSession().getAttribute("userid");
			 //String转Integer
				Integer userid = null;
				String head_name = (String) request.getSession().getAttribute("head_name");
				if(uname!=null && head_name!=null) {
					userid = Integer.valueOf(uid);
				}
			if(uid!=null) {
				System.out.println(workflow_name);
				//根据流程名称查找流程id
				
				Integer workflow_id  = nodeService.findApprovalByName(workflow_name);
				System.out.println("根据流程名称查找流程id为："+workflow_id);
				
				Integer MaxId = nodeService.findApprovalMaxid();
				if(MaxId == null) {
					MaxId=1;
				}else {
					MaxId=MaxId+1;
				}
				 
				node_approval.setNode_approve_id(MaxId);
				node_approval.setNode_approve_wid(workflow_id);
				//审批节点信息
				nodeService.addNode_approval(node_approval);
			 
				 
				
				return "redirect:/Approval_newList.action";
				
			}else {
				return "redirect:/showlogin.action";
			}
		}
	//添加节点信息
    /*@RequestMapping(value = "/addnode")
	public String addNode(Model model,HttpServletRequest request, HttpSession httpSession,String workflow_name,Node_new node_new) {
    	String uname = (String) request.getSession().getAttribute("username");
		model.addAttribute("uname", uname);
		String uid = (String) request.getSession().getAttribute("userid");
		 //String转Integer
			Integer userid = null;
			if(uid!=null){
				userid = Integer.valueOf(uid);
			}
		  //查询节点信息最大id
			Integer nodeMaxId = nodeService.findNodeMaxId();
			if(nodeMaxId == null) {
				nodeMaxId = 1;
				node_new.setNode_id(nodeMaxId);
			}else {
				//设置主键
				node_new.setNode_id(nodeMaxId+1);
			}
			
		if(uid!=null) {
			//查询流程名称对应的id
		String WorkflowId = nodeService.findeWorkflowIdbyName(workflow_name);
			 
			node_new.setNode_workflowid(WorkflowId);
			node_new.setNode_workflowname(workflow_name);
			
			
			//创建多个实例
			Node_new node_new1 = new Node_new();//主管级
			Integer nodeMaxId1 = nodeService.findNodeMaxId();
			node_new1.setNode_id(nodeMaxId1+1);
			node_new1.setNode_workflowid(WorkflowId);
			node_new1.setNode_workflowname(workflow_name);
			String node_approvalone = node_new.getNode_approvalone();
		    System.out.println(node_approvalone+"1");
			if(node_approvalone.length()>1) {
				node_new1.setNode_approvalname("1");
				nodeService.addNode(node_new1);
			}
			
			
			Node_new node_new2 = new Node_new();//经理级
			Integer nodeMaxId2 = nodeService.findNodeMaxId();
			node_new2.setNode_id(nodeMaxId2+1);
			node_new2.setNode_workflowid(WorkflowId);
			node_new2.setNode_workflowname(workflow_name);
			String node_approvaltwo = node_new.getNode_approvaltwo();
			System.out.println(node_approvaltwo+"2");
			if(node_approvaltwo.length()>1) {
				node_new2.setNode_approvalname("2");
				nodeService.addNode(node_new2);
			}
			
			Node_new node_new3 = new Node_new();//总监级
			Integer nodeMaxId3 = nodeService.findNodeMaxId();
			node_new3.setNode_id(nodeMaxId3+1);
			node_new3.setNode_workflowid(WorkflowId);
			node_new3.setNode_workflowname(workflow_name);
			String node_approvalthree = node_new.getNode_approvalthree();
			System.out.println(node_approvalthree+"3");
			if(node_approvalthree.length()>1) {
				node_new3.setNode_approvalname("3");
				nodeService.addNode(node_new3);
			}
			
			Node_new node_new4 = new Node_new();//副总经理级
			Integer nodeMaxId4 = nodeService.findNodeMaxId();
			node_new4.setNode_id(nodeMaxId4+1);
			node_new4.setNode_workflowid(WorkflowId);
			node_new4.setNode_workflowname(workflow_name);
			String node_approvalfour = node_new.getNode_approvalfour();
			System.out.println(node_approvalfour+"4");
			if(node_approvalfour.length()>1) {
				node_new4.setNode_approvalname("4");
				nodeService.addNode(node_new4);
			}
			
			
			Node_new node_new5 = new Node_new();//总经理级
			Integer nodeMaxId5 = nodeService.findNodeMaxId();
			node_new5.setNode_id(nodeMaxId5+1);
			node_new5.setNode_workflowid(WorkflowId);
			node_new5.setNode_workflowname(workflow_name);
			String node_approvalfive = node_new.getNode_approvalfive();
			System.out.println(node_approvalfive+"5");
			if(node_approvalfive.length()>1 ) {
				node_new5.setNode_approvalname("5");
				nodeService.addNode(node_new5);
			}
			
			
			
			
			
			
			//添加节点信息
			 
			//nodeService.addNode(node_new);
			return "redirect:/Approval_newList.action";
			
		}else {
			return "redirect:/showlogin.action";
		}
	}
    */
	//节点信息下拉框
    @RequestMapping(value = "/Approval_newList")
	public String Approval_newList(Model model,HttpServletRequest request, HttpSession httpSession,Node node) {
    	String uname = (String) request.getSession().getAttribute("username");
		model.addAttribute("uname", uname);
		String uid = (String) request.getSession().getAttribute("userid");
		 //String转Integer
			Integer userid = null;
			String head_name = (String) request.getSession().getAttribute("head_name");
			if(uname!=null && head_name!=null) {
				userid = Integer.valueOf(uid);
			}
		   
		if(uid!=null) {
			
			//选择未创建节点信息的流程
			List<Workflow> workflow = nodeService.findeWorkflowNotnode();
			
			//创建者遍历信息
			List<Approval_new> ApprovalOne = nodeService.findApprovalTypeOne();
			 
			//第一审批信息
			List<Approval_new> ApprovalTwo = nodeService.findApprovalTypeTwo();
			//第二审批信息
			List<Approval_new> ApprovalThree = nodeService.findApprovalTypeThree();
			//第三审批信息
			List<Approval_new> ApprovalFour = nodeService.findApprovalTypeFour();
			//第四审批信息
			List<Approval_new> ApprovalFive = nodeService.findApprovalTypeFive();
			//归档
			List<Approval_new> ApprovalSix = nodeService.findApprovalTypeSix();
			
			
			model.addAttribute("workflow", workflow);
			model.addAttribute("ApprovalOne", ApprovalOne);
			model.addAttribute("ApprovalTwo", ApprovalTwo);
			model.addAttribute("ApprovalThree", ApprovalThree);
			model.addAttribute("ApprovalFour", ApprovalFour);
			model.addAttribute("ApprovalFive", ApprovalFive);
			model.addAttribute("ApprovalSix", ApprovalSix);
			
			return "Approval_newList";
			
		}else {
			return "redirect:/showlogin.action";
		}
	}
    
    
    
  //查询对应的节点信息根据id
    @RequestMapping(value = "/showapproval")
	public String findApprovalByid(Model model,HttpServletRequest request, HttpSession httpSession,String workflow_id) {
    	String uname = (String) request.getSession().getAttribute("username");
		model.addAttribute("uname", uname);
		String uid = (String) request.getSession().getAttribute("userid");
			
		String head_name = (String) request.getSession().getAttribute("head_name");
		if(uname!=null && head_name!=null) {
			//查询节点信息根据对应的id
		 
			List<Node_approval> Approval_new = nodeService.findNode_approveByid(workflow_id);
			model.addAttribute("page", Approval_new);
			
			return "Approval_createWorkflow_In";
			
		}else {
			return "redirect:/showlogin.action";
			
		}
		
	}
    
    
/*    @RequestMapping(value = "/toupdateApproval")
	public String toupdateApproval(Model model,HttpServletRequest request, HttpSession httpSession,String workflow_id) {
    	String uname = (String) request.getSession().getAttribute("username");
		model.addAttribute("uname", uname);
		String uid = (String) request.getSession().getAttribute("userid");
			
		if(uid!=null) {
			
		 	List<Node_new> Approval = nodeService.findApprovalByid(workflow_id);
			 
			model.addAttribute("Approval", Approval);
			return "redirect:/updateapproval.action?";
			
		}else {
			return "redirect:/showlogin.action";
		}
	}*/
    
  //跳转到更新节点信息
    @RequestMapping(value = "/toupdateApproval")
	public String toupdateApproval(Model model,HttpServletRequest request, HttpSession httpSession,String workflow_id) {
    	String uname = (String) request.getSession().getAttribute("username");
		model.addAttribute("uname", uname);
		String uid = (String) request.getSession().getAttribute("userid");
		 //String转Integer
			Integer userid = null;
			String head_name = (String) request.getSession().getAttribute("head_name");
			if(uname!=null && head_name!=null) {
				userid = Integer.valueOf(uid);
			}
		   
		if(uid!=null) {
			
			//选择未创建节点信息的流程
			List<Node_new> Approval = nodeService.findApprovalByid(workflow_id);
			 
			String node_workflowname = Approval.get(0).getNode_workflowname();
			
			String node_workflowid = Approval.get(0).getNode_workflowid();
			
			Integer Node_id1 = Approval.get(0).getNode_id();
			String Node_id = Node_id1+"";
			
			//创建者遍历信息
			List<Approval_new> ApprovalOne = nodeService.findApprovalTypeOne();
			 
			//第一审批信息
			List<Approval_new> ApprovalTwo = nodeService.findApprovalTypeTwo();
			//第二审批信息
			List<Approval_new> ApprovalThree = nodeService.findApprovalTypeThree();
			//第三审批信息
			List<Approval_new> ApprovalFour = nodeService.findApprovalTypeFour();
			//第四审批信息
			List<Approval_new> ApprovalFive = nodeService.findApprovalTypeFive();
			//归档
			List<Approval_new> ApprovalSix = nodeService.findApprovalTypeSix();
			
			
			model.addAttribute("node_workflowid", node_workflowid);
			model.addAttribute("node_workflowname", node_workflowname);
			model.addAttribute("Node_id", Node_id);
			model.addAttribute("ApprovalOne", ApprovalOne);
			model.addAttribute("ApprovalTwo", ApprovalTwo);
			model.addAttribute("ApprovalThree", ApprovalThree);
			model.addAttribute("ApprovalFour", ApprovalFour);
			model.addAttribute("ApprovalFive", ApprovalFive);
			model.addAttribute("ApprovalSix", ApprovalSix);
			
			return "updateApproval";
			
		}else {
			return "redirect:/showlogin.action";
		}
    
    }
    
    //更新节点信息
    @RequestMapping(value = "/updateApproval")
	public String updateApproval(Model model,HttpServletRequest request, HttpSession httpSession,Node_new node_new) {
    	String uname = (String) request.getSession().getAttribute("username");
		model.addAttribute("uname", uname);
		String uid = (String) request.getSession().getAttribute("userid");
		 //String转Integer
			Integer userid = null;
			String head_name = (String) request.getSession().getAttribute("head_name");
			if(uname!=null && head_name!=null) {
				userid = Integer.valueOf(uid);
			}
		   
			if(uname!=null && head_name!=null) {
			
			nodeService.updateApproval(node_new);
			//跳转到流程修改后的节点信息
			String node_workflowid = node_new.getNode_workflowid();
			 System.out.println("修改后跳转"+node_workflowid);
			//跳转到修改后的节点信息界面
			return "redirect:/showapproval.action?workflow_id="+node_workflowid;
			
		}else {
			return "redirect:/showlogin.action";
		}
    
    }


   
  //未完成流程查询流程审批信息（精确到具体人员）
  	 @RequestMapping(value = "/workflow/Approval_showWorkflowdate.action")
  		public String Approval_showWorkflowdate(String workflow_id,Model model,HttpServletRequest request, HttpSession httpSession) {
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
  				List<Node_approval> Approval_showWorkflowdate = nodeService.Approval_showWorkflowdate(uid,workflow_id);
  				
  				
  				//添加到前端
  				//model.addAttribute("page", workflow_data);
  				
  				return "notFinishworkflowdata";
  			}else {
  				return "redirect:/showlogin.action";
  			}
  			
  		} 
  	 
    
    
    
    
    
    
    
    
    
    

}
