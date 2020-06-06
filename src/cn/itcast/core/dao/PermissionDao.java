package cn.itcast.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.core.bean.Head;

public interface PermissionDao {

	//查询用户权限
	List<Head> findPermissionByUserid(@Param("user_id")Integer user_id);

}
