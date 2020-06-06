package cn.itcast.core.service;

import java.util.List;

import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;
import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Permission;
 

public interface RoleService {

	//查询角色最大id
	Integer findRoleMaxId();

	//创建角色
	void addRole(Role role);

	//查询全部角色
	List<Role> findAllRole();

	//查询角色中的全部用户
	List<Sys_user> roleUserList(String role_id);

	//查询没有角色的用户
	List<Sys_user> findAllUserNotRole();

	//角色添加用户
	void UpdateRole_addUser(String user_id,String role_id);

	//更新角色中的用户（更新用户表的roleid字段为0）
	void Role_UpdateUser(String user_id);

	//通过角色id查询角色名称
	String findRoleNameByid(String role_id);

	//查询用户表中的角色id字段是否含有这个角色id 返回用户名
	List<Sys_user> findUserRoleid(String role_id);

	//删除角色，更新状态值为0
	void deleteRole(String role_id);

	//查询角色中的权限
	List<Head> findRolePermission(String role_id);

	//查询角色中尚未添加的权限
	List<Head> findRoleNotPermission(String role_id);

	//查询权限表中的最大权限值,如果没有值的话默认为1,若有最大值，则值加1
	Integer findPermissionMaxId();

	//角色添加权限
	void Role_addPermission(Permission permission);

	//查询角色在权限表中是否还有权限
	List<Permission> findPermissionId(String role_id);
	
	//删除角色在权限表中的权限
	void Role_deletePermission(String headid, String roleid);

	//批量删除角色在权限表中的权限
	void Role_UpdateUserMany(String user_id);
	

}
