package com.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.ExamResult;

public class ExamResultDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ExamResultDao() {
		con = DBConnection.createConnection();
	}

	public boolean InsertExamResult(ExamResult er) {

		boolean status = false;

		try {
			String insertExamResult = "INSERT INTO ExamResult(ExamResultID,StudentID,CourseID,DeptID,ExamID,ScoreObtained,DateOfExam) VALUES(?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertExamResult);

			pSt.setString(1, er.getExamResultID());
			pSt.setString(2, er.getStudID());
			pSt.setString(3, er.getCourseID());
			pSt.setString(4, er.getDeptID());
			pSt.setString(5, er.getExamID());
			pSt.setDouble(6, er.getScoreObtained());
			pSt.setString(7, er.getDateOfExam());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert ExamResult: " + e.getMessage());
		}
		return status;
	}

	public List<ExamResult> getAllExamResults(String studentID, int rowNum, int totalRow) {

		List<ExamResult> examResults = new ArrayList<ExamResult>();

		try {
			String getAllExamResult = "SELECT * FROM ExamResult WHERE StudentID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllExamResult);

			pSt.setString(1, studentID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				ExamResult er = new ExamResult();

				er.setExamResultID(rSet.getString("ExamResultID"));
				er.setStudID(rSet.getString("StudentID"));
				er.setCourseID(rSet.getString("CourseID"));
				er.setDeptID(rSet.getString("DeptID"));
				er.setExamID(rSet.getString("ExamID"));
				er.setScoreObtained(rSet.getDouble("ScoreObtained"));
				er.setDateOfExam(rSet.getString("DateOfExam"));

				examResults.add(er);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Exam Results: " + e.getMessage());
		}

		return examResults;
	}

	public static int getRowCount(String studID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM ExamResult WHERE StudentID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, studID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Exam Result: " + e.getMessage());
		}

		return count;
	}

	public String getMark(String markID) {

		String mark = "";
		try {
			String selectMark = "SELECT Mark FROM Exam WHERE ExamID=?";
			pSt = con.prepareStatement(selectMark);

			pSt.setString(1, markID);

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
