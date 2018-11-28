package com.instructorDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.AssignmentResult;

public class ManageAssignmentResultDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageAssignmentResultDao() {
		con = DBConnection.createConnection();
	}

	// 1. insert result function
	// 2. get all results function
	// 3. get result by student id
	// 4. Delete result
	// 5. get number of rows of result
	// 6. Update result function

	public boolean InsertAssignResult(AssignmentResult ar) {

		boolean status = false;

		try {
			String insertResult = "INSERT INTO AssignmentResult(AssignResultID,StudentID,CourseID,DeptID,StreamID,InstructorID,AssignID,Score,Mark) VALUES(?,?,?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertResult);

			pSt.setString(1, ar.getAssignResultID());
			pSt.setString(2, ar.getStudentID());
			pSt.setString(3, ar.getCourseID());
			pSt.setString(4, ar.getDeptID());
			pSt.setString(5, ar.getStreamID());
			pSt.setString(6, ar.getInstructorID());
			pSt.setString(7, ar.getAssignmentID());
			pSt.setDouble(8, ar.getScore());
			pSt.setDouble(9, ar.getMark());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Assignment Result: " + e.getMessage());
		}
		return status;
	}

	public boolean UpdateAssignResult(AssignmentResult ar, String assingResultID) {

		boolean status = false;

		try {
			String updateResult = "UPDATE AssignmentResult SET StudentID=?,CourseID=?,DeptID=?,StreamID=?,InstructorID=?,AssignID=?,Score=?,Mark=? WHERE AssignResultID=?";
			pSt = con.prepareStatement(updateResult);

			pSt.setString(1, ar.getStudentID());
			pSt.setString(2, ar.getCourseID());
			pSt.setString(3, ar.getDeptID());
			pSt.setString(4, ar.getStreamID());
			pSt.setString(5, ar.getInstructorID());
			pSt.setString(6, ar.getAssignmentID());
			pSt.setDouble(7, ar.getScore());
			pSt.setDouble(8, ar.getMark());
			pSt.setString(9, assingResultID);

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Update Assignment Result: " + e.getMessage());
		}
		return status;
	}

	public List<AssignmentResult> getAllAssignResults(String instructorID, int rowNum, int totalRow) {

		List<AssignmentResult> aResults = new ArrayList<AssignmentResult>();

		try {
			String getAllResults = "SELECT * FROM AssignmentResult WHERE InstructorID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllResults);

			pSt.setString(1, instructorID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				AssignmentResult ar = new AssignmentResult();

				ar.setAssignResultID(rSet.getString("AssignResultID"));
				ar.setStudentID(rSet.getString("StudentID"));
				ar.setCourseID(rSet.getString("CourseID"));
				ar.setDeptID(rSet.getString("DeptID"));
				ar.setStreamID(rSet.getString("StreamID"));
				ar.setInstructorID(rSet.getString("InstructorID"));
				ar.setAssignmentID(rSet.getString("AssignID"));
				ar.setScore(rSet.getDouble("Score"));
				ar.setMark(rSet.getDouble("Mark"));

				aResults.add(ar);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Assignment Result: " + e.getMessage());
		}

		return aResults;
	}

	public AssignmentResult getAssignResultsByStudentID(String assignResultID) {

		AssignmentResult ar = null;

		try {
			String getStudResults = "SELECT * FROM AssignmentResult WHERE AssignResultID=?";
			pSt = con.prepareStatement(getStudResults);

			pSt.setString(1, assignResultID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				ar = new AssignmentResult();

				ar.setAssignResultID(rSet.getString("AssignResultID"));
				ar.setStudentID(rSet.getString("StudentID"));
				ar.setCourseID(rSet.getString("CourseID"));
				ar.setDeptID(rSet.getString("DeptID"));
				ar.setStreamID(rSet.getString("StreamID"));
				ar.setInstructorID(rSet.getString("InstructorID"));
				ar.setAssignmentID(rSet.getString("AssignID"));
				ar.setScore(rSet.getDouble("Score"));
				ar.setMark(rSet.getDouble("Mark"));
				
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Assignment Result: " + e.getMessage());
		}

		return ar;
	}

	public boolean DeleteStudentResult(String resultID) {
		boolean status = false;

		try {
			String deleteResult = "DELETE FROM AssignmentResult WHERE AssignResultID=?";
			pSt = con.prepareStatement(deleteResult);
			pSt.setString(1, resultID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Assignment Result: " + e.getMessage());
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

			String getRows = "SELECT COUNT(*) FROM AssignmentResult WHERE InstructorID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, instructorID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Assignment Result: " + e.getMessage());
		}

		return count;
	}
	
	public String getMark(String assignResultID) {

		String mark = "";
		try {
			String selectMark = "SELECT Mark FROM AssignmentResult WHERE AssignResultID=?";
			pSt = con.prepareStatement(selectMark);

			pSt.setString(1, assignResultID);

			rSet = pSt.executeQuery();

			if (rSet.next()) {
				mark = rSet.getString("Mark");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Mark: " + e.getMessage());
		}

		return mark;
	}
}
