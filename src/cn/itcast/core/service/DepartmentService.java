package cn.itcast.core.service;

import java.util.List;

import cn.itcast.core.bean.Department;
import cn.itcast.core.bean.Sys_user;

public interface DepartmentService {

	//查询部门最大id
	Integer findDepartmentMaxId();

	//创建部门
	void addDepartment(Department department);

	//查询部门全部信息
	List<Department> findDepartmentAll();

	//查询全部用户
	List<Sys_user> selectDepartment();

	//查询单个部门
	Department selectDepartmentOne(Long department_id);

	List<Sys_user> departmentShowUser(String uname1);

	
	Integer findUserIdByName(String name);

	//跳转到单个部门
	List<Department> toEditDepartment(Integer department_id);

	//编辑部门
	void EditDepartment(Department department1);

	//根据用户名字首拼查找用户
	List<Sys_user> findUserNameByuser_pinyin(String user_pinyin);

	//部门查询用户列表
	List<Sys_user> departmentUserList(Integer department_id);

	//部门添加用户，查询用户
	List<Sys_user> UserNotdepartment();

	//部门批量添加用户
	void department_addUser(String user_id, String department_id);

}
