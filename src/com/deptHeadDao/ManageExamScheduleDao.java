package com.deptHeadDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.ExamSchedule;

public class ManageExamScheduleDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageExamScheduleDao() {
		con = DBConnection.createConnection();
	}

	// 1. insert function
	// 2. get all function
	// 3. delete function
	// 4.get number of rows
	// 5. update schedule

	public boolean AddSchedule(ExamSchedule schedule) {
		boolean status = false;

		try {
			String insertSchedule = "INSERT INTO ExamSchedule(ScheduleID,CourseID,DeptID,DateOfExam,ExamNotice,ExamTime,Invigilator,Batch) VALUES(?,?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertSchedule);

			pSt.setString(1, schedule.getScheduleID());
			pSt.setString(2, schedule.getCourseID());
			pSt.setString(3, schedule.getDeptID());
			pSt.setString(4, schedule.getDateOfExam());
			pSt.setString(5, schedule.getExamNotice());
			pSt.setString(6, schedule.getExamTime());
			pSt.setString(7, schedule.getInvigilator());
			pSt.setInt(8, schedule.getBatch());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to add schedule: " + e.getMessage());
		}

		return status;
	}

	public boolean UpdateSchedule(ExamSchedule schedule) {
		boolean status = false;

		try {
			String updateSchedule = "UPDATE ExamSchedule SET CourseID=?,DeptID=?,DateOfExam=?,ExamNotice=?,ExamTime=?,Invigilator=?,Batch=? WHERE ScheduleID=?";
			pSt = con.prepareStatement(updateSchedule);

			pSt.setString(1, schedule.getCourseID());
			pSt.setString(2, schedule.getDeptID());
			pSt.setString(3, schedule.getDateOfExam());
			pSt.setString(4, schedule.getExamNotice());
			pSt.setString(5, schedule.getExamTime());
			pSt.setString(6, schedule.getInvigilator());
			pSt.setInt(7, schedule.getBatch());
			pSt.setString(8, schedule.getScheduleID());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to update schedule: " + e.getMessage());
		}

		return status;
	}

	public List<ExamSchedule> getAllSchedule(String dept, int rowNum, int totalRow) {

		List<ExamSchedule> examSchedules = new ArrayList<ExamSchedule>();
		try {
			String getAllExamSchedules = "SELECT * FROM ExamSchedule WHERE DeptID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllExamSchedules);
			pSt.setString(1, dept);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

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

	public ExamSchedule getScheduleByID(String id) {
		ExamSchedule es = null;
		try {
			String getExamSchedules = "SELECT * FROM ExamSchedule WHERE ScheduleID=?";
			pSt = con.prepareStatement(getExamSchedules);
			pSt.setString(1, id);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				es = new ExamSchedule();

				es.setScheduleID(rSet.getString(1));
				es.setCourseID(rSet.getString(2));
				es.setDeptID(rSet.getString(3));
				es.setDateOfExam(rSet.getString(4));
				es.setExamNotice(rSet.getString(5));
				es.setExamTime(rSet.getString(6));
				es.setInvigilator(rSet.getString(7));
				es.setBatch(rSet.getInt(8));

			}

		} catch (Exception e) {
			System.out.println("\nUnable to get Schedules: " + e.getMessage());
		}

		return es;
	}

	public boolean DeleteSchedule(String scheduleID) {
		boolean status = false;

		try {
			String deleteSchedule = "DELETE FROM ExamSchedule WHERE ScheduleID=?";
			pSt = con.prepareStatement(deleteSchedule);
			pSt.setString(1, scheduleID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Schedule: " + e.getMessage());
		}

		return status;
	}

	public static int getRowCount(String deptID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM ExamSchedule WHERE DeptID=?";
			ps = con.prepareStatement(getRows);
			ps.setString(1, deptID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of schedulest: " + e.getMessage());
		}

		return count;
	}
}
