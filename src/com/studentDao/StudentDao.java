package com.studentDao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Course;

public class StudentDao {

	public Connection con = null;
	public PreparedStatement pSt, pst1;
	public ResultSet rSet, rSet1;

	public StudentDao() {
		con = DBConnection.createConnection();
	}

	public List<Course> getCourseList(String studentID) {

		List<Course> courses = new ArrayList<Course>();
		try {
			String getCourse = "SELECT * FROM Course c INNER JOIN CourseToStudent t ON t.CourseID=c.CourseCode AND t.StudentID=?";
			pSt = con.prepareStatement(getCourse);
			pSt.setString(1, studentID);

			rSet = pSt.executeQuery();
			while (rSet.next()) {
				Course course = new Course();
				course.setCourseCode(rSet.getString("CourseCode"));
				course.setTitle(rSet.getString("Title"));
				course.setCreditHour(rSet.getString("CreditHrs"));
				course.setPreRequisit(rSet.getString("PreReq"));
				course.setDeptID(rSet.getString("DeptID"));
				course.setStreamID(rSet.getString("StreamID"));

				courses.add(course);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Course Details: " + e.getMessage());
		}

		return courses;
	}

}
