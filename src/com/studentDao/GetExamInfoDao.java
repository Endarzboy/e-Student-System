package com.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.db.DBConnection;
import com.model.Examination;

public class GetExamInfoDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public GetExamInfoDao() {
		con = DBConnection.createConnection();
	}
	
	public static int countNoOfQuestionsByExamID(String examIDnO) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Questiontble WHERE ExamID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, examIDnO);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count ExamS: " + e.getMessage());
		}

		return count;
	}

	public String getExamDate(String examID) {

		String examDate = "";
		try {
			String selectExamDate = "SELECT StartTime FROM Exam WHERE ExamID=?";
			pSt = con.prepareStatement(selectExamDate);

			pSt.setString(1, examID);

			rSet = pSt.executeQuery();

			if (rSet.next()) {
				examDate = rSet.getString("StartTime");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Start Date: " + e.getMessage());
		}

		return examDate;
	}

	public String getEndDate(String examID) {

		String endExamDate = "";
		try {
			String selectEndTime = "SELECT EndTime FROM Exam WHERE ExamID=?";
			pSt = con.prepareStatement(selectEndTime);

			pSt.setString(1, examID);

			rSet = pSt.executeQuery();

			if (rSet.next()) {
				endExamDate = rSet.getString("EndTime");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get End Date: " + e.getMessage());
		}

		return endExamDate;
	}

	public List<Examination> getExamByCourseID(String courseID) {

		List<Examination> exams = new ArrayList<Examination>();

		try {
			String getExamByID = "SELECT * FROM Exam WHERE CourseID=?";
			pSt = con.prepareStatement(getExamByID);

			pSt.setString(1, courseID);

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
			System.out.println("\nUnable to get Exams: " + e.getMessage());
		}

		return exams;
	}

	public static void main(String[] args) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("UTC +8"));

		Date d = new Date();
		String today = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDate.now());

		System.out.println(sdf.format(d.getTime()) +" : "+ today);

	}

}
