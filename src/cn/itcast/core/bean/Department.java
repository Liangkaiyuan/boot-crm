package cn.itcast.core.bean;

import java.io.Serializable;

public class Department implements  Serializable  {

	
	 private Integer department_id ;
	 private String department_name ;
	 private String department_zhuguanji ;
	 
	 private String department_jingliji ;

	 private String department_zongjianji ;

	 private String department_fuzongjingliji ;

	 private String department_zongjingliji ;

	public Integer getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(Integer department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getDepartment_zhuguanji() {
		return department_zhuguanji;
	}
	public void setDepartment_zhuguanji(String department_zhuguanji) {
		this.department_zhuguanji = department_zhuguanji;
	}
	public String getDepartment_jingliji() {
		return department_jingliji;
	}
	public void setDepartment_jingliji(String department_jingliji) {
		this.department_jingliji = department_jingliji;
	}
	public String getDepartment_zongjianji() {
		return department_zongjianji;
	}
	public void setDepartment_zongjianji(String department_zongjianji) {
		this.department_zongjianji = department_zongjianji;
	}
	public String getDepartment_fuzongjingliji() {
		return department_fuzongjingliji;
	}
	public void setDepartment_fuzongjingliji(String department_fuzongjingliji) {
		this.department_fuzongjingliji = department_fuzongjingliji;
	}
	public String getDepartment_zongjingliji() {
		return department_zongjingliji;
	}
	public void setDepartment_zongjingliji(String department_zongjingliji) {
		this.department_zongjingliji = department_zongjingliji;
	}
	 
	
}
