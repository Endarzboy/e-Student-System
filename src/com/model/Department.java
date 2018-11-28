package com.model;

public class Department {

	private String DeptID;
	private String deptName;
	private String collegeID;
	private String Description;

	public String getDeptID() {
		return DeptID;
	}

	public void setDeptID(String deptID) {
		DeptID = deptID;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(String collegeID) {
		this.collegeID = collegeID;
	}

}
