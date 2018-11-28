package com.instructorDao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.SubmittedAssignment;

public class ManageSubmittedAssignDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageSubmittedAssignDao() {
		con = DBConnection.createConnection();
	}

	// 1. get all submitted assignments
	// 2. delete submitted assignments
	// 3. get assignments by course id
	// 4. get row count

	public List<SubmittedAssignment> getAllSubmittedAssignments(String instructorID, int rowNum, int totalRow) {

		List<SubmittedAssignment> sas = new ArrayList<SubmittedAssignment>();

		try {
			String getAllSas = "SELECT * FROM SubmittedAssignments WHERE InstructorID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllSas);

			pSt.setString(1, instructorID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				SubmittedAssignment sa = new SubmittedAssignment();

				sa.setSubAssignID(rSet.getString("AssignID"));
				sa.setCourseID(rSet.getString("CourseID"));
				sa.setDeptID(rSet.getString("DeptID"));
				sa.setStreamID(rSet.getString("StreamID"));
				sa.setFileName(rSet.getString("FileName"));
				sa.setFileSize(rSet.getInt("FileSize"));
				sa.setSubmittedDate(rSet.getString("SubmittedDate"));
				sa.setBatch(rSet.getInt("Batch"));
				sa.setInstructorID(rSet.getString("InstructorID"));
				sa.setStudentID(rSet.getString("StudentID"));

				sas.add(sa);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Submitted Assignments: " + e.getMessage());
		}

		return sas;
	}

	public SubmittedAssignment getSubmittedAssignmentByCourseID(String courseID) {

		SubmittedAssignment sa = null;

		try {
			String getSubassByCourseID = "SELECT * FROM SubmittedAssignments WHERE CourseID=?";
			pSt = con.prepareStatement(getSubassByCourseID);

			pSt.setString(1, courseID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				sa = new SubmittedAssignment();

				sa.setSubAssignID(rSet.getString("AssignID"));
				sa.setCourseID(rSet.getString("CourseID"));
				sa.setDeptID(rSet.getString("DeptID"));
				sa.setStreamID(rSet.getString("StreamID"));
				sa.setFileName(rSet.getString("FileName"));
				sa.setFileSize(rSet.getInt("FileSize"));
				sa.setSubmittedDate(rSet.getString("SubmittedDate"));
				sa.setBatch(rSet.getInt("Batch"));
				sa.setInstructorID(rSet.getString("InstructorID"));
				sa.setStudentID(rSet.getString("StudentID"));

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Submitted Assignments: " + e.getMessage());
		}

		return sa;
	}

	public boolean DeleteSubmittedAssign(String subAssignID) {
		boolean status = false;

		try {
			String deleteSubAssign = "DELETE FROM SubmittedAssignments WHERE AssignID=?";
			pSt = con.prepareStatement(deleteSubAssign);
			pSt.setString(1, subAssignID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Submitted Assignment: " + e.getMessage());
		}

		return status;
	}

	public static int getRowCount(String instructorID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM SubmittedAssignments WHERE InstructorID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, instructorID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Submitted Assignment: " + e.getMessage());
		}

		return count;
	}
	
	public static void main(String[] args) {
		File file=new File("E:/tran-joint.pdf");
		int size=(int) file.length();
		
		System.out.println(size);
	}
}
