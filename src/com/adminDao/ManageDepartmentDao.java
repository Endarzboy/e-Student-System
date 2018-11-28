package com.adminDao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.db.DBConnection;
import com.model.Department;

public class ManageDepartmentDao {

	private Connection con = null;
	public ResultSet rSet;
	private PreparedStatement pSet;

	public ManageDepartmentDao() {
		con = DBConnection.createConnection();
	}

	// 1. Import Excel file function
	/*
	 * 2. Batch Insertion function 3. Delete function
	 */
	// 4. Get all department function
	// 5. get/search single department function

	public List<ArrayList<String>> readExcelData(String file,int index) throws IOException {

		List<ArrayList<String>> lists = new ArrayList<ArrayList<String>>();// list
																			// of
																			// list
																			// of
																			// string

		InputStream excelFileToRead = new FileInputStream(file);// read the file
																// as
																// inputstream

		XSSFWorkbook wb = new XSSFWorkbook(excelFileToRead);// read the
															// parameter as
															// excel file

		XSSFSheet sheet = wb.getSheetAt(index);// get the first sheet from the given
											// excel file

		XSSFRow row;// get the row
		XSSFCell cell;// get the column or cell

		int countMaxData = 0;

		Iterator<Row> rows = sheet.rowIterator();

		while (rows.hasNext()) {
			row = (XSSFRow) rows.next();

			// skip the first row because it will be header
			if (row.getRowNum() == 0) {
				countMaxData = row.getLastCellNum();
				continue;
			}

			// exit if row is empty
			if (this.isRowEmpty(row, countMaxData)) {
				// exit processing
				break;
			}

			ArrayList<String> singleElement = new ArrayList<String>();

			for (int i = 0; i < countMaxData; i++) {
				cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK);

				switch (cell.getCellType()) {

				case Cell.CELL_TYPE_STRING:
					singleElement.add(cell.getStringCellValue());
					break;
				case Cell.CELL_TYPE_NUMERIC:
					singleElement.add(String.valueOf(cell.getNumericCellValue()));
					break;

				default:
					singleElement.add(cell.getStringCellValue());
					break;
				}
			}

			lists.add(singleElement);

		}

		return lists;

	}

	public boolean isRowEmpty(Row row, int lastCellNo) {
		for (int i = row.getFirstCellNum(); i < lastCellNo; i++) {
			Cell cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK);
			if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK) {
				return false;
			}
		}
		return true;
	}

	public boolean BatchInsertion(Department dept) {

		boolean status = false;
		try {
			String batchInsertion = "INSERT INTO Department(DeptID,DeptName,CollegeID,Description) VALUES(?,?,?,?)";
			pSet = con.prepareStatement(batchInsertion);
			pSet.setString(1, dept.getDeptID());
			pSet.setString(2, dept.getDeptName());
			pSet.setString(3, dept.getCollegeID());
			pSet.setString(4, dept.getDescription());

			pSet.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Department: " + e.getMessage());
		}

		return status;
	}

	public boolean DeleteDept(String id) {

		boolean status = false;
		try {
			String batchInsertion = "DELETE FROM Department WHERE DeptID=?";
			pSet = con.prepareStatement(batchInsertion);
			pSet.setString(1, id);

			pSet.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Delete Department: " + e.getMessage());
		}

		return status;

	}

	public List<Department> getAllDepartments(int rowNum,int totlaNum) {
		List<Department> depts = new ArrayList<Department>();

		try {
			String selectAll = "SELECT * FROM Department LIMIT ?,?";
			pSet = con.prepareStatement(selectAll);
			pSet.setInt(1, rowNum);
			pSet.setInt(2, totlaNum);
			
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
	
	public static int getRowCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pStatement;
		ResultSet rSet;
		try {
			con = DBConnection.createConnection();
			String countStudent = "SELECT COUNT(*) FROM Department";
			pStatement = con.prepareStatement(countStudent);
			rSet = pStatement.executeQuery();

			if (rSet.next()) {
				count = rSet.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to Count Departments: " + e.getMessage());
		}

		return count;
	}

	public Department getDeptByID(String id) {
		Department dp = null;

		try {
			String selectAll = "SELECT * FROM Department WHERE DeptID=?";
			pSet = con.prepareStatement(selectAll);
			pSet.setString(1, id);

			rSet = pSet.executeQuery();
			while (rSet.next()) {
				dp = new Department();
				
				dp.setDeptID(rSet.getString(1));
				dp.setDeptName(rSet.getString(2));
				dp.setCollegeID(rSet.getString(3));
				dp.setDescription(rSet.getString(4));


			}

		} catch (Exception e) {
			System.out.println("\nUnable to Fetch Department: " + e.getMessage());
		}
		return dp;
	}

	public static void main(String[] args) throws IOException {
		// DepartmentDao mDao = new DepartmentDao();
		// List<ArrayList<String>> lists =
		// mDao.readExcelData("E:/toImport.xlsx");
		//
		// System.out.println("Department ID" + "\t" + "Department Name" + "\t"
		// + "Department Desc");
		// for (ArrayList<String> dept : lists) {
		//
		// System.out.println(dept.get(0) + "\t" + dept.get(1) + "\t" +
		// dept.get(2));
		// }
	}

}
