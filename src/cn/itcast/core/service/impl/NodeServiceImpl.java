package cn.itcast.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.core.bean.Approval_new;
import cn.itcast.core.bean.Node;
import cn.itcast.core.bean.Node_approval;
import cn.itcast.core.bean.Node_new;
import cn.itcast.core.bean.Workflow;
import cn.itcast.core.dao.NodeDao;
import cn.itcast.core.service.NodeService;
@Service("nodeService")
@Transactional
public class NodeServiceImpl implements NodeService {

	// 定义dao属性
		@Autowired
		private NodeDao nodeDao;
	//添加节点信息
	@Override
	public void addNode(Node_new node_new) {
		// TODO Auto-generated method stub
		nodeDao.addNode(node_new);
	}
	//查找最大节点信息id
	@Override
	public Integer findNodeMaxId() {
		// TODO Auto-generated method stub
		return nodeDao.findNodeMaxId();
	}
	//查询第一个下拉框
	@Override
	public List<Approval_new> findApprovalTypeOne() {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalTypeOne();
	}
	//第一审批信息
	@Override
	public List<Approval_new> findApprovalTypeTwo() {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalTypeTwo();
	}
	//查询未创建节点信息的流程
	@Override
	public List<Workflow> findeWorkflowNotnode() {
		// TODO Auto-generated method stub
		return nodeDao.findeWorkflowNotnode();
	}
	//第二审批信息
	@Override
	public List<Approval_new> findApprovalTypeThree() {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalTypeThree();
	}
	//第三审批信息
	@Override
	public List<Approval_new> findApprovalTypeFour() {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalTypeFour();
	}
	//第四审批信息
	@Override
	public List<Approval_new> findApprovalTypeFive() {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalTypeFive();
	}
	//归档
	@Override
	public List<Approval_new> findApprovalTypeSix() {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalTypeSix();
	}
	//查询流程名称对应的id
	@Override
	public String findeWorkflowIdbyName(String workflowname) {
		// TODO Auto-generated method stub
		return nodeDao.findeWorkflowIdbyName(workflowname);
	}
	
	//查询节点信息根据id
	@Override
	public List<Node_new> findApprovalByid(String workflow_id) {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalByid(workflow_id);
	}
	//更新节点信息
	@Override
	public void updateApproval(Node_new node_new) {
		// TODO Auto-generated method stub
		nodeDao.updateApproval(node_new);
	}
	
	//根据流程名称查询流程id
	@Override
	public Integer findApprovalByName(String workflow_name) {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalByName(workflow_name);
	}
	
	//创建审批节点信息
	@Override
	public void addNode_approval(Node_approval node_approval) {
		// TODO Auto-generated method stub
		nodeDao.addNode_approval(node_approval);
	}
	
	//查找审批节点信息最大id
	@Override
	public Integer findApprovalMaxid() {
		// TODO Auto-generated method stub
		return nodeDao.findApprovalMaxid();
	}
	
	//创建流程界面查询节点信息
	@Override
	public List<Node_approval> findNode_approveByid(String workflow_id) {
		// TODO Auto-generated method stub
		return nodeDao.findNode_approveByid(workflow_id);
	}
	
	//未完成流程查询流程审批信息（精确到具体人员）
	@Override
	public List<Node_approval> Approval_showWorkflowdate(String uid, String workflow_id) {
		// TODO Auto-generated method stub
		return nodeDao.Approval_showWorkflowdate(uid,workflow_id);
	}

}
