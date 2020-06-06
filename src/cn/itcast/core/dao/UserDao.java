package cn.itcast.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;

/**
 * 用户dao
 * @author Administrator
 *
 */
public interface UserDao {

	//查找用户最大的id
	public Integer findUserMaxId();

	//用户insert方法
	public void adduser(Sys_user user);

	//查询用户
	public List<Sys_user> userList();

	//编辑用户查询
	public List<Sys_user> findUserById(@Param("user_id")Integer user_id);

	//查询全部角色
	public List<Role> findAllRole();

	//用户登录
	public Integer userlogin(@Param("username")String username, @Param("password")String password);
 
}
