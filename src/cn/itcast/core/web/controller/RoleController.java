package cn.itcast.core.web.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Permission;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;
import cn.itcast.core.service.RoleService;

 

@Controller
public class RoleController implements  Serializable  {
	
	// 依赖注入
	@Autowired
	private RoleService roleService;
	//跳转到添加角色界面
     @RequestMapping(value = "/toaddRole")
	 public String toaddRole() {
	    return "addrole";
	 }
     
     
     
     //添加角色
     @RequestMapping(value = "/addRole")
	 public String addRole(Role role,HttpServletRequest request,HttpSession httpSession) {
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 Integer RoleMaxId = null;
    	 String head_name = (String) request.getSession().getAttribute("head_name");
 		if(uname!=null && head_name!=null) {
 			//查询最大的角色表id若为空则设置为1，不为空则加1
 			Integer rolemax = roleService.findRoleMaxId();
 			if(rolemax!=null) {
 				  RoleMaxId=rolemax+1;
 			}else {
 				RoleMaxId=1;
 			}
 			//设置角色id
 			role.setRole_id(RoleMaxId);
 			//创建角色
 			role.setRole_status("1");
 			roleService.addRole(role);
 		return "redirect:/toaddRole.action";
 		}else {
 		return "redirect:/showlogin.action";
 		}
	 }
     
     //查询全部角色
     @RequestMapping(value = "/roleList")
	 public String roleList(Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
 		if(uname!=null && head_name!=null) {
 			List<Role> role = roleService.findAllRole();
 			model.addAttribute("page", role);
 			
 		return "roleList";
 		}else {
 		return "redirect:/showlogin.action";
 		}
	 }
     
     //查询角色中的用户
     @RequestMapping(value = "/Role_userList")
	 public String roleUserList(String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 
    	 model.addAttribute("role_id",role_id);
    	 
 		if(uname!=null && head_name!=null) {
 			//查找用户表这个角色的用户有多少个的列表，返回一个用户
 		
 				List<Sys_user> sys_user = roleService.roleUserList(role_id);
 				
 				
 					System.out.println(sys_user+"用户集合");
 	 	 			model.addAttribute("page", sys_user);
 	 	 			
 	 	 			//查询角色的名称通过角色id
 	 	 			String role_name =  roleService.findRoleNameByid(role_id);
 		 			
 		 			model.addAttribute("role_name",role_name);
 		 			model.addAttribute("role_id",role_id);
 				
 				
			
 			
 			
 		return "role_userlist";
 		}else {
 		return "redirect:/showlogin.action";
 		}
	 }
	 
	  //角色跳转到用户，此方法在role_userlist.jsp
     @RequestMapping(value = "/Role_toaddUser")
	 public String Role_toaddUser(String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
 		if(uname!=null && head_name!=null) {
 	
 			System.out.println("角色跳转到用户成功");
 			System.out.println("角色低为"+role_id);
 			//查找用户表没有角色的用户（即user_roleid为空或者为0），
 			List<Sys_user> sys_user = roleService.findAllUserNotRole();
 			System.out.println(sys_user+"添加用户集合");
 			
 			model.addAttribute("page", sys_user);
 			List<Sys_user> user = roleService.roleUserList(role_id);
 			System.out.println(1);
 			System.out.println(user);
 			System.out.println(user.size()+"用户长度");
 			/*System.out.println(user.get(0).getRole_name());
 			System.out.println(2);

 			String role_name = user.get(0).getRole_name();
 			System.out.println(3);

 			model.addAttribute("role_name", role_name);*/
 			System.out.println(4);

 			model.addAttribute("role_id", role_id);

	 			//查询角色的名称通过角色id
	 			String role_name =  roleService.findRoleNameByid(role_id);
	 			
	 			model.addAttribute("role_name",role_name);
	 			
 			System.out.println(5);

 			System.out.println("角色跳转到用户"+role_id);
 			
 		return "role_adduser";
 		}else {
 		return "redirect:/showlogin.action";
 		}
	 }
     //角色添加用户(更新) 此方法在role_adduser.jsp提交
     @RequestMapping(value = "/addrole_user")
     public String Role_addUser(String user_id,String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 if(uname!=null && head_name!=null) {
    		  System.out.println("角色添加用户"+user_id);
    		  System.out.println("角色添加用户"+role_id);
    		  
    	        String s6 = role_id;
    	        String[] words6 = s6.split(",");
    	        String roleid = words6[0];
    	        System.out.println(roleid+"角色id");
    		  //更新用户表
    		  System.out.println("("+user_id+")"+"("+roleid+")");
    		  roleService.UpdateRole_addUser("("+user_id+")","("+roleid+")");
    		  
    		  
    		 return "redirect:/Role_userList.action?role_id="+roleid;
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
     
     
     //*删除角色中的用户    删除单个
     @RequestMapping(value = "/role_deleteuser")
     public String Role_deleteUser(String user_id,String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 if(uname!=null && head_name!=null) {
    		//更新角色中的用户（更新用户表的roleid字段为0）
    		 roleService.Role_UpdateUser(user_id);
    		  System.out.println("角色跳转到"+role_id);
    		  System.out.println("删除用户id为："+user_id);
    		 return "redirect:/Role_userList.action?role_id="+role_id;
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
     
     
     //*删除角色中的用户    批量删除
     @RequestMapping(value = "/Role_deleteUserMany")
     public String Role_deleteUserMany(String user_id,String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 if(uname!=null && head_name!=null) {
    		 
    		 System.out.println("批量删除用户"+user_id);

    		 System.out.println("("+user_id+")");
    		 String userid = "("+user_id+")";
    		 
    		  
    		 roleService.Role_UpdateUserMany(userid);
  	        System.out.println("执行成功"+userid);
  	     // roleService.Role_UpdateUserMany(user);
    		
    		
  	      String s6 = role_id;
	        String[] words6 = s6.split(",");
	        String roleid = words6[0];
	        System.out.println(roleid+"角色id");
	        
    		 return "redirect:/Role_userList.action?role_id="+roleid;
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
     
     
     
     

     //*删除角色（即角色中不能有用户关联着）
     @RequestMapping(value = "/deleteRole")
     public String deleteRole(String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 if(uname!=null && head_name!=null) {
    		 
    		 //查询角色中是否有用户,查询用户表中的角色id字段是否含有这个角色id 返回用户名
    		 List<Sys_user> username = roleService.findUserRoleid(role_id);
    		 
    		 
    		 //查询权限表中是否有角色id的对应权限，有的话不能删除
    		 List<Permission> permission = roleService.findPermissionId(role_id);
    		 
    		 System.out.println(username+"1111用户名集合");
    		 System.out.println(username.size()+"用户名集合长度");
    		 if(username.size()==0 && permission.size() ==0) {
    			 //若没有用户，角色状态字段更新为0
    			 roleService.deleteRole(role_id);
    			 System.out.println(username+"用户名集合");
    			 System.out.println("删除成功");

    			 String success="删除成功";
     	 		model.addAttribute("success", success);
     	 		return "roleList";
    		 }else {
    			 //若有则更新失败
    			 model.addAttribute("username", username);
    			 System.out.println("删除失败");
    	 		String erro="删除失败，角色绑定用户或权限，请先删除";
    	 		model.addAttribute("erro", erro);
    	 		return "roleList";
			}
    		//更新角色中的角色状态字段为0
    		
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
   //*角色权限 点击授权之后跳转
     @RequestMapping(value = "/role_permission")
     public String Role_permission(String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 
    	 //直接获取用户id
    	 String user_id = (String) request.getSession().getAttribute("user_id");
    	 
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 
    	 if(uname!=null && head_name!=null) {
    		 //操作
    		 //根据角色id来查询角色中的权限，前端返回一个角色id，返回一个head对象
    		 
    		 List<Head> head = roleService.findRolePermission(role_id);
    		 
    		 model.addAttribute("head", head);
    		 model.addAttribute("role_id", role_id);
    		 
    		 return "role_permission";
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
     
   //*角色权限 点击添加权限 显示角色已有权限
     @RequestMapping(value = "/Role_toaddPermission")
     public String Role_toaddPermission(String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 
    	 //直接获取用户id
    	 String user_id = (String) request.getSession().getAttribute("user_id");
    	 
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 
    	 if(uname!=null && head_name!=null) {
    		 //操作
    		 //查询角色中尚未添加的权限
    		 
    		 List<Head> head = roleService.findRoleNotPermission(role_id);
    		 
    		 model.addAttribute("head", head);
    		 model.addAttribute("role_id", role_id);
    		 
    		 return "role_addpermission";
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
     
   //*角色权限 提交添加的权限
     @RequestMapping(value = "/role_addPermission")
     public String Role_addPermission(String role_id,String head_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 
    	 //直接获取用户id
    	 String user_id = (String) request.getSession().getAttribute("user_id");
    	 
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 
    	 if(uname!=null && head_name!=null) {
    		 //操作
    		 
    		 //获取角色id中的第一个 因为都是一样的
    		 String s6 = role_id;
 	        String[] words6 = s6.split(",");
 	       
 	        String roleid = words6[0];
 	       System.out.println("角色id为"+roleid);
 	       
    		 
 	      //查询权限表中的最大权限值,如果没有值的话默认为1,若有最大值，则值加1
 	   	     
 	       
    		 //查询角色中尚未添加的权限
    		  String s5 = head_id;
   	        String[] words5 = s5.split(",");
   	        for(int i=0;i<words5.length;i++) {
   	        	String headid = words5[i];
   	        	//为权限对象添加属性
   	        	Integer permissionMaxId = roleService.findPermissionMaxId();
 	   	        if(permissionMaxId ==null) {
 	   	        	permissionMaxId=1;
 	   	        }else {
 	   	        	permissionMaxId = permissionMaxId+1;
 				}
   	        	Permission permission = new Permission();
   	        	permission.setPermission_headid(headid);
   	        	permission.setPermission_roleid(roleid);
   	        	permission.setPermission_id(permissionMaxId);
   	   	        //批量添加权限 传递一个权限Permission对象
   	   	        roleService.Role_addPermission(permission);
      		  System.out.println(i+"标题id为"+headid);
   	        }
    		 //跳转到已经添加完权限的角色权限列表  role_permission.jsp页面
    		 return "redirect:role_permission.action?role_id="+roleid;
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
   //*删除角色权限  批量删除
     @RequestMapping(value = "/role_deletePermission")
     public String Role_deletePermission(String head_id,String role_id,Model model,HttpServletRequest request,HttpSession httpSession) {
    	 
    	 //获取登录用户名称判断用户是否登录
    	 String uname = (String) request.getSession().getAttribute("username");
    	 String head_name = (String) request.getSession().getAttribute("head_name");
    	 if(uname!=null && head_name!=null) {
    		  
    		 String s6 = role_id;
  	        String[] words6 = s6.split(",");
  	        String roleid = words6[0];
  	        
   		  
   		  
   		  
  	     String s5 = head_id;
	        String[] words5 = s5.split(",");
	        for(int i=0;i<words5.length;i++) {
	        	String headid = words5[i];
	        	System.out.println(roleid);
	        	System.out.println(headid);
	        	//为权限对象添加属性
	   	        //批量删除 传递一个权限Permission对象
	        	roleService.Role_deletePermission(headid,roleid);
	        	System.out.println(roleid);
	        	System.out.println(headid);
	        }
	    
    		  
    		  
    		 return "redirect:/role_permission.action?role_id"+roleid;
    	 }else {
    		 return "redirect:/showlogin.action";
    	 }
     }
     
     
     
}
