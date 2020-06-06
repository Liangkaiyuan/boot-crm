package cn.itcast.core.bean;

import java.io.Serializable;

public class Role implements  Serializable  {
	
 
private Integer role_id;//角色id
private String role_name;//角色名称
private String role_memo;//角色备注
private String role_up;//上级角色
private String role_dpm;//角色部门
private String role_a;//角色
private String role_b;
private String role_c;
private String role_status;



public String getRole_status() {
	return role_status;
}
public void setRole_status(String role_status) {
	this.role_status = role_status;
}
public Integer getRole_id() {
	return role_id;
}
public void setRole_id(Integer role_id) {
	this.role_id = role_id;
}
public String getRole_name() {
	return role_name;
}
public void setRole_name(String role_name) {
	this.role_name = role_name;
}
public String getRole_memo() {
	return role_memo;
}
public void setRole_memo(String role_memo) {
	this.role_memo = role_memo;
}
public String getRole_up() {
	return role_up;
}
public void setRole_up(String role_up) {
	this.role_up = role_up;
}
public String getRole_dpm() {
	return role_dpm;
}
public void setRole_dpm(String role_dpm) {
	this.role_dpm = role_dpm;
}
public String getRole_a() {
	return role_a;
}
public void setRole_a(String role_a) {
	this.role_a = role_a;
}
public String getRole_b() {
	return role_b;
}
public void setRole_b(String role_b) {
	this.role_b = role_b;
}
public String getRole_c() {
	return role_c;
}
public void setRole_c(String role_c) {
	this.role_c = role_c;
}
 


}
