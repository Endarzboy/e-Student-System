package com.clientSide;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.ExamSchedule;

public class ScheduleDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ScheduleDao() {
		con = DBConnection.createConnection();
	}
	
	public List<ExamSchedule> getAllSchedule(int rowNum, int totalRow) {

		List<ExamSchedule> examSchedules = new ArrayList<ExamSchedule>();
		try {
			String getAllExamSchedules = "SELECT * FROM ExamSchedule LIMIT ?,?";
			pSt = con.prepareStatement(getAllExamSchedules);
			pSt.setInt(1, rowNum);
			pSt.setInt(2, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				ExamSchedule es = new ExamSchedule();
				es.setScheduleID(rSet.getString(1));
				es.setCourseID(rSet.getString(2));
				es.setDeptID(rSet.getString(3));
				es.setDateOfExam(rSet.getString(4));
				es.setExamNotice(rSet.getString(5));
				es.setExamTime(rSet.getString(6));
				es.setInvigilator(rSet.getString(7));
				es.setBatch(rSet.getInt(8));

				examSchedules.add(es);

			}

		} catch (Exception e) {
			System.out.println("\nUnable to List all Schedules: " + e.getMessage());
		}

		return examSchedules;
	}
	
	public List<ExamSchedule> getAllScheduleByDeptID(String deptID) {

		List<ExamSchedule> examSchedules = new ArrayList<ExamSchedule>();
		try {
			String getAllExamSchedules = "SELECT * FROM ExamSchedule WHERE DeptID=?";
			pSt = con.prepareStatement(getAllExamSchedules);
			pSt.setString(1, deptID);
			rSet = pSt.executeQuery();

			while (rSet.next()) {
				ExamSchedule es = new ExamSchedule();
				es.setScheduleID(rSet.getString(1));
				es.setCourseID(rSet.getString(2));
				es.setDeptID(rSet.getString(3));
				es.setDateOfExam(rSet.getString(4));
				es.setExamNotice(rSet.getString(5));
				es.setExamTime(rSet.getString(6));
				es.setInvigilator(rSet.getString(7));
				es.setBatch(rSet.getInt(8));

				examSchedules.add(es);

			}

		} catch (Exception e) {
			System.out.println("\nUnable to List all Schedules: " + e.getMessage());
		}

		return examSchedules;
	}

	
	public static int getRowCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM ExamSchedule";
			ps = con.prepareStatement(getRows);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Schedules: " + e.getMessage());
		}

		return count;
	}
}
