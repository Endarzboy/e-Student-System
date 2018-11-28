package com.model;

public class Student {

	private String StudentID;
	private String FullName;
	private String gender;
	private String address;
	private String DeptID;
	private String collegeID;
	private String streamID;
	private String batch;

	public String getStudentID() {
		return StudentID;
	}

	public void setStudentID(String studentID) {
		StudentID = studentID;
	}

	public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDeptID() {
		return DeptID;
	}

	public void setDeptID(String deptID) {
		DeptID = deptID;
	}

	public String getStreamID() {
		return streamID;
	}

	public void setStreamID(String streamID) {
		this.streamID = streamID;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(String collegeID) {
		this.collegeID = collegeID;
	}

}
