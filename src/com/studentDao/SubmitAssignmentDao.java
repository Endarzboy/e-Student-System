package com.studentDao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.SubmittedAssignment;

public class SubmitAssignmentDao {

	public Connection con = null;
	public PreparedStatement pSt, pst1;
	public ResultSet rSet, rSet1;

	public SubmitAssignmentDao() {
		con = DBConnection.createConnection();
	}

	// 1. insert function
	// 2. get all assignments
	// 3. get row count
	public boolean SubmitAssignment(SubmittedAssignment sa, String filePath, String assignmentIDNo,
			String studentIDNo) {
		boolean status = false;
		int countRows = 0;

		try {
			String checkDuplication = "SELECT * FROM SubmittedAssignments WHERE StudentID='" + studentIDNo
					+ "' AND AssignID='" + assignmentIDNo + "'";
			pst1 = con.prepareStatement(checkDuplication);

			rSet1 = pst1.executeQuery();
			while (rSet1.next()) {
				countRows++;
			}

		} catch (Exception e) {
			System.out.println("\nUnable to Check Duplication: " + e.getMessage());
		}

		if (countRows >= 1) {
			System.out.println("Duplication has been occured");
		} else {

			FileInputStream fileToUpload = null;
			try {
				String insertAssignment = "INSERT INTO SubmittedAssignments(AssignID,CourseID,DeptID,StreamID,AssignFile,FileName,FileSize,SubmittedDate,Batch,InstructorID,StudentID)"
						+ " VALUES('" + sa.getSubAssignID() + "','" + sa.getCourseID() + "','" + sa.getDeptID() + "','"
						+ sa.getStreamID() + "',?,?,?,?,?,?,?)";
				pSt = con.prepareStatement(insertAssignment);

				File f = new File(filePath);
				int fileSize = (int) f.length();

				byte bytes[] = new byte[fileSize];

				fileToUpload = new FileInputStream(f);
				fileToUpload.read(bytes);

				pSt.setBytes(1, bytes);
				pSt.setString(2, f.getName());
				pSt.setLong(3, fileSize);
				pSt.setString(4, sa.getSubmittedDate());
				pSt.setInt(5, sa.getBatch());
				pSt.setString(6, sa.getInstructorID());
				pSt.setString(7, sa.getStudentID());

				pSt.executeUpdate();

				status = true;

			} catch (Exception e) {
				System.out.println("\nUnable to Submit Assignment: " + e.getMessage());
			}
		}
		return status;
	}

	public List<SubmittedAssignment> getAllSubmittedAssignments(String studentID, int rowNum, int totalRow) {

		List<SubmittedAssignment> sas = new ArrayList<SubmittedAssignment>();

		try {
			String getAllSas = "SELECT * FROM SubmittedAssignments WHERE StudentID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllSas);

			pSt.setString(1, studentID);
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

	public static int getRowCount(String studentID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM SubmittedAssignments WHERE StudentID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, studentID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Submitted Assignment: " + e.getMessage());
		}

		return count;
	}
}
