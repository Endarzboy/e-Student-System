package com.clientSide;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.AssignmentToPost;

public class NoticeDao {

	public Connection con = null;
	public PreparedStatement pSt, pst1;
	public ResultSet rSet, rSet1;

	public NoticeDao() {

		con = DBConnection.createConnection();
	}

	public String getDeptTitle(String deptID) {
		String deptName = "";
		try {
			String getDeptName = "SELECT DeptName FROM Department WHERE DeptID=?";
			pSt = con.prepareStatement(getDeptName);
			pSt.setString(1, deptID);

			rSet = pSt.executeQuery();
			if (rSet.next()) {
				deptName = rSet.getString("DeptName");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Dept Name: " + e.getMessage());
		}
		return deptName;
	}

	public String getCourseTitle(String courseCode) {
		String courseTitle = "";
		try {
			String getTitle = "SELECT Title FROM Course WHERE CourseCode=?";
			pSt = con.prepareStatement(getTitle);
			pSt.setString(1, courseCode);

			rSet = pSt.executeQuery();
			if (rSet.next()) {
				courseTitle = rSet.getString("Title");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Course Title: " + e.getMessage());
		}
		return courseTitle;
	}

	public String getInstructorName(String instId) {
		String instName = "";
		try {
			String getInstName = "SELECT FullName FROM Instructor WHERE InstructorID=?";
			pSt = con.prepareStatement(getInstName);
			pSt.setString(1, instId);

			rSet = pSt.executeQuery();
			if (rSet.next()) {
				instName = rSet.getString("FullName");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Instructor Name: " + e.getMessage());
		}
		return instName;
	}

	public List<AssignmentToPost> getAllAssignmentToPosts(int rowNum,int totalPage) {

		List<AssignmentToPost> assignments = new ArrayList<AssignmentToPost>();

		try {
			String getAllAssignments = "SELECT * FROM AssignmentToPost ORDER BY PostedDate DESC LIMIT ?,?";
			pSt = con.prepareStatement(getAllAssignments);
			
			pSt.setInt(1, rowNum);
			pSt.setInt(2, totalPage);
			
			rSet = pSt.executeQuery();

			while (rSet.next()) {
				AssignmentToPost at = new AssignmentToPost();

				at.setAssignID(rSet.getString("AssignID"));
				at.setTitle(rSet.getString("Title"));
				at.setDescription(rSet.getString("Description"));
				at.setCourseID(rSet.getString("CourseID"));
				at.setDeptID(rSet.getString("DeptID"));
				at.setFileName(rSet.getString("FileName"));
				at.setFileSize(rSet.getInt("FileSize"));
				at.setDateToPost(rSet.getString("PostedDate"));
				at.setDeadLine(rSet.getString("DeadLine"));
				at.setInstructorID(rSet.getString("InstructorID"));
				at.setBatch(rSet.getInt("Batch"));
				at.setSemester(rSet.getInt("Semester"));

				assignments.add(at);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Assignments: " + e.getMessage());
		}

		return assignments;
	}
	
	public AssignmentToPost getAssignmentToPostsByID(String courseID) {

		AssignmentToPost at = null;
		try {
			String getAssignments = "SELECT * FROM AssignmentToPost WHERE CourseID=?";
			pSt = con.prepareStatement(getAssignments);

			pSt.setString(1, courseID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				at = new AssignmentToPost();

				at.setAssignID(rSet.getString("AssignID"));
				at.setTitle(rSet.getString("Title"));
				at.setDescription(rSet.getString("Description"));
				at.setCourseID(rSet.getString("CourseID"));
				at.setDeptID(rSet.getString("DeptID"));
				// at.setStreamID(rSet.getString("StreamID"));
				at.setFileName(rSet.getString("FileName"));
				at.setFileSize(rSet.getInt("FileSize"));
				at.setDateToPost(rSet.getString("PostedDate"));
				at.setDeadLine(rSet.getString("DeadLine"));
				at.setInstructorID(rSet.getString("InstructorID"));
				at.setBatch(rSet.getInt("Batch"));
				at.setSemester(rSet.getInt("Semester"));

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get an Assignments: " + e.getMessage());
		}

		return at;
	}

	public static int getRowCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM AssignmentToPost";
			ps = con.prepareStatement(getRows);

			//ps.setString(1, courseID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Assignments: " + e.getMessage());
		}

		return count;
	}
}
