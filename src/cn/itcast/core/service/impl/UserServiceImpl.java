package cn.itcast.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;
import cn.itcast.core.dao.UserDao;
import cn.itcast.core.dao.WorkflowDao;
import cn.itcast.core.service.UserService;
@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {

	
	// 定义dao属性
		@Autowired
		private UserDao userDao;
		
		
	//查找用户最大id
	@Override
	public Integer findUserMaxId() {
		
		return userDao.findUserMaxId();
		// TODO Auto-generated method stub

	}

	/**
	 * 用户insert方法
	 */
	@Override
	public void adduser(Sys_user user) {
		// TODO Auto-generated method stub
		userDao.adduser(user);
		
	}

	//用户列表
	@Override
	public List<Sys_user> userList() {
		// TODO Auto-generated method stub
		return userDao.userList();
	}

	//编辑用户查询
	@Override
	public List<Sys_user> findUserById(Integer user_id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(user_id);
	}

	//查询全部角色
	@Override
	public List<Role> findAllRole() {
		// TODO Auto-generated method stub
		return userDao.findAllRole();
	}

	//用户登录
	@Override
	public Integer userlogin(String username, String password) {
		// TODO Auto-generated method stub
		return userDao.userlogin(username,password);
	}

 

}
