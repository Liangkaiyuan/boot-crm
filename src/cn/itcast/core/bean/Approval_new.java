package cn.itcast.core.bean;

import java.io.Serializable;

public class Approval_new implements  Serializable  {
/**
 * 审批信息表
 */
	 private Integer approval_id;
	 private String approval_name;
	 private String approval_type;
	 private String approval_value;
	
	public Integer getApproval_id() {
		return approval_id;
	}
	public void setApproval_id(Integer approval_id) {
		this.approval_id = approval_id;
	}
	public String getApproval_name() {
		return approval_name;
	}
	public void setApproval_name(String approval_name) {
		this.approval_name = approval_name;
	}
	public String getApproval_type() {
		return approval_type;
	}
	public void setApproval_type(String approval_type) {
		this.approval_type = approval_type;
	}
	public String getApproval_value() {
		return approval_value;
	}
	public void setApproval_value(String approval_value) {
		this.approval_value = approval_value;
	}
	 
	 
}
