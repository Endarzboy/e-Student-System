package com.instructorDao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.db.DBConnection;
import com.model.AssignmentToPost;

public class ManagePostAssignDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManagePostAssignDao() {
		con = DBConnection.createConnection();
	}

	// 1. insert assignment
	// 2. get all assignment function
	// 3. get assignment by id
	// 4. Delete assignment
	// 5. get number of rows
	// 6. Update function

	public boolean InsertAssignment(AssignmentToPost atp, String filePath) {

		boolean status = false;
		FileInputStream fileToUpload = null;
		try {
			String insertAssignment = "INSERT INTO AssignmentToPost(AssignID,Title,Description,CourseID,DeptID,AssignmentFile,FileName,FileSize,PostedDate,DeadLine,InstructorID,Batch,Semester)"
					+ " VALUES('" + atp.getAssignID() + "','" + atp.getTitle() + "','" + atp.getDescription() + "','"
					+ atp.getCourseID() + "','" + atp.getDeptID() + "',?,?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertAssignment);

			File f = new File(filePath);// E:\Selams_Project\JSP_Basic_Tutorials\Final.Documentation\Sent.Documents\Chapter.2-3.docx
			int fileSize = (int) f.length();

			byte bytes[] = new byte[fileSize];

			fileToUpload = new FileInputStream(f);
			fileToUpload.read(bytes);

			pSt.setBytes(1, bytes);
			pSt.setString(2, f.getName());
			pSt.setLong(3, fileSize);
			pSt.setString(4, atp.getDateToPost());
			pSt.setString(5, atp.getDeadLine());
			pSt.setString(6, atp.getInstructorID());
			pSt.setInt(7, atp.getBatch());
			pSt.setInt(8, atp.getSemester());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Assignment: " + e.getMessage());
		}
		return status;
	}

	public boolean UpdateAssignment(AssignmentToPost atp, String filePath, String assID) throws SQLException {

		boolean status = false;
		FileInputStream fileToUpload = null;

		try {
			String updateAssignment = "UPDATE AssignmentToPost SET Title='" + atp.getTitle() + "',Description='"
					+ atp.getDescription() + "',CourseID='" + atp.getCourseID()
					+ "',AssignmentFile=?,FileName=?,FileSize=?,PostedDate=?,DeadLine=?,Batch=?,Semester=? WHERE AssignID=?";
			pSt = con.prepareStatement(updateAssignment);

			File f = new File(filePath);
			int fileSize = (int) f.length();

			byte bytes[] = new byte[fileSize];

			fileToUpload = new FileInputStream(f);
			fileToUpload.read(bytes);

			pSt.setBytes(1, bytes);
			pSt.setString(2, f.getName());
			pSt.setLong(3, fileSize);
			pSt.setString(4, atp.getDateToPost());
			pSt.setString(5, atp.getDeadLine());
			pSt.setInt(6, atp.getBatch());
			pSt.setInt(7, atp.getSemester());
			pSt.setString(8, assID);

			pSt.executeUpdate();

			status = true;
		} catch (Exception e) {
			System.out.println("\nUnable to Update Assignment: " + e.getMessage());
		}

		return status;
	}

	public boolean UpdateAssignmentWoFile(AssignmentToPost atp, String assID) {

		boolean status = false;

		try {
			String updateAssignWOFile = "UPDATE AssignmentToPost SET Title='" + atp.getTitle() + "',Description='"
					+ atp.getDescription() + "',CourseID='" + atp.getCourseID()
					+ "',PostedDate=?,DeadLine=?,Batch=?,Semester=? WHERE AssignID=?";
			pSt = con.prepareStatement(updateAssignWOFile);

			pSt.setString(1, atp.getDateToPost());
			pSt.setString(2, atp.getDeadLine());
			pSt.setInt(3, atp.getBatch());
			pSt.setInt(4, atp.getSemester());
			pSt.setString(5, assID);

			pSt.executeUpdate();

			status = true;
		} catch (Exception e) {
			System.out.println("\nUnable to Update Assignment: " + e.getMessage());
		}

		return status;
	}

	public List<AssignmentToPost> getAllAssignmentToPosts(String instructorID, int rowNum, int totalRow) {

		List<AssignmentToPost> assignments = new ArrayList<AssignmentToPost>();

		try {
			String getAllAssignments = "SELECT * FROM AssignmentToPost WHERE InstructorID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllAssignments);

			pSt.setString(1, instructorID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				AssignmentToPost at = new AssignmentToPost();

				at.setAssignID(rSet.getString("AssignID"));
				at.setTitle(rSet.getString("Title"));
				at.setDescription(rSet.getString("Description"));
				at.setCourseID(rSet.getString("CourseID"));
				at.setDeptID(rSet.getString("DeptID"));
				// at.setStreamID(rSet.getString("StreamID"));
				at.setFileName(rSet.getString("FileName"));
				at.setFileSize(rSet.getInt("FileSize"));
				at.setDateToPost(rSet.getString("PostedDate"));
				at.setDeadLine(rSet.getString("DeadLine"));
				at.setInstructorID(rSet.getString("InstructorID"));
				at.setBatch(rSet.getInt("Batch"));
				at.setSemester(rSet.getInt("Semester"));

				assignments.add(at);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Assignments: " + e.getMessage());
		}

		return assignments;
	}

	public AssignmentToPost getAssignmentToPostsByID(String assignID) {

		AssignmentToPost at = null;
		try {
			String getAssignments = "SELECT * FROM AssignmentToPost WHERE AssignID=?";
			pSt = con.prepareStatement(getAssignments);

			pSt.setString(1, assignID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				at = new AssignmentToPost();

				at.setAssignID(rSet.getString("AssignID"));
				at.setTitle(rSet.getString("Title"));
				at.setDescription(rSet.getString("Description"));
				at.setCourseID(rSet.getString("CourseID"));
				at.setDeptID(rSet.getString("DeptID"));
				// at.setStreamID(rSet.getString("StreamID"));
				at.setFileName(rSet.getString("FileName"));
				at.setFileSize(rSet.getInt("FileSize"));
				at.setDateToPost(rSet.getString("PostedDate"));
				at.setDeadLine(rSet.getString("DeadLine"));
				at.setInstructorID(rSet.getString("InstructorID"));
				at.setBatch(rSet.getInt("Batch"));
				at.setSemester(rSet.getInt("Semester"));

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Assignments: " + e.getMessage());
		}

		return at;
	}

	public AssignmentToPost getAssignmentToPostsByID(int assignID) {

		AssignmentToPost at = null;
		try {
			String getAssignments = "SELECT * FROM AssignmentToPost WHERE AssignID=?";
			pSt = con.prepareStatement(getAssignments);

			pSt.setInt(1, assignID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				at = new AssignmentToPost();

				at.setAssignID(rSet.getString("AssignID"));
				at.setTitle(rSet.getString("Title"));
				at.setDescription(rSet.getString("Description"));
				at.setCourseID(rSet.getString("CourseID"));
				at.setDeptID(rSet.getString("DeptID"));
				// at.setStreamID(rSet.getString("StreamID"));
				at.setFileName(rSet.getString("FileName"));
				at.setFileSize(rSet.getInt("FileSize"));
				at.setDateToPost(rSet.getString("PostedDate"));
				at.setDeadLine(rSet.getString("DeadLine"));
				at.setInstructorID(rSet.getString("InstructorID"));
				at.setBatch(rSet.getInt("Batch"));
				at.setSemester(rSet.getInt("Semester"));

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Assignments: " + e.getMessage());
		}

		return at;
	}

	public static int getRowCount(String instID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM AssignmentToPost WHERE InstructorID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, instID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Assignment: " + e.getMessage());
		}

		return count;
	}

	public boolean DeleteAssignment(String assignID) {
		boolean status = false;

		try {
			
			String deleteAssignment = "DELETE FROM AssignmentToPost WHERE AssignID=?";
			pSt = con.prepareStatement(deleteAssignment);
			pSt.setString(1, assignID);

			pSt.executeUpdate();
			
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Assignment: " + e.getMessage());
		}

		return status;
	}

	public static void main(String[] args) throws ParseException {

		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = dtf.parse("2018-02-17");
		Date deadLineDate = dtf.parse("2018-02-19");

		if (currentDate.compareTo(deadLineDate) > 0) {
			System.out.println("Dead Line is 2 days back");
		} else if (currentDate.compareTo(deadLineDate) < 0) {
			System.out.println("Dead line is possible ");
		} else {
			System.out.println("Both are equal");
		}

		String id = UUID.randomUUID().toString();
		System.out.println(id);
	}
}
