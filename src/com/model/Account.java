package com.model;

public class Account {

	private String UserID;
	private String DeptID;
	private String collegeID;
	private String EmailAddress;
	private String UserName;// mark
	private String Passwowrd;// mark
	private String Role;

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getDeptID() {
		return DeptID;
	}

	public void setDeptID(String deptID) {
		DeptID = deptID;
	}

	public String getEmailAddress() {
		return EmailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;// mark
	}

	public String getPasswowrd() {
		return Passwowrd;
	}

	public void setPasswowrd(String passwowrd) {
		Passwowrd = passwowrd;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public String getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(String collegeID) {
		this.collegeID = collegeID;
	}

}
