package com.deanDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.db.DBConnection;
import com.model.Instructor;

public class TeacherDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public TeacherDao() {
		con = DBConnection.createConnection();
	}

	public List<Instructor> getAllInstructors(String collegeID, int rowNum, int totalRow) {

		List<Instructor> instructors = new ArrayList<Instructor>();
		try {
			String getAllInstructors = "SELECT * FROM Instructor WHERE CollegeID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllInstructors);
			pSt.setString(1, collegeID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Instructor inst = new Instructor();

				inst.setInstructorID(rSet.getString(1));
				inst.setFullName(rSet.getString(2));
				inst.setGender(rSet.getString(3));
				inst.setAddress(rSet.getString(4));
				inst.setDeptID(rSet.getString(5));
				inst.setCollegeID(rSet.getString(6));
				inst.setStreamID(rSet.getString(7));

				instructors.add(inst);

			}

		} catch (Exception e) {
			System.out.println("\nUnable to List all Teachers: " + e.getMessage());
		}

		return instructors;
	}

	
	public static int getRowCount(String collegeID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Instructor WHERE CollegeID=?";
			ps = con.prepareStatement(getRows);
			ps.setString(1, collegeID);
			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Instructor: " + e.getMessage());
		}

		return count;
	}

	
}
