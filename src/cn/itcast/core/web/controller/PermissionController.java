package cn.itcast.core.web.controller;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.core.service.PermissionService;
import cn.itcast.core.service.UserService;

/**
 * 权限管理
 * @author Administrator
 *
 */
@Controller
public class PermissionController implements  Serializable  {
	
	// 依赖注入
		@Autowired
		private PermissionService permissionService;
		
	 
		

}
