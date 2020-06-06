package cn.itcast.core.service;

import java.util.List;

import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;

 

public interface UserService {

	//查找用户最大id
	Integer findUserMaxId();

	//用户insert方法
	void adduser(Sys_user user);

	//用户列表
	List<Sys_user> userList();

	//编辑用户查询
	List<Sys_user> findUserById(Integer user_id);

	//查询全部角色
	List<Role> findAllRole();

	//用户登录
	Integer userlogin(String username, String password);

	 
}
