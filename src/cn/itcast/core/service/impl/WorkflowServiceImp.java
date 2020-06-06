package cn.itcast.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.Workflow;
import cn.itcast.core.bean.Workflow_data;
import cn.itcast.core.dao.WorkflowDao;
import cn.itcast.core.service.WorkflowService;
@Service("workflowService")
@Transactional
public class WorkflowServiceImp implements WorkflowService{

	// 定义dao属性
	@Autowired
	private WorkflowDao workflowDao;
	 //创建流程
	@Override
	public void CreateWorkflow(Workflow workflow) {
		// TODO Auto-generated method stub
		workflowDao.CreateWorkflow(workflow);
		 
	}

	//获取流程表里的最大id
	@Override
	public Integer getWorkflowMaxId() {
		// TODO Auto-generated method stub
		return workflowDao.getWorkflowMaxId();
	}

	//查询全部流程
	@Override
	public List<Workflow> findWorkflowList(Integer start, Integer rows) {
		// TODO Auto-generated method stub
		return workflowDao.findWorkflowList(start, rows);
	}

	//根据流程id返回某个流程的显示信息
	@Override
	public List<Workflow> ShowWorkflowOne(Integer workflow_id) {
		// TODO Auto-generated method stub
		return workflowDao.ShowWorkflowOne(workflow_id);
	}

	//获取流程信息存储表里的最大id
	@Override
	public Integer findWorkflowDataMaxId() {
		// TODO Auto-generated method stub
		return workflowDao.findWorkflowDataMaxId();
	}

	//添加对应的数据到数据信息存储表中
	@Override
	public void addworkflowdata(Workflow_data workflow_data) {
		// TODO Auto-generated method stub
		workflowDao.addworkflowdata(workflow_data);
	}

	//通过用户id查询用户有关的所有流程名称
	@Override
	public List<Workflow> findworkflowByUserid(Integer userid) {
		// TODO Auto-generated method stub
		return workflowDao.findworkflowByUserid(userid);
	}

	//查询用户未审核完成的流程
	@Override
	public List<Workflow_data> findNotFinishworkflowdata(Integer userid) {
		// TODO Auto-generated method stub
		return workflowDao.findNotFinishworkflowdata(userid);
	}

	//查询用户已审核完成的流程
	@Override
	public List<Workflow_data> findFinishworkflowdata(Integer userid) {
		// TODO Auto-generated method stub
		return workflowDao.findFinishworkflowdata(userid);
	}

	//未审核流程的进入功能
	@Override
	public List<Workflow_data> findNotFinishworkflowdataIN(Integer userid,Integer workflow_data_id) {
		// TODO Auto-generated method stub
		return workflowDao.findNotFinishworkflowdataIN(userid,workflow_data_id);
	}

	//查询该流程中对应的显示字段信息
	@Override
	public List<Workflow> findNotFinishworkflowIN(Integer workflow_id) {
		// TODO Auto-generated method stub
		return workflowDao.findNotFinishworkflowIN(workflow_id);
	}

	//通过流程id查询流程信息
	@Override
	public List<Workflow> findWorkflowByid(Integer workflow_id) {
		// TODO Auto-generated method stub
		return workflowDao.findWorkflowByid(workflow_id);
	}

	//更新流程字段信息
	@Override
	public void updateWorkflow(Workflow workflow) {
		// TODO Auto-generated method stub
		 workflowDao.updateWorkflow(workflow);
	}

	//查找有效流程
	@Override
	public List<Workflow> findworkflowNormal() {
		// TODO Auto-generated method stub
		return workflowDao.findworkflowNormal();
	}

	//删除流程
	@Override
	public void deleteWorkflow(Integer workflow_id) {
		// TODO Auto-generated method stub
		workflowDao.deleteWorkflow(workflow_id);
	}

	//查询用户已经审核的流程
	@Override
	public List<Workflow> findFinishworkflowIN(Integer workflow_id) {
		// TODO Auto-generated method stub
		return workflowDao.findFinishworkflowIN(workflow_id);
	}

	//查询用户已经审核的流程进入功能
	@Override
	public List<Workflow_data> findFinishworkflowdataIN(Integer userid, Integer workflow_data_id) {
		// TODO Auto-generated method stub
		return workflowDao.findFinishworkflowdataIN(userid,workflow_data_id);
	}

}
