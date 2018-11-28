package com.instructorDao;

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

	public List<ExamResult> getAllExamResults(String courseCode, int rowNum, int totalRow) {

		List<ExamResult> examResults = new ArrayList<ExamResult>();

		try {
			String getAllExamResult = "SELECT * FROM ExamResult WHERE CourseID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllExamResult);

			pSt.setString(1, courseCode);
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

	public ExamResult getExamResultByStudID(String studID) {

		ExamResult er = null;

		try {
			String getExamResultByStudID = "SELECT * FROM ExamResult WHERE StudentID=?";
			pSt = con.prepareStatement(getExamResultByStudID);

			pSt.setString(1, studID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				er = new ExamResult();

				er.setExamResultID(rSet.getString("ExamResultID"));
				er.setStudID(rSet.getString("StudentID"));
				er.setCourseID(rSet.getString("CourseID"));
				er.setDeptID(rSet.getString("DeptID"));
				er.setExamID(rSet.getString("ExamID"));
				er.setScoreObtained(rSet.getDouble("ScoreObtained"));
				er.setDateOfExam(rSet.getString("DateOfExam"));
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Exam Result: " + e.getMessage());
		}

		return er;
	}

	public static int getRowCount(String courseID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM ExamResult WHERE CourseID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, courseID);

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
