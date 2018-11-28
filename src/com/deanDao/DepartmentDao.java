package com.deanDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Department;

public class DepartmentDao {

	private Connection con = null;
	public ResultSet rSet;
	private PreparedStatement pSet;

	public DepartmentDao() {
		con = DBConnection.createConnection();
	}

	public List<Department> getAllDepartments(String college, int rowNum, int totlaNum) {
		List<Department> depts = new ArrayList<Department>();

		try {
			String selectAll = "SELECT * FROM Department WHERE CollegeID=? LIMIT ?,?";
			pSet = con.prepareStatement(selectAll);

			pSet.setString(1, college);
			pSet.setInt(2, rowNum);
			pSet.setInt(3, totlaNum);

			rSet = pSet.executeQuery();
			while (rSet.next()) {
				Department dp = new Department();
				dp.setDeptID(rSet.getString(1));
				dp.setDeptName(rSet.getString(2));
				dp.setCollegeID(rSet.getString(3));
				dp.setDescription(rSet.getString(4));

				depts.add(dp);
			}

		} catch (Exception e) {
			System.out.println("\nUnable to Fetch Departments: " + e.getMessage());
		}
		return depts;
	}

	public static int getRowCount(String college) {
		int count = 0;
		Connection con = null;
		PreparedStatement pStatement;
		ResultSet rSet;
		try {
			con = DBConnection.createConnection();
			String countStudent = "SELECT COUNT(*) FROM Department WHERE CollegeID=?";
			pStatement = con.prepareStatement(countStudent);
			pStatement.setString(1, college);

			rSet = pStatement.executeQuery();

			if (rSet.next()) {
				count = rSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to Count Departments: " + e.getMessage());
		}

		return count;
	}

}
