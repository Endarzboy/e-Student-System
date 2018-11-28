package com.instructorDao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Handout;

public class ManageHandoutDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageHandoutDao() {
		con = DBConnection.createConnection();
	}

	// 1. insert question function
	// 2. get all question function
	// 3. get question by id
	// 4. Delete question
	// 5. get number of rows of question
	// 6. Update question function

	public boolean InsertHandout(Handout ho, String filePath) {

		boolean status = false;
		FileInputStream fis = null;

		try {
			String insertHO = "INSERT INTO Handout(HandoutID,CourseID,HandoutFile,FileName,FileSize,StreamID,DeptID,InstructorID,Batch,Semester) VALUES('"
					+ ho.getHandoutID() + "',?,?,?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertHO);

			pSt.setString(1, ho.getCourseID());

			File f = new File(filePath);// E:\Selams_Project\JSP_Basic_Tutorials\Final.Documentation\Sent.Documents\Chapter.2-3.docx
			int fileSize = (int) f.length();

			byte byteFile[] = new byte[fileSize];
			fis = new FileInputStream(f);

			fis.read(byteFile);

			pSt.setBytes(2, byteFile);
			pSt.setString(3, f.getName());
			pSt.setLong(4, fileSize);
			pSt.setString(5, ho.getStreamID());
			pSt.setString(6, ho.getDeptID());
			pSt.setString(7, ho.getPreparedBy());
			pSt.setInt(8, ho.getBatch());
			pSt.setInt(9, ho.getSemester());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Handout: " + e.getMessage());
		}
		return status;
	}

	public boolean UpdateHandout(Handout ho, String filePath, String houtID) {

		boolean status = false;
		FileInputStream fis = null;

		try {
			String insertHO = "UPDATE Handout SET CourseID='" + ho.getCourseID()
					+ "',HandoutFile=?,FileName=?,FileSize=?,StreamID=?,DeptID=?,InstructorID=?,Batch=?,Semester=? WHERE HandoutID=?";
			pSt = con.prepareStatement(insertHO);

			File f = new File(filePath);
			int fileSize = (int) f.length();

			byte byteFile[] = new byte[fileSize];
			fis = new FileInputStream(f);

			fis.read(byteFile);

			pSt.setBytes(1, byteFile);
			pSt.setString(2, f.getName());
			pSt.setLong(3, fileSize);
			pSt.setString(4, ho.getStreamID());
			pSt.setString(5, ho.getDeptID());
			pSt.setString(6, ho.getPreparedBy());
			pSt.setInt(7, ho.getBatch());
			pSt.setInt(8, ho.getSemester());

			pSt.setString(9, houtID);

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Update Handout: " + e.getMessage());
		}
		return status;
	}

	public List<Handout> getAllHandouts(String instructorID, int rowNum, int totalRow) {

		List<Handout> handouts = new ArrayList<Handout>();

		try {
			String getAllHos = "SELECT * FROM Handout WHERE InstructorID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllHos);

			pSt.setString(1, instructorID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Handout ho = new Handout();

				ho.setHandoutID(rSet.getString("HandoutID"));
				ho.setCourseID(rSet.getString("CourseID"));
				ho.setFileName(rSet.getString("FileName"));
				ho.setFileSize(rSet.getInt("FileSize"));
				ho.setStreamID(rSet.getString("StreamID"));
				ho.setDeptID(rSet.getString("DeptID"));
				ho.setPreparedBy(rSet.getString("InstructorID"));
				ho.setBatch(rSet.getInt("Batch"));
				ho.setSemester(rSet.getInt("Semester"));

				handouts.add(ho);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Handouts: " + e.getMessage());
		}

		return handouts;
	}

	public Handout getHandoutByCourseID(String hID) {

		Handout ho = null;

		if (!hID.equals("") && hID != "" && hID != null) {
			try {
				String getHosbyCourseID = "SELECT * FROM Handout WHERE HandoutID=?";
				pSt = con.prepareStatement(getHosbyCourseID);

				pSt.setString(1, hID);

				rSet = pSt.executeQuery();

				while (rSet.next()) {
					ho = new Handout();

					ho.setHandoutID(rSet.getString("HandoutID"));
					ho.setCourseID(rSet.getString("CourseID"));
					ho.setFileName(rSet.getString("FileName"));
					ho.setFileSize(rSet.getInt("FileSize"));
					ho.setStreamID(rSet.getString("StreamID"));
					ho.setDeptID(rSet.getString("DeptID"));
					ho.setPreparedBy(rSet.getString("InstructorID"));
					ho.setBatch(rSet.getInt("Batch"));
					ho.setSemester(rSet.getInt("Semester"));

				}
			} catch (Exception e) {
				System.out.println("\nUnable to get Handouts: " + e.getMessage());
			}
		} else {
			System.out.println("Input Error");
		}

		return ho;

	}

	public boolean DeleteHandout(String hoID) {
		boolean status = false;

		try {
			String deleteHandout = "DELETE FROM Handout WHERE HandoutID=?";
			pSt = con.prepareStatement(deleteHandout);
			pSt.setString(1, hoID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Handout: " + e.getMessage());
		}

		return status;
	}

	public static int getRowCount(String instructorID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Handout WHERE InstructorID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, instructorID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Handout: " + e.getMessage());
		}

		return count;
	}

	public static void main(String[] args) {
		String val = Long.toHexString(Double.doubleToLongBits(Math.random()));
		System.out.println(val);
	}
}
