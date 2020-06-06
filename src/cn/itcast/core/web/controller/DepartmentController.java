package cn.itcast.core.web.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.core.bean.Department;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;
import cn.itcast.core.service.DepartmentService;

 

@Controller
public class DepartmentController implements  Serializable {

 
	
	// 依赖注入
		@Autowired
		private DepartmentService departmentService;
	
		
		//跳转到添加部门界面
	     @RequestMapping(value = "/Department/toaddDepartment.action")
		 public String toaddDepartment(Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			 
	 			
	 			List<Sys_user> user1 = departmentService.selectDepartment();
	 		 	ArrayList<String> list = new ArrayList<String>();
	 		 	for(int i=0;i<user1.size();i++) {
	 		 		list.add("'"+user1.get(i).getUser_loginName()+"'");
	 		 	}
	 		 	String user2 =list.toString();
	 		 	/*String str = user1.substring(1, user1.length()-1); 
	 		 	System.out.println(str);*/
	 		 	
	 		 	Map<String, String> map = new HashMap<String, String>(); 
	            map.put("sdl","苏打绿");
	            map.put("sdl1","苏打绿1");
	            map.put("sdl","苏打蓝");
	 		 	
	            model.addAttribute("map", map);
	 		 	
	 			model.addAttribute("list", user2);
	 			
	 		return "addDepartment";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	     
	     
	   //标题跳转到部门管理
	     @RequestMapping(value = "/Department/showDepartment.action")
		 public String showDepartment(Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			
	 			
	 			List<Department> department = departmentService.findDepartmentAll();
	 			
	 			model.addAttribute("page", department);
	 			
	 			
	 			List<Sys_user> user = departmentService.selectDepartment();
	 			
	 			model.addAttribute("user", user);
	 			
	 			
	 		return "departmentList";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
		
		
		//添加部门
	     @RequestMapping(value = "/Department/addDepartment.action")
		 public String addDepartment(Department department,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 Integer DepartmentMaxId = null;
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			//查询最大的角色表id若为空则设置为1，不为空则加1
	 			Integer DepartmentMax = departmentService.findDepartmentMaxId();
	 			if(DepartmentMax!=null) {
	 				DepartmentMaxId=DepartmentMax+1;
	 			}else {
	 				DepartmentMaxId=1;
	 			}
	 			
	 			//部门名称
	 			String department_name = department.getDepartment_name();
	 			
	 			//主管级
	 			
	 			String department_zhuguanji = department.getDepartment_zhuguanji();
	 			Integer department_zhuguanji1 =departmentService.findUserIdByName(department_zhuguanji);
	 			
	 			//经理级
	 			String department_jingliji = department.getDepartment_jingliji();
	 			Integer department_jingliji1 = departmentService.findUserIdByName(department_jingliji);
	 			//总监级
	 			String department_zongjianji = department.getDepartment_zongjianji();
	 			Integer department_zongjianji1 = departmentService.findUserIdByName(department_zongjianji);
	 			//副总经理
	 			String department_fuzongjingliji = department.getDepartment_fuzongjingliji();
	 			Integer department_fuzongjingliji1 = departmentService.findUserIdByName(department_fuzongjingliji);

	 			//总经理
	 			String department_zongjingliji = department.getDepartment_zongjingliji();
	 			Integer department_zongjingliji1 = departmentService.findUserIdByName(department_zongjingliji);

	 			//重新创建部门对象，通过执行查询人名对应的角色id
	 			Department department1 = new Department();
	 			
	 			department1.setDepartment_zhuguanji(department_zhuguanji1+"");
	 			department1.setDepartment_jingliji(department_jingliji1+"");
	 			department1.setDepartment_zongjianji(department_zongjianji1+"");
	 			department1.setDepartment_fuzongjingliji(department_fuzongjingliji1+"");
	 			department1.setDepartment_zongjingliji(department_zongjingliji1+"");
	 			department1.setDepartment_name(department_name);
	 			
	 			//设置部门id
	 			department1.setDepartment_id(DepartmentMaxId);
	 			//创建部门
	 			departmentService.addDepartment(department1);
	 		return "redirect:/Department/showDepartment.action";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
		
	     
	  
	     
	     
	     @RequestMapping(value = "/department/showUser.action")
		 public String departmentShowUser(String uname1,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws ServletException, IOException {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			List<Sys_user> user = departmentService.departmentShowUser(uname1);
	 		
	 			
	 			request.setAttribute("unames", user);
	 			request.getRequestDispatcher("divLns.jsp").forward(request, response);
	 			
	 			
	 			model.addAttribute("user", user);
	 		return "divLns";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	
	     
	     /*@RequestMapping(value = "/Department/toLianxiang.action")
		 public String toDepartment(Long department_id,Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 		 	List<Sys_user> user = departmentService.selectDepartment();
	 		 	ArrayList<String> list = new ArrayList<String>();
	 		 	for(int i=0;i<user.size();i++) {
	 		 		System.out.println(user.get(i).getUser_name());
	 		 		list.add("'"+user.get(i).getUser_name()+"'");
	 		 	}
	 		 	System.out.println(list.toString());
	 		 	String user1 =list.toString();
	 		 	String str = user1.substring(1, user1.length()-1); 
	 		 	System.out.println(str);
	 			model.addAttribute("list", user1);
	 			//System.out.println(user);
	 		return "lianxiang";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	     */
	     
	     
	     
	     //跳转到编辑界面
	     @RequestMapping(value = "/Department/toEditDepartment.action")
		 public String toEditDepartment(Integer department_id,Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			List<Sys_user> user = departmentService.selectDepartment();
	 		 	ArrayList<String> list = new ArrayList<String>();
	 		 	for(int i=0;i<user.size();i++) {
	 		 		list.add("'"+user.get(i).getUser_loginName()+"'");
	 		 	}
	 		 	String user1 =list.toString();
	 			model.addAttribute("list", user1);
	 			
	 			
	 			//////////////////////
	 			/* for (int i=0;i<user1.length();i++){
	                    if(user1[i].indexOf("1")>-1){
	                        System.out.println(user1[i]);
	                         
	                    }
	 			*/
	 			
	 			////////////////////
	 			
	 			
	 			
	 			List<Department> department = departmentService.toEditDepartment(department_id);
	 			
	 			model.addAttribute("department", department);
	 			
	 		return "editDepartment";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	     
	     
	     //跳转到编辑界面
	     @RequestMapping(value = "/Department/EditDepartment.action")
		 public String EditDepartment(Department department,Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 		 
	 			//获取部门id
	 			Integer department_id = department.getDepartment_id();
	 			
	 			//部门名称
	 			String department_name = department.getDepartment_name();
	 			
	 			//主管级获取用户id
	 			
	 			String department_zhuguanji = department.getDepartment_zhuguanji();
	 			Integer department_zhuguanji1 =departmentService.findUserIdByName(department_zhuguanji);
	 			
	 			//经理级
	 			String department_jingliji = department.getDepartment_jingliji();
	 			Integer department_jingliji1 = departmentService.findUserIdByName(department_jingliji);
	 			//总监级
	 			String department_zongjianji = department.getDepartment_zongjianji();
	 			Integer department_zongjianji1 = departmentService.findUserIdByName(department_zongjianji);
	 			//副总经理
	 			String department_fuzongjingliji = department.getDepartment_fuzongjingliji();
	 			Integer department_fuzongjingliji1 = departmentService.findUserIdByName(department_fuzongjingliji);

	 			//总经理
	 			String department_zongjingliji = department.getDepartment_zongjingliji();
	 			Integer department_zongjingliji1 = departmentService.findUserIdByName(department_zongjingliji);

	 			//重新创建部门对象，通过执行查询人名对应的角色id
	 			Department department1 = new Department();
	 			
	 			department1.setDepartment_zhuguanji(department_zhuguanji1+"");
	 			department1.setDepartment_jingliji(department_jingliji1+"");
	 			department1.setDepartment_zongjianji(department_zongjianji1+"");
	 			department1.setDepartment_fuzongjingliji(department_fuzongjingliji1+"");
	 			department1.setDepartment_zongjingliji(department_zongjingliji1+"");
	 			department1.setDepartment_name(department_name);
	 			department1.setDepartment_id(department_id);
	 			//设置部门id
	 			 
	 			//编辑部门
	 			departmentService.EditDepartment(department1);
	 			
	 			
	 			
	 			
	 			System.out.println("更新成功");
	 			
	 			
	 			//跳转到部门管理界面
	 		return "redirect:/Department/showDepartment.action";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	     
	     
	     
	     //ajax数据同步显示
	     //跳转到编辑界面
	     @RequestMapping(value = "/Department/findUserNameByuser_pinyin.action")
		 public String findUserName(String user_pinyin,Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			
	 			System.out.println(user_pinyin+"传递成功");
	 			
	 			 List<Sys_user> pinyinList = departmentService.findUserNameByuser_pinyin(user_pinyin);
	 			
	 			System.out.println(pinyinList.toString()+"拼音查询");
	 		  
	 			
	 		 return pinyinList.toString();
	 			
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	     
	     
	     //部门用户列表
	     @RequestMapping(value = "/Department/departmentUserList.action")
		 public String departmentUserList(Integer department_id,Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			 
	 			List<Sys_user> departmentUser = departmentService.departmentUserList(department_id);
	 			//System.out.println(departmentUser+"部门用户列表");
	 			model.addAttribute("page", departmentUser);
	 			model.addAttribute("department_id",department_id);
	 		return "departmentUserList";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	     
	     
	   //部门添加用户，查询用户
	     @RequestMapping(value = "/Department/departmentFindUser.action")
		 public String departmentFindUser(String department_id,Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	 		if(uname!=null && head_name!=null) {
	 			 //查询所有没有部门的用户
	 			List<Sys_user> UserNotdepartment = departmentService.UserNotdepartment();
	 			//System.out.println(departmentUser+"部门用户列表");
	 			model.addAttribute("page", UserNotdepartment);
	 			model.addAttribute("department_id", department_id);
	 		return "department_adduser";
	 		}else {
	 		return "redirect:/showlogin.action";
	 		}
		 }
	     
	     
	     
	   //角色添加用户(更新) 此方法在role_adduser.jsp提交
	     @RequestMapping(value = "/Department/department_addUser.action")
	     public String department_addUser(String user_id,String department_id,Model model,HttpServletRequest request,HttpSession httpSession) {
	    	 //获取登录用户名称判断用户是否登录
	    	 String uname = (String) request.getSession().getAttribute("username");
	    	 String head_name = (String) request.getSession().getAttribute("head_name");
	    	 if(uname!=null && head_name!=null) {
	    		 
	    		System.out.println(department_id+"部门id");
	    		System.out.println(user_id+"用户id");
	    		
	    	/*	 String s6 = user_id;
	    	        String[] words6 = s6.split(",");
	    	        String roleid = words6[0];
	    	        */
	    	        
	    	        
	    	  	     String s5 = user_id;
	    		        String[] words5 = s5.split(",");
	    		        for(int i=0;i<words5.length;i++) {
	    		        	String userid = words5[i];
	    		        	//为权限对象添加属性
	    		   	        //批量删除 传递一个权限Permission对象
	    		        	//roleService.Role_deletePermission(headid,roleid);
	    		        	System.out.println("userid"+userid);
	    		        	departmentService.department_addUser(userid,department_id);
	    		        	///System.out.println("用户id"+userid);
	    		        }
	    	        
	    	        
	    	        
	    	        
	    	        
	    	       /* System.out.println(department_id+"部门id");
	    		
	    	        System.out.println("("+user_id+")"+"("+department_id+")");
	      		  */
	    		 
	    		
	    		 
	    		 
	    		 return "redirect:/Department/departmentUserList.action?department_id="+department_id;
	    	 }else {
	    		 return "redirect:/showlogin.action";
	    	 }
	     }
	     
	     
	     
	     
	     
	     
	     
	     

}
