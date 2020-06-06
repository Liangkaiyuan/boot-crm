package cn.itcast.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.core.bean.Head;
import cn.itcast.core.dao.PermissionDao;
import cn.itcast.core.service.PermissionService;

@Service("permissionService")
@Transactional
public class PermissionServiceImpl implements PermissionService {
	
	
	// 定义dao属性
		@Autowired
		private PermissionDao permissionDao;
	

		//查询用户权限
	@Override
	public List<Head> findPermissionByUserid(Integer user_id) {
		// TODO Auto-generated method stub
		return permissionDao.findPermissionByUserid(user_id);
	}

}
