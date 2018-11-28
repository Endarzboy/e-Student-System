package com.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Handout;

public class HandoutDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public HandoutDao() {
		con = DBConnection.createConnection();
	}
	
	public List<Handout> getAllHandouts(String courseID, int rowNum, int totalRow) {

		List<Handout> handouts = new ArrayList<Handout>();

		try {
			String getAllHos = "SELECT * FROM Handout WHERE CourseID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllHos);

			pSt.setString(1, courseID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Handout ho = new Handout();

				ho.setHandoutID(rSet.getString("HandoutID"));
				ho.setCourseID(rSet.getString("CourseID"));
				ho.setFileName(rSet.getString("FileName"));
				ho.setFileSize(rSet.getInt("FileSize"));
				ho.setStreamID(rSet.getString("StreamID"));
				ho.setDeptID(rSet.getString("DeptID"));
				ho.setPreparedBy(rSet.getString("InstructorID"));
				ho.setBatch(rSet.getInt("Batch"));
				ho.setSemester(rSet.getInt("Semester"));

				handouts.add(ho);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Handouts: " + e.getMessage());
		}

		return handouts;
	}
	
	public static int getRowCount(String courseID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Handout WHERE CourseID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, courseID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Handout: " + e.getMessage());
		}

		return count;
	}
}
