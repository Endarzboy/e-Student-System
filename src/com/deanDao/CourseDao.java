package com.deanDao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.db.DBConnection;
import com.model.Course;

public class CourseDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public CourseDao() {
		con = DBConnection.createConnection();
	}


	public List<Course> getAllCourses(String collegeID, int rowNum, int lastRow) {

		List<Course> courses = new ArrayList<Course>();
		try {
			String getAllcourses = "SELECT * FROM Course WHERE CollegeID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllcourses);
			pSt.setString(1, collegeID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, lastRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Course c = new Course();
				c.setCourseCode(rSet.getString(1));
				c.setTitle(rSet.getString(2));
				c.setCreditHour(rSet.getString(3));
				c.setPreRequisit(rSet.getString(4));
				c.setDeptID(rSet.getString(5));
				c.setCollegeID(rSet.getString(6));
				c.setStreamID(rSet.getString(7));

				courses.add(c);

			}

		} catch (Exception e) {
			System.out.println("\nUnable to List all courses: " + e.getMessage());
		}

		return courses;
	}

	

	public static int getRowCount(String collegeID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Course WHERE CollegeID=?";
			ps = con.prepareStatement(getRows);
			
			ps.setString(1, collegeID);
			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of courses: " + e.getMessage());
		}

		return count;
	}

}
