package com.model;

public class AssignmentToPost {

	private String assignID;
	private String title;
	private String Description;
	private String CourseID;
	private String DeptID;
	private String StreamID;
	private String fileName;
	private int fileSize;
	private String dateToPost;
	private String deadLine;
	private String instructorID;
	private int batch;
	private int semester;

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;// This is assignment for IT department for
									// the course of IT.
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getCourseID() {
		return CourseID;
	}

	public void setCourseID(String courseID) {
		CourseID = courseID;
	}

	public String getDeptID() {
		return DeptID;
	}

	public void setDeptID(String deptID) {
		DeptID = deptID;
	}

	public String getStreamID() {
		return StreamID;
	}

	public void setStreamID(String streamID) {
		StreamID = streamID;
	}

	public String getDateToPost() {
		return dateToPost;
	}

	public void setDateToPost(String dateToPost) {
		this.dateToPost = dateToPost;
	}

	public String getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}

	public String getInstructorID() {
		return instructorID;
	}

	public void setInstructorID(String instructorID) {
		this.instructorID = instructorID;
	}

	public int getBatch() {
		return batch;
	}

	public void setBatch(int batch) {
		this.batch = batch;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getAssignID() {
		return assignID;
	}

	public void setAssignID(String assignID) {
		this.assignID = assignID;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

}
