package com.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.AssignmentResult;

public class AssignmentResultDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public AssignmentResultDao() {
		con = DBConnection.createConnection();
	}

	public List<AssignmentResult> getAllAssignResults(String studentID, int rowNum, int totalRow) {

		List<AssignmentResult> aResults = new ArrayList<AssignmentResult>();

		try {
			String getAllResults = "SELECT * FROM AssignmentResult WHERE StudentID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllResults);

			pSt.setString(1, studentID);
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

				aResults.add(ar);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Assignment Result: " + e.getMessage());
		}

		return aResults;
	}

	public static int getRowCount(String studentID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM AssignmentResult WHERE StudentID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, studentID);

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
