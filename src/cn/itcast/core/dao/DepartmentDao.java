package cn.itcast.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.core.bean.Department;
import cn.itcast.core.bean.Sys_user;

public interface DepartmentDao {

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

	List<Sys_user> departmentShowUser(@Param("uname1")String uname1);

	//通过用户名查询用户id
	Integer findUserIdByName(@Param("name")String name);

	//跳转到部门编辑
	List<Department> toEditDepartment(@Param("department_id")Integer department_id);

	//编辑部门
	void EditDepartment(Department department1);

	//根据用户拼音查询用户信息
	List<Sys_user> findUserNameByuser_pinyin(@Param("user_pinyin")String user_pinyin);

	//部门查询用户列表
	List<Sys_user> departmentUserList(@Param("department_id")Integer department_id);

	//部门添加用户，查询用户
	List<Sys_user> UserNotdepartment();

	//部门批量添加用户
	void department_addUser(@Param("user_id")String user_id, @Param("department_id")String department_id);

}
