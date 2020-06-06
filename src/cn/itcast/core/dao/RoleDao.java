package cn.itcast.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Permission;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;

public interface RoleDao {

	//查找角色最大id
	Integer findRoleMaxId();

	//创建角色
	void addRole(Role role);

	//查询全部角色
	List<Role> findAllRole();

	//查询角色中的用户
	List<Sys_user> roleUserList(@Param("role_id")String role_id);

	//查询没有角色的用户
	List<Sys_user> findAllUserNotRole();

	//角色添加用户
	void UpdateRole_addUser(@Param("user_id")String user_id,@Param("role_id")String role_id);

	//更新角色中的用户（更新用户表的roleid字段为0）
	void Role_UpdateUser(@Param("user_id")String user_id);

	//通过角色id查询角色名称
	String findRoleNameByid(@Param("role_id")String role_id);

	//查询用户表中的角色id字段是否含有这个角色id 返回用户名
	List<Sys_user> findUserRoleid(@Param("role_id")String role_id);

	//删除角色
	void deleteRole(@Param("role_id")String role_id);

	//查询角色中的权限
	List<Head> findRolePermission(@Param("role_id")String role_id);

	//查询角色中尚未添加的权限
	List<Head> findRoleNotPermission(@Param("role_id")String role_id);

	//查询权限表中的最大权限值,如果没有值的话默认为1,若有最大值，则值加1
	Integer findPermissionMaxId();

	//角色添加权限
	void Role_addPermission(Permission permission);

	//查询角色在权限表中是否还有权限
	List<Permission> findPermissionId(@Param("role_id")String role_id);

	//删除角色在权限表中的权限
	void Role_deletePermission(@Param("headid")String headid, @Param("roleid")String roleid);

	//批量删除角色在权限表中的权限
	void Role_UpdateUserMany(@Param("user_id")String user_id);
	
	
	
	
}
