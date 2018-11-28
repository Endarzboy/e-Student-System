package com.model;

public class AssignmentResult {

	private String AssignResultID;
	private String StudentID;
	private String courseID;
	private String deptID;
	private String streamID;
	private String instructorID;
	private String AssignmentID;
	private double score;
	private double mark;

	public String getAssignResultID() {
		return AssignResultID;
	}

	public void setAssignResultID(String assignResultID) {
		AssignResultID = assignResultID;
	}

	public String getStudentID() {
		return StudentID;
	}

	public void setStudentID(String studentID) {
		StudentID = studentID;
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

	public String getStreamID() {
		return streamID;
	}

	public void setStreamID(String streamID) {
		this.streamID = streamID;
	}

	public String getInstructorID() {
		return instructorID;
	}

	public void setInstructorID(String instructorID) {
		this.instructorID = instructorID;
	}

	public String getAssignmentID() {
		return AssignmentID;
	}

	public void setAssignmentID(String assignmentID) {
		AssignmentID = assignmentID;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public double getMark() {
		return mark;
	}

	public void setMark(double mark) {
		this.mark = mark;
	}

}
