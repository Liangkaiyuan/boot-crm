package cn.itcast.core.bean;

import java.io.Serializable;
import java.util.List;

public class Sys_user implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer user_id;//用户id
	private String user_code;//用户代码
	private String user_name;//用户登录名
	private String user_password;//用户密码
	private String user_state;//用户账号状态，0为停用，1为正式。
	
	private String user_roleid;
	private String user_departmentid;
	private String department_name;
	private String aaa;//测试
	private String role_id;
	
	private String role_name;
	private String user_a;
	private String user_b;
	private String user_c;
    private String user_pinyin;
    private String user_loginName;
	
	private List<Role> role;
	
	
	
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getUser_roleid() {
		return user_roleid;
	}
	public void setUser_roleid(String user_roleid) {
		this.user_roleid = user_roleid;
	}
	public String getUser_a() {
		return user_a;
	}
	public void setUser_a(String user_a) {
		this.user_a = user_a;
	}
	public String getUser_b() {
		return user_b;
	}
	public void setUser_b(String user_b) {
		this.user_b = user_b;
	}
	public String getUser_c() {
		return user_c;
	}
	public void setUser_c(String user_c) {
		this.user_c = user_c;
	}
	public List<Role> getRole() {
		return role;
	}
	public void setRole(List<Role> role) {
		this.role = role;
	}
 
	public String getAaa() {
		return aaa;
	}
	public void setAaa(String aaa) {
		this.aaa = aaa;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getUser_pinyin() {
		return user_pinyin;
	}
	public void setUser_pinyin(String user_pinyin) {
		this.user_pinyin = user_pinyin;
	}
	public String getUser_loginName() {
		return user_loginName;
	}
	public void setUser_loginName(String user_loginName) {
		this.user_loginName = user_loginName;
	}
	public String getUser_departmentid() {
		return user_departmentid;
	}
	public void setUser_departmentid(String user_departmentid) {
		this.user_departmentid = user_departmentid;
	}
	 
	
	
	
	
	

}
