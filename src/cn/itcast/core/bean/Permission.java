package cn.itcast.core.bean;

import java.io.Serializable;

public class Permission implements  Serializable  {
	
	private Integer permission_id;
	private String permission_name;
	private String permission_roleid;
	private String permission_type;
	private String permission_headname;
	private String permission_headid;
	
	
	public Integer getPermission_id() {
		return permission_id;
	}
	public void setPermission_id(Integer permission_id) {
		this.permission_id = permission_id;
	}
	public String getPermission_name() {
		return permission_name;
	}
	public void setPermission_name(String permission_name) {
		this.permission_name = permission_name;
	}
	public String getPermission_roleid() {
		return permission_roleid;
	}
	public void setPermission_roleid(String permission_roleid) {
		this.permission_roleid = permission_roleid;
	}
	public String getPermission_type() {
		return permission_type;
	}
	public void setPermission_type(String permission_type) {
		this.permission_type = permission_type;
	}
	public String getPermission_headname() {
		return permission_headname;
	}
	public void setPermission_headname(String permission_headname) {
		this.permission_headname = permission_headname;
	}
	public String getPermission_headid() {
		return permission_headid;
	}
	public void setPermission_headid(String permission_headid) {
		this.permission_headid = permission_headid;
	}

	
	
}
