package com.adminDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Account;

public class AccountDao {

	private Connection con = null;
	private Statement statement;
	public ResultSet rSet;
	private PreparedStatement pSet;

	public AccountDao() {
		con = DBConnection.createConnection();
	}

	// 1. createAccount()
	// 2. Delete Account
	// 3. View All Accounts
	// 4. Search Account by ID or Email
	// 5. Update account function
	// 6. select department
	// 7. select department name

	public String selectDeptName(String dp) {

		String deptName = "";

		try {
			String selectDept = "SELECT DeptName FROM Department WHERE DeptID=?";
			pSet = con.prepareStatement(selectDept);
			pSet.setString(1, dp);

			rSet = pSet.executeQuery();
			if (rSet.next()) {
				deptName = rSet.getString("DeptName");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to select Department: " + e.getMessage());
		}

		return deptName;
	}

	public String getCollegeTitle(String collegeID) {

		String collegeTitle = "";

		try {
			String selectcollege = "SELECT CollegeName FROM College WHERE CollegeID=?";
			pSet = con.prepareStatement(selectcollege);
			pSet.setString(1, collegeID);

			rSet = pSet.executeQuery();
			if (rSet.next()) {
				collegeTitle = rSet.getString("CollegeName");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to select College Title: " + e.getMessage());
		}

		return collegeTitle;
	}

	public String selectCourse(String instID) {

		String courseCode = "";

		try {
			String selectCourse = "SELECT CourseID FROM CourseOffer WHERE InstructorID=?";
			pSet = con.prepareStatement(selectCourse);
			pSet.setString(1, instID);

			rSet = pSet.executeQuery();
			if (rSet.next()) {
				courseCode = rSet.getString("CourseID");
			}
		} catch (Exception e) {
			System.out.println("\nUnable to select Course: " + e.getMessage());
		}

		return courseCode;
	}

	public boolean CreateAccount(Account user) {

		boolean status = false;
		try {
			String createQuery = "INSERT INTO Accounts(UserID,DeptID,CollegeID,EmailAddress,UserName,Password,Role) VALUES(?,?,?,?,?,?,?)";
			pSet = con.prepareStatement(createQuery);
			pSet.setString(1, user.getUserID());
			pSet.setString(2, user.getDeptID());
			pSet.setString(3, user.getCollegeID());
			pSet.setString(4, user.getEmailAddress());
			pSet.setString(5, user.getUserName());
			pSet.setString(6, user.getPasswowrd());
			pSet.setString(7, user.getRole());

			pSet.executeUpdate();

			status = true;

			con.close();
		} catch (Exception e) {
			System.out.println("\nUnable to Create Account: " + e.getMessage());
		}

		return status;
	}

	public boolean UpdateAccount(Account user) {
		boolean status = false;
		try {
			String updateAcc = "UPDATE Accounts SET EmailAddress=?,UserName=?,Password=? WHERE UserID=?";
			pSet = con.prepareStatement(updateAcc);

			pSet.setString(1, user.getEmailAddress());
			pSet.setString(2, user.getUserName());
			pSet.setString(3, user.getPasswowrd());
			pSet.setString(4, user.getUserID());

			pSet.executeUpdate();

			status = true;

			con.close();

		} catch (Exception e) {
			System.out.println("\nUnable to Update Account: " + e.getMessage());
		}

		return status;
	}

	public boolean DeleteAccount(String userId) {

		boolean status = false;
		try {
			String deleteQuery = "DELETE FROM Accounts WHERE UserID=?";
			pSet = con.prepareStatement(deleteQuery);
			pSet.setString(1, userId);

			pSet.executeUpdate();

			status = true;

			con.close();
		} catch (Exception e) {
			System.out.println("\nUnable to Delete Account: " + e.getMessage());
		}

		return status;
	}

	public List<Account> ListAllAccount(int rowNum, int lastRow) {

		List<Account> accounts = new ArrayList<Account>();

		try {
			String selectAll = "SELECT * FROM Accounts LIMIT ?,?";
			pSet = con.prepareStatement(selectAll);
			pSet.setInt(1, rowNum);
			pSet.setInt(2, lastRow);

			rSet = pSet.executeQuery();
			while (rSet.next()) {
				Account user = new Account();
				user.setUserID(rSet.getString(1));
				user.setDeptID(rSet.getString(2));
				user.setCollegeID(rSet.getString(3));
				user.setEmailAddress(rSet.getString(4));
				user.setUserName(rSet.getString(5));
				user.setPasswowrd(rSet.getString(6));
				user.setRole(rSet.getString(7));

				accounts.add(user);
			}

			con.close();
		} catch (Exception e) {
			System.out.println("\nUnable to List Accounts: " + e.getMessage());
		}

		return accounts;
	}

	public static int getRowCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pStatement;
		ResultSet rSet;
		try {
			con = DBConnection.createConnection();
			String countStudent = "SELECT COUNT(*) FROM Accounts";
			pStatement = con.prepareStatement(countStudent);
			rSet = pStatement.executeQuery();

			if (rSet.next()) {
				count = rSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to Count Accounts: " + e.getMessage());
		}

		return count;
	}

	public Account SearchAccountByID(String userId) {

		Account user = new Account();

		try {
			String selectAll = "SELECT * FROM Accounts WHERE UserID=?";
			pSet = con.prepareStatement(selectAll);
			pSet.setString(1, userId);// au001

			rSet = pSet.executeQuery();
			while (rSet.next()) {

				user.setUserID(rSet.getString(1));
				user.setDeptID(rSet.getString(2));
				user.setCollegeID(rSet.getString(3));
				user.setEmailAddress(rSet.getString(4));
				user.setUserName(rSet.getString(5));
				user.setPasswowrd(rSet.getString(6));
				user.setRole(rSet.getString(7));

			}

			con.close();
		} catch (Exception e) {
			System.out.println("\nUnable to Search Accounts: " + e.getMessage());
		}

		return user;
	}

	public String AuthenticatUsers(Account user) {

		String userName = user.getUserName();// selu//mark
		String password = user.getPasswowrd();// selu//mark

		String userNameDB = "";
		String passwordDB = "";
		String roleDB = "";

		try {
			String loginQuery = "SELECT * FROM Accounts";
			statement = con.createStatement();
			rSet = statement.executeQuery(loginQuery);

			while (rSet.next()) {
				userNameDB = rSet.getString("UserName");// selu//mark
				passwordDB = rSet.getString("Password");// selu//mark
				roleDB = rSet.getString("Role");// instructor//department

				if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("admin"))
					return "admin";
				else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("dean"))
					return "dean";
				else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("department"))
					return "department";
				else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("instructor"))
					return "instructor";
				else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("student"))
					return "student";

			}

		} catch (Exception e) {
			System.out.println("\nUnable to Login: " + e.getMessage());
		}

		return "Invalid User";
	}

}
