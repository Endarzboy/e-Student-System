package com.model;

public class ExamSchedule {

	private String scheduleID;
	private String courseID;
	private String deptID;
	private String dateOfExam;
	private String examNotice;
	private String invigilator;
	private String examTime;
	private int batch;

	public String getScheduleID() {
		return scheduleID;
	}

	public void setScheduleID(String scheduleID) {
		this.scheduleID = scheduleID;
	}

	public String getCourseID() {
		return courseID;
	}

	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}

	public String getDeptID() {
		return deptID;
	}

	public void setDeptID(String deptID) {
		this.deptID = deptID;
	}

	public String getDateOfExam() {
		return dateOfExam;
	}

	public void setDateOfExam(String dateOfExam) {
		this.dateOfExam = dateOfExam;
	}

	public String getExamNotice() {
		return examNotice;
	}

	public void setExamNotice(String examNotice) {
		this.examNotice = examNotice;
	}

	public String getInvigilator() {
		return invigilator;
	}

	public void setInvigilator(String invigilator) {
		this.invigilator = invigilator;
	}

	public int getBatch() {
		return batch;
	}

	public void setBatch(int batch) {
		this.batch = batch;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}
	
	

}
