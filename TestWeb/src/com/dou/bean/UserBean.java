package com.dou.bean;

public class UserBean implements java.io.Serializable {
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean login() {
		if("dou".equals(username) && "milito22".equals(password)) {
			return true;
		}
		return false;
	}
}
