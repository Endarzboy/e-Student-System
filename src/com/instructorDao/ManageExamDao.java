package com.instructorDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Examination;

public class ManageExamDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageExamDao() {
		con = DBConnection.createConnection();
	}

	// 1. insert exam function
	// 2. get all exam function
	// 3. get exam by id
	// 4. Delete exam
	// 5. get number of rows of exam
	// 6. Update exam function

	public boolean InsertExam(Examination exam) {

		boolean status = false;

		try {
			String insertExam = "INSERT INTO Exam(ExamID,ExamTitle,CourseID,DeptID,StreamID,StartTime,EndTime,InstructorID,ScheduleID,Mark) VALUES('"
					+ exam.getExamID() + "','" + exam.getExamTitle() + "',?,?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertExam);

			pSt.setString(1, exam.getCourseID());// (3, fileSize);
			pSt.setString(2, exam.getDeptID());
			pSt.setString(3, exam.getStreamID());
			pSt.setString(4, exam.getStartTime());
			pSt.setString(5, exam.getEndTime());
			pSt.setString(6, exam.getInstructorID());
			pSt.setString(7, exam.getScheduleID());
			pSt.setInt(8, exam.getMark());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Exam: " + e.getMessage());
		}
		return status;
	}

	public boolean UpdateExam(Examination exam, String examID) {

		boolean status = false;

		try {
			String updateExam = "UPDATE Exam SET ExamTitle='" + exam.getExamTitle() + "',CourseID='"
					+ exam.getCourseID()
					+ "',DeptID=?,StreamID=?,StartTime=?,EndTime=?,InstructorID=?,ScheduleID=?,Mark=? WHERE ExamID=?";
			pSt = con.prepareStatement(updateExam);

			pSt.setString(1, exam.getDeptID());
			pSt.setString(2, exam.getStreamID());
			pSt.setString(3, exam.getStartTime());
			pSt.setString(4, exam.getEndTime());
			pSt.setString(5, exam.getInstructorID());
			pSt.setString(6, exam.getScheduleID());
			pSt.setInt(7, exam.getMark());
			pSt.setString(8, examID);

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Update Exam: " + e.getMessage());
		}
		return status;
	}

	public List<Examination> getAllExam(String instructorID, int rowNum, int totalRow) {

		List<Examination> exams = new ArrayList<Examination>();

		try {
			String getAllExam = "SELECT * FROM Exam WHERE InstructorID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllExam);

			pSt.setString(1, instructorID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Examination ex = new Examination();

				ex.setExamID(rSet.getString("ExamID"));
				ex.setExamTitle(rSet.getString("ExamTitle"));
				ex.setCourseID(rSet.getString("CourseID"));
				ex.setDeptID(rSet.getString("DeptID"));
				ex.setStreamID(rSet.getString("StreamID"));
				ex.setStartTime(rSet.getString("StartTime"));
				ex.setEndTime(rSet.getString("EndTime"));
				ex.setInstructorID(rSet.getString("InstructorID"));
				ex.setScheduleID(rSet.getString("ScheduleID"));
				ex.setMark(rSet.getInt("Mark"));

				exams.add(ex);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Exams: " + e.getMessage());
		}

		return exams;
	}

	public Examination getExamByID(String examID) {

		Examination ex = null;

		try {
			String getExamByID = "SELECT * FROM Exam WHERE ExamID=?";
			pSt = con.prepareStatement(getExamByID);

			pSt.setString(1, examID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				ex = new Examination();

				ex.setExamID(rSet.getString("ExamID"));
				ex.setExamTitle(rSet.getString("ExamTitle"));
				ex.setCourseID(rSet.getString("CourseID"));
				ex.setDeptID(rSet.getString("DeptID"));
				ex.setStreamID(rSet.getString("StreamID"));
				ex.setStartTime(rSet.getString("StartTime"));
				ex.setEndTime(rSet.getString("EndTime"));
				ex.setInstructorID(rSet.getString("InstructorID"));
				ex.setScheduleID(rSet.getString("ScheduleID"));
				ex.setMark(rSet.getInt("Mark"));

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Exams: " + e.getMessage());
		}

		return ex;
	}

	public boolean DeleteExam(String examID) {
		boolean status = false;

		try {
			String deleteExam = "DELETE FROM Exam WHERE ExamID=?";
			pSt = con.prepareStatement(deleteExam);
			pSt.setString(1, examID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Exam: " + e.getMessage());
		}

		return status;
	}

	public static int getRowCount(String instId) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Exam WHERE InstructorID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, instId);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Exam: " + e.getMessage());
		}

		return count;
	}
}
