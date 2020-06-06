package cn.itcast.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.core.bean.Department;
import cn.itcast.core.bean.Sys_user;
import cn.itcast.core.dao.DepartmentDao;
import cn.itcast.core.service.DepartmentService;

@Service("departmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	
	// 定义dao属性
			@Autowired
			private DepartmentDao departmentDao;
	
	//查询部门最大id
	@Override
	public Integer findDepartmentMaxId() {
		// TODO Auto-generated method stub
		return departmentDao.findDepartmentMaxId();
	}

	//创建部门 
	@Override
	public void addDepartment(Department department) {
		// TODO Auto-generated method stub
		departmentDao.addDepartment(department);
	}

	//查询部门全部信息
	@Override
	public List<Department> findDepartmentAll() {
		// TODO Auto-generated method stub
		return departmentDao.findDepartmentAll();
	}

	//查询全部用户
	@Override
	public List<Sys_user> selectDepartment() {
		// TODO Auto-generated method stub
		return departmentDao.selectDepartment();
	}

	//查询单个部门
	@Override
	public Department selectDepartmentOne(Long department_id) {
		// TODO Auto-generated method stub
		return departmentDao.selectDepartmentOne(department_id);
	}

	@Override
	public List<Sys_user> departmentShowUser(String uname1) {
		// TODO Auto-generated method stub
		return departmentDao.departmentShowUser(uname1);
	}

	//通过用户名查询用户id
	@Override
	public Integer findUserIdByName(String name) {
		// TODO Auto-generated method stub
		return departmentDao.findUserIdByName(name);
	}

	//跳转到部门编辑界面
	@Override
	public List<Department> toEditDepartment(Integer department_id) {
		// TODO Auto-generated method stub
		return departmentDao.toEditDepartment(department_id);
	}

	//编辑部门
	@Override
	public void EditDepartment(Department department1) {
		// TODO Auto-generated method stub
		departmentDao.EditDepartment(department1);
	}

	//根据用户名字首拼查询用户信息
	@Override
	public List<Sys_user> findUserNameByuser_pinyin(String user_pinyin) {
		// TODO Auto-generated method stub
		return departmentDao.findUserNameByuser_pinyin(user_pinyin);
	}

	//部门查询用户列表
	@Override
	public List<Sys_user> departmentUserList(Integer department_id) {
		// TODO Auto-generated method stub
		return departmentDao.departmentUserList(department_id);
	}

	//部门添加用户，查询用户
	@Override
	public List<Sys_user> UserNotdepartment() {
		// TODO Auto-generated method stub
		return departmentDao.UserNotdepartment();
	}
	
	//部门批量添加用户
	@Override
	public void department_addUser(String user_id, String department_id) {
		// TODO Auto-generated method stub
		departmentDao.department_addUser(user_id,department_id);
	}

}
