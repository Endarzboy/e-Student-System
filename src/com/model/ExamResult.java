package com.model;

public class ExamResult {

	private String examResultID;
	private String studID;
	private String courseID;
	private String deptID;
	private String examID;
	private double scoreObtained;
	private String dateOfExam;

	public String getExamResultID() {
		return examResultID;
	}

	public void setExamResultID(String examResultID) {
		this.examResultID = examResultID;
	}

	public String getStudID() {
		return studID;
	}

	public void setStudID(String studID) {
		this.studID = studID;
	}

	public String getDeptID() {
		return deptID;
	}

	public void setDeptID(String deptID) {
		this.deptID = deptID;
	}

	public String getExamID() {
		return examID;
	}

	public void setExamID(String examID) {
		this.examID = examID;
	}

	public double getScoreObtained() {
		return scoreObtained;
	}

	public void setScoreObtained(double scoreObtained) {
		this.scoreObtained = scoreObtained;
	}

	public String getDateOfExam() {
		return dateOfExam;
	}

	public void setDateOfExam(String dateOfExam) {
		this.dateOfExam = dateOfExam;
	}

	public String getCourseID() {
		return courseID;
	}

	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}

}
