package com.model;

public class SubmittedAssignment {

	private String SubAssignID;
	private String courseID;
	private String deptID;
	private String streamID;
	private String assignmentFile;
	private String FileName;
	private int FileSize;
	private String submittedDate;
	private int batch;
	private String instructorID;
	private String studentID;

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

	public String getStreamID() {
		return streamID;
	}

	public void setStreamID(String streamID) {
		this.streamID = streamID;
	}

	public String getAssignmentFile() {
		return assignmentFile;
	}

	public void setAssignmentFile(String assignmentFile) {
		this.assignmentFile = assignmentFile;
	}

	public String getSubmittedDate() {
		return submittedDate;
	}

	public void setSubmittedDate(String submittedDate) {
		this.submittedDate = submittedDate;
	}

	public int getBatch() {
		return batch;
	}

	public void setBatch(int batch) {
		this.batch = batch;
	}

	public String getInstructorID() {
		return instructorID;
	}

	public void setInstructorID(String instructorID) {
		this.instructorID = instructorID;
	}

	public String getFileName() {
		return FileName;
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public int getFileSize() {
		return FileSize;
	}

	public void setFileSize(int fileSize) {
		FileSize = fileSize;
	}

	public String getSubAssignID() {
		return SubAssignID;
	}

	public void setSubAssignID(String subAssignID) {
		SubAssignID = subAssignID;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

}
