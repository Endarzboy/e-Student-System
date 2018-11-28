package com.model;

public class Notification {

	private String notifyID;
	private String instructorID;
	private String courseID;
	private String assignID;
	private String notification;
	private String date;

	public String getNotifyID() {
		return notifyID;
	}

	public void setNotifyID(String notifyID) {
		this.notifyID = notifyID;
	}

	public String getInstructorID() {
		return instructorID;
	}

	public void setInstructorID(String instructorID) {
		this.instructorID = instructorID;
	}

	public String getCourseID() {
		return courseID;
	}

	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}

	public String getNotification() {
		return notification;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAssignID() {
		return assignID;
	}

	public void setAssignID(String assignID) {
		this.assignID = assignID;
	}

}
