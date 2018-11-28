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
import com.model.Student;

public class ManageStudentDao {

	private Connection con = null;
	public ResultSet rSet, rSet1;
	private PreparedStatement pSet;

	public ManageStudentDao() {
		con = DBConnection.createConnection();
	}

	// 1. Import Excel file function
	/*
	 * 2. Batch Insertion function 3. Delete function
	 */
	// 4. Get all department function
	// 5. get/search single department function

	public boolean BatchInsertion(Student stud) {

		boolean status = false;
		try {
			String batchInsertion = "INSERT INTO Student(StudentID,FullName,Gender,Address,DeptID,CollegeID,StreamID,Batch) VALUES(?,?,?,?,?,?,?,?)";
			pSet = con.prepareStatement(batchInsertion);
			pSet.setString(1, stud.getStudentID());
			pSet.setString(2, stud.getFullName());
			pSet.setString(3, stud.getGender());
			pSet.setString(4, stud.getAddress());
			pSet.setString(5, stud.getDeptID());
			pSet.setString(6, stud.getCollegeID());
			pSet.setString(7, stud.getStreamID());
			pSet.setString(8, stud.getBatch());

			pSet.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Student: " + e.getMessage());
		}

		return status;
	}

	public boolean DeleteStudent(String id) {

		boolean status = false;
		try {
			String deleteStudent = "DELETE FROM Student WHERE StudentID=?";
			pSet = con.prepareStatement(deleteStudent);
			pSet.setString(1, id);

			pSet.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Delete Student: " + e.getMessage());
		}

		return status;

	}

	public List<Student> getAllStudents(int rowNumber, int totalNumber) {
		List<Student> students = new ArrayList<Student>();

		try {
			String selectAll = "SELECT * FROM Student LIMIT ?,?";
			pSet = con.prepareStatement(selectAll);
			pSet.setInt(1, rowNumber);
			pSet.setInt(2, totalNumber);

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

	public static int getRowCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pStatement;
		ResultSet rSet;
		try {
			con = DBConnection.createConnection();
			String countStudent = "SELECT COUNT(*) FROM Student";
			pStatement = con.prepareStatement(countStudent);
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

	public List<ArrayList<String>> readExcelData(String path,int index) throws IOException {

		List<ArrayList<String>> lists = new ArrayList<ArrayList<String>>();

		InputStream excelFileToRead = new FileInputStream(path);

		XSSFWorkbook wb = new XSSFWorkbook(excelFileToRead);

		XSSFSheet sheet = wb.getSheetAt(index);

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

}
