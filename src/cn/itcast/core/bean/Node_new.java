package cn.itcast.core.bean;

import java.io.Serializable;

public class Node_new implements  Serializable  {
      private Integer node_id;//节点信息id
	 private String node_workflowid;//流程信息id
	 private String node_workflowname;
	 private String node_approvalone; //创建者
	 private String node_approvaltwo; //第一审批信息
	 private String node_approvalthree; 
	  private String node_approvalfour; 
	  private String node_approvalfive; 
	  private String node_approvalsix;  //归档
	  
	  private String node_approvalname;
	public Integer getNode_id() {
		return node_id;
	}
	public void setNode_id(Integer node_id) {
		this.node_id = node_id;
	}
	public String getNode_workflowid() {
		return node_workflowid;
	}
	public void setNode_workflowid(String node_workflowid) {
		this.node_workflowid = node_workflowid;
	}
	public String getNode_approvalone() {
		return node_approvalone;
	}
	public void setNode_approvalone(String node_approvalone) {
		this.node_approvalone = node_approvalone;
	}
	public String getNode_approvaltwo() {
		return node_approvaltwo;
	}
	public void setNode_approvaltwo(String node_approvaltwo) {
		this.node_approvaltwo = node_approvaltwo;
	}
	public String getNode_approvalthree() {
		return node_approvalthree;
	}
	public void setNode_approvalthree(String node_approvalthree) {
		this.node_approvalthree = node_approvalthree;
	}
	public String getNode_approvalfour() {
		return node_approvalfour;
	}
	public void setNode_approvalfour(String node_approvalfour) {
		this.node_approvalfour = node_approvalfour;
	}
	public String getNode_approvalfive() {
		return node_approvalfive;
	}
	public void setNode_approvalfive(String node_approvalfive) {
		this.node_approvalfive = node_approvalfive;
	}
	public String getNode_approvalsix() {
		return node_approvalsix;
	}
	public void setNode_approvalsix(String node_approvalsix) {
		this.node_approvalsix = node_approvalsix;
	}
	public String getNode_workflowname() {
		return node_workflowname;
	}
	public void setNode_workflowname(String node_workflowname) {
		this.node_workflowname = node_workflowname;
	}
	public String getNode_approvalname() {
		return node_approvalname;
	}
	public void setNode_approvalname(String node_approvalname) {
		this.node_approvalname = node_approvalname;
	}
	  

}
