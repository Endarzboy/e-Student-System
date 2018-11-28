package com.deptHeadDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Student;

public class ManageStudentDao {

	private Connection con = null;
	public ResultSet rSet;
	private PreparedStatement pSet;

	public ManageStudentDao() {
		con = DBConnection.createConnection();
	}

	// 1. Get all department function
	// 2. get/search single department function

	public List<Student> getAllStudents(String dept, int rowNumber, int totalNumber) {
		List<Student> students = new ArrayList<Student>();

		try {
			String selectAll = "SELECT * FROM Student WHERE DeptID=? LIMIT ?,?";
			pSet = con.prepareStatement(selectAll);
			pSet.setString(1, dept);
			pSet.setInt(2, rowNumber);
			pSet.setInt(3, totalNumber);

			rSet = pSet.executeQuery();
			while (rSet.next()) {
				Student stud = new Student();
				stud.setStudentID(rSet.getString(1));
				stud.setFullName(rSet.getString(2));
				stud.setGender(rSet.getString(3));
				stud.setAddress(rSet.getString(4));
				stud.setDeptID(rSet.getString(5));
				stud.setCollegeID(rSet.getString(6));
				stud.setStreamID(rSet.getString(7));
				stud.setBatch(rSet.getString(8));

				students.add(stud);
			}

		} catch (Exception e) {
			System.out.println("\nUnable to Fetch Students: " + e.getMessage());
		}
		return students;
	}

	public static int getRowCount(String deptID) {
		int count = 0;
		Connection con = null;
		PreparedStatement pStatement;
		ResultSet rSet;
		try {
			con = DBConnection.createConnection();
			String countStudent = "SELECT COUNT(*) FROM Student WHERE DeptID=?";
			pStatement = con.prepareStatement(countStudent);
			pStatement.setString(1, deptID);
			rSet = pStatement.executeQuery();

			if (rSet.next()) {
				count = rSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to Count Students: " + e.getMessage());
		}

		return count;
	}

	public Student getStudentByID(String id) {
		Student stud = null;

		try {
			String selectAll = "SELECT * FROM Student WHERE StudentID=?";
			pSet = con.prepareStatement(selectAll);
			pSet.setString(1, id);

			rSet = pSet.executeQuery();
			while (rSet.next()) {
				stud = new Student();
				stud.setStudentID(rSet.getString(1));
				stud.setFullName(rSet.getString(2));
				stud.setGender(rSet.getString(3));
				stud.setAddress(rSet.getString(4));
				stud.setDeptID(rSet.getString(5));
				stud.setCollegeID(rSet.getString(6));
				stud.setStreamID(rSet.getString(7));
				stud.setBatch(rSet.getString(8));
			}

		} catch (Exception e) {
			System.out.println("\nUnable to Fetch Student: " + e.getMessage());
		}
		return stud;
	}

	public List<Student> getStudentByBatch(String batch) {
		List<Student> students = new ArrayList<Student>();

		try {
			String selectAll = "SELECT * FROM Student WHERE Batch=?";
			pSet = con.prepareStatement(selectAll);
			pSet.setString(1, batch);

			rSet = pSet.executeQuery();
			while (rSet.next()) {
				Student stud = new Student();
				stud.setStudentID(rSet.getString(1));
				stud.setFullName(rSet.getString(2));
				stud.setGender(rSet.getString(3));
				stud.setAddress(rSet.getString(4));
				stud.setDeptID(rSet.getString(5));
				stud.setStreamID(rSet.getString(6));
				stud.setBatch(rSet.getString(7));

				students.add(stud);
			}

		} catch (Exception e) {
			System.out.println("\nUnable to Fetch Students: " + e.getMessage());
		}
		return students;
	}

}
