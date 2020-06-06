package cn.itcast.core.service;

import java.util.List;
import cn.itcast.core.bean.Head;

 
public interface PermissionService {

	//查询用户对象
	List<Head> findPermissionByUserid(Integer user_id);

}
