package cn.itcast.core.service;

import java.util.List;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.Workflow;
import cn.itcast.core.bean.Workflow_data;

public interface WorkflowService {

	//新建流程
	public void CreateWorkflow(Workflow workflow);

	//获取最大的流程信息id
	public Integer getWorkflowMaxId();

	//获取全部流程信息
	public List<Workflow> findWorkflowList(Integer start, Integer rows);

	//根据流程id返回某个流程的显示信息
	public List<Workflow> ShowWorkflowOne(Integer workflow_id);

	//获取流程信息存储表里的最大id
	public Integer findWorkflowDataMaxId();

	//添加对应的数据到数据信息存储表中
	public void addworkflowdata(Workflow_data workflow_data);

	//通过用户id查询用户有关的所有流程名称
	public List<Workflow> findworkflowByUserid(Integer userid);

	//查询用户未审核完成的流程
	public List<Workflow_data> findNotFinishworkflowdata(Integer userid);

	//查询用户已审核完成的流程
	public List<Workflow_data> findFinishworkflowdata(Integer userid);

	//未审核流程的进入功能
	public List<Workflow_data> findNotFinishworkflowdataIN(Integer userid,Integer workflow_data_id);
	
	//查询未完成流程进入中对应的显示字段信息
	public List<Workflow> findNotFinishworkflowIN(Integer workflow_id);

	//通过流程id查询流程信息
	public List<Workflow> findWorkflowByid(Integer workflow_id);

	//更新流程字段信息
	public void updateWorkflow(Workflow workflow);

	//查找有效流程
	public List<Workflow> findworkflowNormal();

	//删除流程
	public void deleteWorkflow(Integer workflow_id);

	//已审核流程的进入功能
	public List<Workflow> findFinishworkflowIN(Integer workflow_id);

	public List<Workflow_data> findFinishworkflowdataIN(Integer userid, Integer workflow_data_id);

}
