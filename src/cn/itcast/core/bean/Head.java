package cn.itcast.core.bean;

import java.io.Serializable;

public class Head implements  Serializable  {
	
	private String head_id;
	private String head_name;
	private String head_url;
	public String getHead_id() {
		return head_id;
	}
	public void setHead_id(String head_id) {
		this.head_id = head_id;
	}
	public String getHead_name() {
		return head_name;
	}
	public void setHead_name(String head_name) {
		this.head_name = head_name;
	}
	public String getHead_url() {
		return head_url;
	}
	public void setHead_url(String head_url) {
		this.head_url = head_url;
	}

	
}
