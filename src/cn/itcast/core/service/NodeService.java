package cn.itcast.core.service;

import java.util.List;

import cn.itcast.core.bean.Approval_new;
import cn.itcast.core.bean.Node;
import cn.itcast.core.bean.Node_approval;
import cn.itcast.core.bean.Node_new;
import cn.itcast.core.bean.Workflow;

/**
 * 节点信息
 * @author Administrator
 *
 */
public interface NodeService {

	//添加节点信息
	void addNode(Node_new node_new);

	//查询最大节点信息id
	Integer findNodeMaxId();

	//查询第一个下拉框
	List<Approval_new> findApprovalTypeOne();

	//第一审批信息
	List<Approval_new> findApprovalTypeTwo();

	//查询未创建节点信息的流程
	List<Workflow> findeWorkflowNotnode();
	
	//第二审批信息
	List<Approval_new> findApprovalTypeThree();
	
	//第三审批信息
	List<Approval_new> findApprovalTypeFour();

	//第四审批信息
	List<Approval_new> findApprovalTypeFive();

	//归档
	List<Approval_new> findApprovalTypeSix();

	//查询流程名称对应的id
	String findeWorkflowIdbyName(String workflowname);

	//查询节点信息根据id
	List<Node_new> findApprovalByid(String workflow_id);

	//更新节点信息
	void updateApproval(Node_new node_new);

	//根据流程名称查询流程id
	Integer findApprovalByName(String workflow_name);

	//添加审批节点信息
	void addNode_approval(Node_approval node_approval);

	//查找审批节点信息最大id
	Integer findApprovalMaxid();

	//创建流程界面查询节点信息
	List<Node_approval> findNode_approveByid(String workflow_id);

	//未完成流程查询流程审批信息（精确到具体人员）
	List<Node_approval> Approval_showWorkflowdate(String uid, String workflow_id);

}
