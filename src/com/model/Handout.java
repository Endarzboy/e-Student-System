package com.model;

public class Handout {

	private String handoutID;
	private String courseID;
	private String handoutFile;
	private String FileName;
	private int FileSize;
	private String deptID;
	private String streamID;
	private String preparedBy;
	private int batch;
	private int semester;

	public String getCourseID() {
		return courseID;
	}

	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}

	public String getHandoutFile() {
		return handoutFile;
	}

	public void setHandoutFile(String handoutFile) {
		this.handoutFile = handoutFile;
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

	public String getPreparedBy() {
		return preparedBy;
	}

	public void setPreparedBy(String preparedBy) {
		this.preparedBy = preparedBy;
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

	public String getHandoutID() {
		return handoutID;
	}

	public void setHandoutID(String handoutID) {
		this.handoutID = handoutID;
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

}
