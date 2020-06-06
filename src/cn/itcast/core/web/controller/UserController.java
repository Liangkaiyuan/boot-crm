package cn.itcast.core.web.controller;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.core.bean.Head;
import cn.itcast.core.bean.Role;
import cn.itcast.core.bean.Sys_user;
import cn.itcast.core.service.PermissionService;
import cn.itcast.core.service.UserService;
import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

@Controller
public class UserController implements  Serializable  {

	// 依赖注入
	@Autowired
	private UserService userService;
	//权限
	@Autowired
	private PermissionService permissionService;
	
	//跳转到用户注册
	@RequestMapping(value = "/toadduser")
	public String toadduser() {
		return "adduser";
	}
	
	//开始跳转到登录界面
		@RequestMapping(value = "/showlogin")
		public String showLogin() {
			return "login";
		}
		
		
		
		//用户登录 通过查询用户的主键id来进行
		@RequestMapping(value = "/login")
		public String login(String username, String password, Model model, HttpServletRequest request,
				HttpSession httpSession,/*,HttpServletRequest request,*/ HttpServletResponse response) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8"); 
			System.out.println("用户控制层的方法"+username);
			
			/////////////////
			username="123";
			password="123";
			
			
			
			
			
			
			Integer user_id = userService.userlogin(username,password);
			String userid = user_id+"";
			//httpSession.getAttribute("",uname)
			System.out.println("用户id"+userid);
			if(user_id!=null) {
				
				httpSession.setAttribute("username", username);
				httpSession.setAttribute("userid", userid);
				
				//通过用户id查询用户在哪个角色中，再根据角色id查询权限表来判断角色有多少权限，根据权限表的headid来查询标题产生的数据（名称，链接）返回一个head对象
				List<Head> head = permissionService.findPermissionByUserid(user_id);
				System.out.println("标题名称"+head.get(0).getHead_name());
				String head_name = head.get(0).getHead_name();
				httpSession.setAttribute("headList", head);
				
				httpSession.setAttribute("head_name", head_name);
				//ServletActionContext.getRequest().getSession().setAttribute("userList",list);
                model.addAttribute("username", username);
				String url = "redirect:/customer/list.action";
				request.getSession().setAttribute("username", username);
				String uname = (String) request.getSession().getAttribute("username");
				System.out.println(uname+"session中的用户名");
				System.out.println(head_name+"session中的head_name");
				System.out.println(head+"session中的head");
				//request.getSession().removeAttribute("user"); 
				//退出登录
				
				
				
				
				return url;
			}else {
				String loginfalse="登录失败!请检查用户名或密码";
     	 		model.addAttribute("loginfalse", loginfalse);
				return "login";
			}
		}
		
		//退出用户登录
		@RequestMapping(value = "/loginout")
		public String loginOut(HttpServletRequest request, HttpServletResponse response) {
			 request.getSession().removeAttribute("username");
			 request.getSession().removeAttribute("head_name");
			return "login";
		}
	
	
	/**
	 * 用户注册
	 * @return
	 * @throws BadHanyuPinyinOutputFormatCombination 
	 */
	@RequestMapping(value = "/adduser")
	public String adduser(Sys_user user,HttpServletRequest request, HttpServletResponse response) throws BadHanyuPinyinOutputFormatCombination{
		
		
		String user_name = user.getUser_name();
		
		char[] charArray = user_name.toCharArray();
		StringBuilder pinyin = new StringBuilder();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		// 设置大小写格式
		defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
		// 设置声调格式：
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (int i = 0; i < charArray.length; i++) {
			// 匹配中文,非中文转换会转换成null
			if (Character.toString(charArray[i]).matches("[\\u4E00-\\u9FA5]+")) {
				String[] hanyuPinyinStringArray = PinyinHelper.toHanyuPinyinStringArray(charArray[i], defaultFormat);
				if (hanyuPinyinStringArray != null) {
					pinyin.append(hanyuPinyinStringArray[0].charAt(0));
				}
			}
		}
		
		System.out.println("用户首拼"+pinyin);
		String namePin = pinyin+"";
		
		
		user.setUser_pinyin(namePin.toLowerCase());
		
		//查询用户最大id
		Integer userMaxId = userService.findUserMaxId();
		System.out.println(userMaxId+"用户最大id");
		System.out.println(user.getUser_name());
		System.out.println(user.getUser_password());
		System.out.println(user.getUser_state());
		//将用户最大id+1赋值到user对象
		if(userMaxId==null) {
			userMaxId=1;
			user.setUser_id(userMaxId);
		}else {
			user.setUser_id(userMaxId+1);
		}
		//用户insert方法
		
		user.setRole_id("1");
		
		
		
		
		
		
		userService.adduser(user);
		//获取用户刚新建的用户id
		Integer user_id = user.getUser_id();
		//判断用户最大id和最新插入的用户id
		if(user_id>userMaxId) {
			System.out.println(user_id+"用户id");
			 
			return "login";
		}else {
			return "adduser";
		}
	}
	
	
	//用户列表
	@RequestMapping(value = "/userList")
	public String userList(Model model,HttpServletRequest request,HttpSession httpSession) {
		String uname = (String) request.getSession().getAttribute("username");
		String head_name = (String) request.getSession().getAttribute("head_name");
		if(uname!=null && head_name!=null) {
		List<Sys_user> user = userService.userList();
		System.out.println(user.get(0).getRole_name());
        model.addAttribute("page", user);
		return "userList";
		}else {
		 
		return "redirect:/showlogin.action";
		}
	}
	
	
	 
	
	//用户编辑前查询
	@RequestMapping(value = "/findUserById")
	public String findUserById(String userid,Model model,HttpServletRequest request,HttpSession httpSession) {
		String uname = (String) request.getSession().getAttribute("username");
		String head_name = (String) request.getSession().getAttribute("head_name");
		if(uname!=null && head_name!=null) {
			//通过id查询用户
			Integer user_id = Integer.parseInt(userid); 
			System.out.println(user_id);
			List<Sys_user> user= userService.findUserById(user_id);
			
			System.out.println("角色id"+user.get(0).getRole_id());

			String role_id=user.get(0).getRole_id();
			//查询全部用户角色并授权给用户
			List<Role> role = userService.findAllRole();
			System.out.println("角色名称："+role.get(0).getRole_name());
			
			 
			model.addAttribute("role_id", role_id);
			//查询部门
        model.addAttribute("role", role);
			
			//查询部门
        model.addAttribute("page", user);
		return "editUser";
		}else {
		return "redirect:/showlogin.action";
		}
	}
	
	//编辑用户
		@RequestMapping(value = "/editUser")
		public String editUser(String userid,Model model,HttpServletRequest request,HttpSession httpSession) {
			String uname = (String) request.getSession().getAttribute("username");
			String head_name = (String) request.getSession().getAttribute("head_name");
			if(uname!=null && head_name!=null) {
				//查询全部用户角色并授权给用户
				List<Role> role = userService.findAllRole();
				System.out.println("角色名称："+role.get(0).getRole_name());
				
				 
				
				//查询部门
	        model.addAttribute("role", role);
			return "editUser";
			}else {
			return "redirect:/showlogin.action";
			}
		}
	

}
