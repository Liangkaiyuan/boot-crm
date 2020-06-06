package cn.itcast.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.Workflow;
import cn.itcast.core.bean.Workflow_data;
 

/*
 * 流程dao层
 */
public interface WorkflowDao {

	//创建流程方法
	void CreateWorkflow(Workflow workflow);

	//获取最大的流程表最大id
	Integer getWorkflowMaxId();

	//查询全部流程信息
	List<Workflow> findWorkflowList(@Param("start")Integer start, @Param("rows")Integer rows);

	//根据流程id返回某个流程的显示信息
	List<Workflow> ShowWorkflowOne(@Param("workflow_id")Integer workflow_id);
	
	//获取流程信息存储表里的最大id
	Integer findWorkflowDataMaxId();

	//添加对应的数据到数据信息存储表中
	void addworkflowdata(Workflow_data workflow_data);

	//通过用户id查询用户有关的所有流程名称
	List<Workflow> findworkflowByUserid(@Param("userid")Integer userid);

	//查询用户未审核完成的流程信息
	List<Workflow_data> findNotFinishworkflowdata(@Param("userid")Integer userid);

	//查询用户已审核完成的流程信息
	List<Workflow_data> findFinishworkflowdata(Integer userid);

	//未审核流程的进入功能
	List<Workflow_data> findNotFinishworkflowdataIN(@Param("userid")Integer userid,@Param("workflow_data_id")Integer workflow_data_id);

	//查询该流程中对应的显示字段信息
	List<Workflow> findNotFinishworkflowIN(@Param("workflow_id")Integer workflow_id);

	//通过流程id查询流程信息
	List<Workflow> findWorkflowByid(@Param("workflow_id")Integer workflow_id);

	//更新流程字段信息
	void updateWorkflow(Workflow workflow);

	//查找有效流程
	List<Workflow> findworkflowNormal();

	//删除流程
	void deleteWorkflow(@Param("workflow_id")Integer workflow_id);

	//查询已经审核的流程
	List<Workflow> findFinishworkflowIN(@Param("workflow_id")Integer workflow_id);

	//查询已经审核的流程进入
	List<Workflow_data> findFinishworkflowdataIN(@Param("userid")Integer userid, @Param("workflow_data_id")Integer workflow_data_id);

}
