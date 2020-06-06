package cn.itcast.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Permission;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;
import cn.itcast.core.dao.RoleDao;
import cn.itcast.core.service.RoleService;

@Service("roleService")
@Transactional
public class RoleServiceImp implements RoleService {

	
	// 定义dao属性
	@Autowired
	private RoleDao roleDao;
	
	//查找角色最大id
	@Override
	public Integer findRoleMaxId() {
		// TODO Auto-generated method stub
		return roleDao.findRoleMaxId();
		  
	}

	//创建角色
	@Override
	public void addRole(Role role) {
		// TODO Auto-generated method stub
		roleDao.addRole(role);
	}

	//查询全部角色
	@Override
	public List<Role> findAllRole() {
		// TODO Auto-generated method stub
		return roleDao.findAllRole();
	}

	//查询角色中的用户
	@Override
	public List<Sys_user> roleUserList(String role_id) {
		// TODO Auto-generated method stub
		return roleDao.roleUserList(role_id);
	}

	//查询没有角色的用户
	@Override
	public List<Sys_user> findAllUserNotRole() {
		// TODO Auto-generated method stub
		return roleDao.findAllUserNotRole();
	}

	//角色添加用户
	@Override
	public void UpdateRole_addUser(String user_id,String role_id) {
		// TODO Auto-generated method stub
		roleDao.UpdateRole_addUser(user_id,role_id);
	}

	//更新角色中的用户（更新用户表的roleid字段为0）
	@Override
	public void Role_UpdateUser(String user_id) {
		// TODO Auto-generated method stub
		roleDao.Role_UpdateUser(user_id);
	}

	//通过角色id查询角色名称
	@Override
	public String findRoleNameByid(String role_id) {
		// TODO Auto-generated method stub
		return roleDao.findRoleNameByid(role_id);
	}

	//查询用户表中的角色id字段是否含有这个角色id 返回用户名
	@Override
	public List<Sys_user> findUserRoleid(String role_id) {
		// TODO Auto-generated method stub
		return roleDao.findUserRoleid(role_id);
	}

	//删除角色
	@Override
	public void deleteRole(String role_id) {
		// TODO Auto-generated method stub
		roleDao.deleteRole(role_id);
	}

	//查询角色中的权限
	@Override
	public List<Head> findRolePermission(String role_id) {
		// TODO Auto-generated method stub
		return roleDao.findRolePermission(role_id);
	}

	//查询角色中尚未添加的权限
	@Override
	public List<Head> findRoleNotPermission(String role_id) {
		// TODO Auto-generated method stub
		return roleDao.findRoleNotPermission(role_id);
	}

	//查询权限表中的最大权限值,如果没有值的话默认为1,若有最大值，则值加1
	@Override
	public Integer findPermissionMaxId() {
		// TODO Auto-generated method stub
		return roleDao.findPermissionMaxId();
	}

	//角色添加权限
	@Override
	public void Role_addPermission(Permission permission) {
		// TODO Auto-generated method stub
		roleDao.Role_addPermission(permission);
	}

	//查询角色在权限表中是否还有权限
	@Override
	public List<Permission> findPermissionId(String role_id) {
		// TODO Auto-generated method stub
		return roleDao.findPermissionId(role_id);
	}

	//删除角色在权限表中的权限
	@Override
	public void Role_deletePermission(String headid, String roleid) {
		// TODO Auto-generated method stub
		roleDao.Role_deletePermission(headid,roleid);
	}

	//批量删除角色在权限表中的权限
	@Override
	public void Role_UpdateUserMany(String user_id) {
		// TODO Auto-generated method stub
		roleDao.Role_UpdateUserMany(user_id);
	}

 

	 

}
