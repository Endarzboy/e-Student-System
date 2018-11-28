package com.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.Instructor;

public class InfoHubDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public InfoHubDao() {
		con = DBConnection.createConnection();
	}

	public String getCourseTitle(String ccid) {

		String title = "";
		try {
			String selectCourseTitle = "SELECT Title FROM Course WHERE CourseCode=?";
			pSt = con.prepareStatement(selectCourseTitle);

			pSt.setString(1, ccid);

			rSet = pSt.executeQuery();

			if (rSet.next()) {
				title = rSet.getString("Title");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Course Title: " + e.getMessage());
		}

		return title;
	}

	public Instructor getInstructorName(String courseID) {

		Instructor instructor = null;
		try {
			String selectInst = "SELECT * FROM Instructor i INNER JOIN CourseOffer co ON co.InstructorID=i.InstructorID WHERE co.CourseID=?";
			pSt = con.prepareStatement(selectInst);

			pSt.setString(1, courseID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				instructor = new Instructor();
				instructor.setInstructorID(rSet.getString(1));
				instructor.setFullName(rSet.getString(2));
				instructor.setGender(rSet.getString(3));
				instructor.setAddress(rSet.getString(4));
				instructor.setDeptID(rSet.getString(5));
				instructor.setStreamID(rSet.getString(6));

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Course Title: " + e.getMessage());
		}

		return instructor;
	}

	public String getCourseTitleFromExambyExamID(String examID) {

		String title = "";
		try {
			String selectTitle = "SELECT Title FROM Course c INNER JOIN Exam ex ON ex.CourseID=c.CourseCode WHERE ex.ExamID=?";
			pSt = con.prepareStatement(selectTitle);

			pSt.setString(1, examID);

			rSet = pSt.executeQuery();

			if (rSet.next()) {
				title = rSet.getString("Title");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Course Title: " + e.getMessage());
		}

		return title;
	}

	public String getExamTitle(String examID) {

		String examTitle = "";
		try {
			String selectExamTitle = "SELECT ExamTitle FROM Exam WHERE ExamID=?";
			pSt = con.prepareStatement(selectExamTitle);

			pSt.setString(1, examID);

			rSet = pSt.executeQuery();

			if (rSet.next()) {
				examTitle = rSet.getString("ExamTitle");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Exam Title: " + e.getMessage());
		}

		return examTitle;
	}

	public String getInstructorNameFromExambyExamID(String examID) {

		String name = "";
		try {
			String selectinstructorName = "SELECT FullName FROM Instructor i INNER JOIN Exam ex ON ex.InstructorID=i.InstructorID WHERE ex.ExamID=?";
			pSt = con.prepareStatement(selectinstructorName);

			pSt.setString(1, examID);

			rSet = pSt.executeQuery();

			if (rSet.next()) {
				name = rSet.getString("FullName");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Instructor Name: " + e.getMessage());
		}

		return name;
	}
}
