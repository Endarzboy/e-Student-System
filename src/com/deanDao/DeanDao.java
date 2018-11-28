package com.deanDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;

public class DeanDao {

	private Connection con = null;
	public ResultSet rSet, rSet1;
	private PreparedStatement pSet, pSet1;

	public DeanDao() {
		con = DBConnection.createConnection();
	}

	public void insertToSelectdColumns() {

		String deptID = "";
		try {
			String sql1 = "SELECT DeptID FROM Accounts";
			pSet1 = con.prepareStatement(sql1);

			rSet1 = pSet1.executeQuery();
			while (rSet1.next()) {
				deptID = rSet1.getString("DeptID");

				if (deptID.equals("d1001") && deptID.equals("d1002")) {
					String sql = "INSERT INTO Accounts(CollegeID) VALUE(?)";
					pSet = con.prepareStatement(sql);
					pSet.setString(1, "Coll111");

					pSet.executeUpdate();
					System.out.println("CollegeID has been Inserted ");
				} else if (deptID.equals("d1003") && deptID.equals("d1004")) {
					String sql = "INSERT INTO Accounts(CollegeID) VALUE(?)";
					pSet = con.prepareStatement(sql);
					pSet.setString(1, "Coll122");

					pSet.executeUpdate();
					System.out.println("CollegeID has been Inserted ");
				} else if (deptID.equals("d1005")) {
					String sql = "INSERT INTO Accounts(CollegeID) VALUE(?)";
					pSet = con.prepareStatement(sql);
					pSet.setString(1, "Coll2321");

					pSet.executeUpdate();
					System.out.println("CollegeID has been Inserted ");
				} else {
					System.out.println("Sorry, I cant help u");
				}
			}

		} catch (Exception e) {
			System.out.println("\nCan not insert College ID: " + e.getMessage());
		}

	}

	public static void main(String[] args) {
		new DeanDao().insertToSelectdColumns();
	}
}
