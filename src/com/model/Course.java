package com.model;

public class Course {

	private String CourseCode;
	private String Title;
	private String creditHour;
	private String preRequisit;
	private String DeptID;
	private String collegeID;
	private String streamID;

	public String getCourseCode() {
		return CourseCode;
	}

	public void setCourseCode(String courseCode) {
		CourseCode = courseCode;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getCreditHour() {
		return creditHour;
	}

	public void setCreditHour(String creditHour) {
		this.creditHour = creditHour;
	}

	public String getPreRequisit() {
		return preRequisit;
	}

	public void setPreRequisit(String preRequisit) {
		this.preRequisit = preRequisit;
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

	public String getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(String collegeID) {
		this.collegeID = collegeID;
	}

}
