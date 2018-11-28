package com.instructorDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.db.DBConnection;
import com.model.Course;
import com.model.CourseToStudent;

public class CourseDetail {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public CourseDetail() {
		con = DBConnection.createConnection();
	}

	public Course getCourseByCode(String code) {

		Course c = null;
		try {
			String getCourseByCode = "SELECT * FROM Course WHERE CourseCode=?";
			pSt = con.prepareStatement(getCourseByCode);
			pSt.setString(1, code);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				c = new Course();
				c.setCourseCode(rSet.getString(1));
				c.setTitle(rSet.getString(2));
				c.setCreditHour(rSet.getString(3));
				c.setPreRequisit(rSet.getString(4));
				c.setDeptID(rSet.getString(5));
				c.setCollegeID(rSet.getString(6));
				c.setStreamID(rSet.getString(7));

			}

		} catch (Exception e) {
			System.out.println("\nUnable to get course: " + e.getMessage());
		}

		return c;
	}

	public String getCourseCode(String instID) {

		String courseID = "";
		try {
			String getCourseByCode = "SELECT * FROM CourseOffer WHERE InstructorID=?";
			pSt = con.prepareStatement(getCourseByCode);
			pSt.setString(1, instID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				courseID = rSet.getString("CourseID");// ai2004
			}

		} catch (Exception e) {
			System.out.println("\nUnable to get course: " + e.getMessage());
		}

		return courseID;
	}

	public List<CourseToStudent> getStudentTakingCourse(String courseID) {

		List<CourseToStudent> studs = new ArrayList<CourseToStudent>();
		try {
			String getStudentsTakingCourse = "SELECT * FROM CourseToStudent WHERE CourseID=?";
			pSt = con.prepareStatement(getStudentsTakingCourse);
			pSt.setString(1, courseID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				CourseToStudent cs = new CourseToStudent();
				cs.setStudentID(rSet.getString("StudentID"));
				/*
				 * s.setFullName(rSet.getString("FullName"));
				 * s.setGender(rSet.getString("Gender"));
				 * s.setAddress(rSet.getString("Address"));
				 * s.setDeptID(rSet.getString("DeptID"));
				 * s.setStreamID(rSet.getString("StreamID"));
				 * s.setBatch(rSet.getString("Batch"));
				 */

				studs.add(cs);
			}

		} catch (Exception e) {
			System.out.println("\nUnable to get student: " + e.getMessage());
		}

		return studs;
	}

}
