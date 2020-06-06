package cn.itcast.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.core.bean.Customer;

public interface CustomerDao {

	List<Customer> selectCustomerList(Customer customer);
	Integer selectCustomerListCount(Customer customer);
	Customer getCustomerById(Long id);
	void updateCustomer(Customer customer);
	void deleteCustomer(Long id);
	//用户登录 
	//@Param确定参数
	Integer userlogin(@Param("username")String username, @Param("password")String password);
	
}