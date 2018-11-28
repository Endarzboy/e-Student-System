package com.deptHeadDao;

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
import com.model.Instructor;

public class ManageTeacherDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageTeacherDao() {
		con = DBConnection.createConnection();
	}

	// 1. import teacher list function
	// 2. batch insertion function
	// 3. get all teachers function
	// 4. get teachers by id
	// 5. Delete teacher

	public List<ArrayList<String>> importTeacher(String path,int index) throws IOException {

		List<ArrayList<String>> lists = new ArrayList<ArrayList<String>>();

		InputStream excelFiletoRead = new FileInputStream(path);

		XSSFWorkbook wb = new XSSFWorkbook(excelFiletoRead);

		XSSFSheet sheet = wb.getSheetAt(index);

		XSSFRow row;
		XSSFCell cell;

		int countMaxData = 0;

		Iterator<Row> rows = sheet.rowIterator();

		while (rows.hasNext()) {

			row = (XSSFRow) rows.next();

			if (row.getRowNum() == 0) {
				countMaxData = row.getLastCellNum();// 6
				continue;
			}

			// call function that exits the loop if the row is empty
			if (this.isRowEmpty(row, countMaxData)) {
				// exit processing
				System.out.println("Rows are all empty");
				break;
			}
			// if the row is not empty
			ArrayList<String> internalList = new ArrayList<String>();

			for (int i = 0; i < countMaxData; i++) {
				cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK);
				switch (cell.getCellType()) {
				case Cell.CELL_TYPE_STRING:
					internalList.add(cell.getStringCellValue());
					break;
				case Cell.CELL_TYPE_NUMERIC:
					internalList.add(String.valueOf(cell.getNumericCellValue()));
					break;

				default:
					internalList.add(cell.getStringCellValue());
					break;
				}
			}
			//
			lists.add(internalList);

		}

		return lists;
	}

	public boolean BatchInsertion(Instructor instructor) {
		boolean status = false;

		try {
			String batchInsertion = "INSERT INTO Instructor(InstructorID,FullName,Gender,Address,DeptID,CollegeID,StreamID) VALUES(?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(batchInsertion);

			pSt.setString(1, instructor.getInstructorID());
			pSt.setString(2, instructor.getFullName());
			pSt.setString(3, instructor.getGender());
			pSt.setString(4, instructor.getAddress());
			pSt.setString(5, instructor.getDeptID());
			pSt.setString(6, instructor.getCollegeID());
			pSt.setString(7, instructor.getStreamID());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to insert block of Teachers: " + e.getMessage());
		}

		return status;
	}

	public List<Instructor> getAllInstructors(String dept, int rowNum, int totalRow) {

		List<Instructor> instructors = new ArrayList<Instructor>();
		try {
			String getAllInstructors = "SELECT * FROM Instructor WHERE DeptID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllInstructors);
			pSt.setString(1, dept);
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

	public Instructor getInstructorByID(String id) {

		Instructor inst = null;
		try {
			String getInstructorByID = "SELECT * FROM Instructor WHERE InstructorID=?";
			pSt = con.prepareStatement(getInstructorByID);
			pSt.setString(1, id);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				inst = new Instructor();

				inst.setInstructorID(rSet.getString(1));
				inst.setFullName(rSet.getString(2));
				inst.setGender(rSet.getString(3));
				inst.setAddress(rSet.getString(4));
				inst.setDeptID(rSet.getString(5));
				inst.setCollegeID(rSet.getString(6));
				inst.setStreamID(rSet.getString(7));
			}

		} catch (Exception e) {
			System.out.println("\nUnable to get course: " + e.getMessage());
		}

		return inst;
	}

	public boolean DeleteInstructor(String id) {
		boolean status = false;

		try {
			String deleteInstructor = "DELETE FROM Instructor WHERE InstructorID=?";
			pSt = con.prepareStatement(deleteInstructor);
			pSt.setString(1, id);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Instructor: " + e.getMessage());
		}

		return status;
	}

	public boolean isRowEmpty(Row row, int totalRow) {

		for (int i = 0; i < totalRow; i++) {
			Cell cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK);
			if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK) {
				return false;
			}
		}
		return true;
	}

	public static int getRowCount(String deptid) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Instructor WHERE DeptID=?";
			ps = con.prepareStatement(getRows);
			ps.setString(1, deptid);
			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Instructor: " + e.getMessage());
		}

		return count;
	}

	public static void main(String[] args) throws IOException {
		ManageTeacherDao mtDao = new ManageTeacherDao();
		List<ArrayList<String>> lists = mtDao.importTeacher("E:/toImport.xlsx",5);
		for (ArrayList<String> arrayList : lists) {
			System.out.println(arrayList.get(0));
			System.out.println("Nothing");
		}
	}

}
