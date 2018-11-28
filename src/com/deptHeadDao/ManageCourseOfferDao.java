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
import com.model.CourseOffer;

public class ManageCourseOfferDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageCourseOfferDao() {
		con = DBConnection.createConnection();
	}

	// 1. import course offers list function
	// 2. batch insertion function
	// 3. get all courses offer function
	// 4. get courses offer by instructor id and course id
	// 5. Delete course
	// 6. get number of rows

	public List<ArrayList<String>> importCourseOffer(String path,int index) throws IOException {

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

	public boolean BatchInsertion(CourseOffer courseOffer) {
		boolean status = false;

		try {
			String batchInsertion = "INSERT INTO CourseOffer(CourseID,DeptID,CollegeID,InstructorID,AcademicYear,Semester) VALUES(?,?,?,?,?,?)";
			pSt = con.prepareStatement(batchInsertion);

			pSt.setString(1, courseOffer.getCourseID());
			pSt.setString(2, courseOffer.getDeptID());
			pSt.setString(3, courseOffer.getCollegeID());
			pSt.setString(4, courseOffer.getInstructorID());
			pSt.setString(5, courseOffer.getAcademicYear());
			pSt.setString(6, courseOffer.getSemester());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to insert block of courses offers: " + e.getMessage());
		}

		return status;
	}

	public List<CourseOffer> getAllCourseOffers(String dept, int rowNum, int totalRow) {

		List<CourseOffer> courseOffers = new ArrayList<CourseOffer>();
		try {
			String getAllcourseOffers = "SELECT * FROM CourseOffer WHERE DeptID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllcourseOffers);
			pSt.setString(1, dept);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				CourseOffer co = new CourseOffer();

				co.setCourseID(rSet.getString(1));
				co.setDeptID(rSet.getString(2));
				co.setCollegeID(rSet.getString(3));
				co.setInstructorID(rSet.getString(4));
				co.setAcademicYear(rSet.getString(5));
				co.setSemester(rSet.getString(6));

				courseOffers.add(co);

			}

		} catch (Exception e) {
			System.out.println("\nUnable to List all courses offers: " + e.getMessage());
		}

		return courseOffers;
	}

	public CourseOffer getCourseOfferByCourseID(String id) {

		CourseOffer co = null;
		try {
			String getCourseOfferByCourseID = "SELECT * FROM CourseOffer WHERE CourseID=?";
			pSt = con.prepareStatement(getCourseOfferByCourseID);
			pSt.setString(1, id);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				co = new CourseOffer();

				co.setCourseID(rSet.getString(1));
				co.setDeptID(rSet.getString(2));
				co.setCollegeID(rSet.getString(3));
				co.setInstructorID(rSet.getString(4));
				co.setAcademicYear(rSet.getString(5));
				co.setSemester(rSet.getString(6));

			}

		} catch (Exception e) {
			System.out.println("\nUnable to get course offers: " + e.getMessage());
		}

		return co;
	}

	public CourseOffer getCourseOfferByTeacherID(String id) {

		CourseOffer co = null;
		try {
			String getCourseOfferByTeacherID = "SELECT * FROM CourseOffer WHERE InstructorID=?";
			pSt = con.prepareStatement(getCourseOfferByTeacherID);
			pSt.setString(1, id);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				co = new CourseOffer();

				co.setCourseID(rSet.getString(1));
				co.setDeptID(rSet.getString(2));
				co.setCollegeID(rSet.getString(3));
				co.setInstructorID(rSet.getString(4));
				co.setAcademicYear(rSet.getString(5));
				co.setSemester(rSet.getString(6));

			}

		} catch (Exception e) {
			System.out.println("\nUnable to get course: " + e.getMessage());
		}

		return co;
	}

	public boolean DeleteCourseOffer(String courseID) {
		boolean status = false;

		try {
			String deleteCourseOffer = "DELETE FROM CourseOffer WHERE CourseID=?";
			pSt = con.prepareStatement(deleteCourseOffer);
			pSt.setString(1, courseID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete course Offer: " + e.getMessage());
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

			String getRows = "SELECT COUNT(*) FROM CourseOffer WHERE DeptID=?";
			ps = con.prepareStatement(getRows);
			ps.setString(1, deptID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of courses Offer: " + e.getMessage());
		}

		return count;
	}

	public static void main(String[] args) throws IOException {
		ManageCourseOfferDao mcDao = new ManageCourseOfferDao();

		List<ArrayList<String>> lists = mcDao.importCourseOffer("E:/toImport.xlsx",3);

		for (ArrayList<String> arrayList : lists) {
			System.out.println(arrayList.get(0) + "\t" + arrayList.get(1));
			System.out.println("Why dont you working");
		}
	}
}
