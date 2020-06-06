package cn.itcast.core.web.controller;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.BaseDict;
import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.Head;
import cn.itcast.core.service.CustomerService;
import cn.itcast.core.service.PermissionService;
import cn.itcast.core.service.SystemService;


 
import org.springframework.context.ApplicationContext;

/**
 * 客户管理
 * <p>Title: CustomerController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.cn</p> 
 * @version 1.0
 */
@Controller
public class CustomerController implements  Serializable  {
	
	// 权限管理依赖注入
			@Autowired
			private PermissionService permissionService;
	

	// 依赖注入
	@Autowired
	private CustomerService customerService;
	@Autowired
	private SystemService systemService;
	@Value("${customer.from.type}")
	private String FROM_TYPE;
	@Value("${customer.industry.type}")
	private String INDUSTRY_TYPE;
	@Value("${customer.level.type}")
	private String LEVEL_TYPE;
	
	@RequestMapping(value = "/customer")
	public String showCumtomer() {
		return "redirect:/customer/list.action";
	}
	
	/*//开始跳转到登录界面
	@RequestMapping(value = "/showlogin")
	public String showLogin() {
		return "login";
	}
	
	
	
	//用户登录 通过查询用户的主键id来进行
	@RequestMapping(value = "/tologin")
	public String login(String username, String password, Model model, HttpServletRequest request,
			HttpSession httpSession,HttpServletRequest request, HttpServletResponse response) {
		System.out.println("登录用户名"+username);
		Integer user_id = customerService.userlogin(username,password);
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
			 
			return "redirect:/showlogin.action";
		}
	}
	
	//退出用户登录
	@RequestMapping(value = "/loginout")
	public String loginOut(HttpServletRequest request, HttpServletResponse response) {
		 request.getSession().removeAttribute("username");
		 request.getSession().removeAttribute("head_name");
		return "login";
	}
	*/
	// 客户列表
	@RequestMapping(value = "/customer/list")
	public String list(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows, 
			String custName, String custSource,	String custIndustry, String custLevel, Model model,HttpServletRequest request, HttpSession httpSession) {
		//获取session中的信息
		String uname = (String) request.getSession().getAttribute("username");
		String head_name = (String) request.getSession().getAttribute("head_name");
		if(uname!=null && head_name!=null) {
		
		//获取session
		//System.out.println(uname+"list");
		//将用户名传递到前端页面
		model.addAttribute("uname", uname);
		
		Page<Customer> customers = customerService.findCustomerList(page, rows, custName, custSource, custIndustry,
				custLevel);
		model.addAttribute("page", customers);
		//客户来源
		List<BaseDict> fromType = systemService.findBaseDictListByType(FROM_TYPE);
		//客户所属行业
		List<BaseDict> industryType = systemService.findBaseDictListByType(INDUSTRY_TYPE);
		//客户级别
		List<BaseDict> levelType = systemService.findBaseDictListByType(LEVEL_TYPE);
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);
		//参数回显
		model.addAttribute("custName", custName);
		model.addAttribute("custSource", custSource);
		model.addAttribute("custIndustry", custIndustry);
		model.addAttribute("custLevel", custLevel);
		
		//System.out.println(uname);
		return "customer";}
		else {
			return "redirect:/showlogin.action";
		}
	}
	
	@RequestMapping("/customer/edit")
	@ResponseBody
	public Customer getCustomerById(Long id,HttpServletRequest request) {
		String uname = (String) request.getSession().getAttribute("username");
		String head_name = (String) request.getSession().getAttribute("head_name");
		if(uname!=null && head_name!=null) {
		Customer customer = customerService.getCustomerById(id);
		return customer;}
		else {
			return null;
		}
	}
	
	@RequestMapping("/customer/update")
	@ResponseBody
	public String customerUpdate(Customer customer,HttpServletRequest request) {
		String uname = (String) request.getSession().getAttribute("username");
		String head_name = (String) request.getSession().getAttribute("head_name");
		if(uname!=null && head_name!=null) {
		customerService.updateCustomer(customer);
		return "OK";}
		else {
			return null;
		}
	}
	@RequestMapping("/customer/delete")
	@ResponseBody
	public String customerDelete(Long id,HttpServletRequest request) {
		String uname = (String) request.getSession().getAttribute("username");
		String head_name = (String) request.getSession().getAttribute("head_name");
		if(uname!=null && head_name!=null) {
		customerService.deleteCustomer(id);
		return "OK";}
		else {
			return null;
		}
	}

}
