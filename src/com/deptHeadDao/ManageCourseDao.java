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
import com.model.Course;

public class ManageCourseDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageCourseDao() {
		con = DBConnection.createConnection();
	}

	// 1. import course list function
	// 2. batch insertion function
	// 3. get all courses function
	// 4. get courses by code and title
	// 5. Delete course
	// 6. get number of rows

	public List<ArrayList<String>> importCourse(String path,int index) throws IOException {

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

	public boolean BatchInsertion(Course course) {
		boolean status = false;

		try {
			String batchInsertion = "INSERT INTO Course(CourseCode,Title,CreditHrs,PreReq,DeptID,CollegeID,StreamID) VALUES(?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(batchInsertion);

			pSt.setString(1, course.getCourseCode());
			pSt.setString(2, course.getTitle());
			pSt.setString(3, course.getCreditHour());
			pSt.setString(4, course.getPreRequisit());
			pSt.setString(5, course.getDeptID());
			pSt.setString(6, course.getCollegeID());
			pSt.setString(7, course.getStreamID());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to insert block of courses: " + e.getMessage());
		}

		return status;
	}

	public List<Course> getAllCourses(String dept, int rowNum, int lastRow) {

		List<Course> courses = new ArrayList<Course>();
		try {
			String getAllcourses = "SELECT * FROM Course WHERE DeptID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllcourses);
			pSt.setString(1, dept);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, lastRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Course c = new Course();
				c.setCourseCode(rSet.getString(1));
				c.setTitle(rSet.getString(2));
				c.setCreditHour(rSet.getString(3));
				c.setPreRequisit(rSet.getString(4));
				c.setDeptID(rSet.getString(5));
				c.setCollegeID(rSet.getString(6));
				c.setStreamID(rSet.getString(7));

				courses.add(c);

			}

		} catch (Exception e) {
			System.out.println("\nUnable to List all courses: " + e.getMessage());
		}

		return courses;
	}

	public Course getCourseByCode(String code) {

		Course c = null;
		try {
			String getCourseByCode = "SELECT * FROM Course WHERE CourseCode=?";
			pSt = con.prepareStatement(getCourseByCode);
			pSt.setString(1, code);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				c = new Course();
				c.setCourseCode(rSet.getString(1));
				c.setTitle(rSet.getString(2));
				c.setCreditHour(rSet.getString(3));
				c.setPreRequisit(rSet.getString(4));
				c.setDeptID(rSet.getString(5));
				c.setCollegeID(rSet.getString(6));
				c.setStreamID(rSet.getString(7));
			}

		} catch (Exception e) {
			System.out.println("\nUnable to get course: " + e.getMessage());
		}

		return c;
	}

	public Course getCourseByTitle(String title) {

		Course c = null;
		try {
			String getCourseByTitle = "SELECT * FROM Course WHERE Title=?";
			pSt = con.prepareStatement(getCourseByTitle);
			pSt.setString(1, title);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				c = new Course();
				c.setCourseCode(rSet.getString(1));
				c.setTitle(rSet.getString(2));
				c.setCreditHour(rSet.getString(3));
				c.setPreRequisit(rSet.getString(4));
				c.setDeptID(rSet.getString(5));
				c.setCollegeID(rSet.getString(6));
				c.setStreamID(rSet.getString(7));

			}

		} catch (Exception e) {
			System.out.println("\nUnable to get course: " + e.getMessage());
		}

		return c;
	}

	public boolean DeleteCourse(String code) {
		boolean status = false;

		try {
			String deleteCourse = "DELETE FROM Course WHERE CourseCode=?";
			pSt = con.prepareStatement(deleteCourse);
			pSt.setString(1, code);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete course: " + e.getMessage());
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

			String getRows = "SELECT COUNT(*) FROM Course WHERE DeptID=?";
			ps = con.prepareStatement(getRows);
			ps.setString(1, deptID);
			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of courses: " + e.getMessage());
		}

		return count;
	}

	public static void main(String[] args) throws IOException {
		ManageCourseDao mcDao = new ManageCourseDao();
		List<ArrayList<String>> lists = mcDao.importCourse("E:/toImport.xlsx",2);
		for (ArrayList<String> arrayList : lists) {
			System.out.println(arrayList.get(0) + "\t" + arrayList.get(1) + "\t" + arrayList.get(2) + "\t"
					+ arrayList.get(3) + "\t" + arrayList.get(4) + "\t" + arrayList.get(5));
		}
	}
}
