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
import com.model.CourseToStudent;

public class ManageCourseToStudentDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageCourseToStudentDao() {
		con = DBConnection.createConnection();
	}

	// 1. import course-student assignment function
	// 2. batch insertion function
	// 3. get all courses-student function
	// 4. Delete course
	// 5. get number of rows

	public List<ArrayList<String>> importCourseToStudent(String path,int index) throws IOException {

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

	public boolean BatchInsertion(CourseToStudent courseToStudent) {
		boolean status = false;

		try {
			String batchInsertion = "INSERT INTO CourseToStudent(CourseID,DeptID,CollegeID,StudentID,AcademicYear,Semester) VALUES(?,?,?,?,?,?)";
			pSt = con.prepareStatement(batchInsertion);

			pSt.setString(1, courseToStudent.getCourseID());
			pSt.setString(2, courseToStudent.getDeptID());
			pSt.setString(3, courseToStudent.getCollegeID());
			pSt.setString(4, courseToStudent.getStudentID());
			pSt.setString(5, courseToStudent.getAcademicYear());
			pSt.setString(6, courseToStudent.getSemester());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to insert block of courses to student: " + e.getMessage());
		}

		return status;
	}

	public List<CourseToStudent> getAllCourseToStudent(String dept, int rowNum, int totalRow) {

		List<CourseToStudent> courseToStudents = new ArrayList<CourseToStudent>();
		try {
			String getAllcourseToStudent = "SELECT * FROM CourseToStudent WHERE DeptID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllcourseToStudent);
			pSt.setString(1, dept);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				CourseToStudent ctoStudent = new CourseToStudent();
				ctoStudent.setCourseID(rSet.getString(1));
				ctoStudent.setDeptID(rSet.getString(2));
				ctoStudent.setCollegeID(rSet.getString(3));
				ctoStudent.setStudentID(rSet.getString(4));
				ctoStudent.setAcademicYear(rSet.getString(5));
				ctoStudent.setSemester(rSet.getString(6));

				courseToStudents.add(ctoStudent);

			}

		} catch (Exception e) {
			System.out.println("\nUnable to List all courses to student: " + e.getMessage());
		}

		return courseToStudents;
	}

	public boolean DeleteCourseToStudent(String courseID) {
		boolean status = false;

		try {
			String deleteCourseToStudent = "DELETE FROM coursetostudent WHERE StudentID=?";
			pSt = con.prepareStatement(deleteCourseToStudent);
			pSt.setString(1, courseID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete course to Student: " + e.getMessage());
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

	public static int getRowCount(String deptID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM CourseToStudent WHERE DeptID=?";
			ps = con.prepareStatement(getRows);
			ps.setString(1, deptID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of courses to Student: " + e.getMessage());
		}

		return count;
	}

	public static void main(String[] args) throws IOException {
		ManageCourseToStudentDao mcDao = new ManageCourseToStudentDao();

		List<ArrayList<String>> lists = mcDao.importCourseToStudent("E:/toImport.xlsx",4);

		for (ArrayList<String> arrayList : lists) {
			System.out.println(arrayList.get(0) + "\t" + arrayList.get(1) + "\t" + arrayList.get(2));
		}
	}
}
