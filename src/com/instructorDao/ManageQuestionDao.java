package com.instructorDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Questions;

public class ManageQuestionDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public ManageQuestionDao() {
		con = DBConnection.createConnection();
	}

	// 1. insert question function
	// 2. get all question function
	// 3. get question by id
	// 4. Delete question
	// 5. get number of rows of question
	// 6. Update question function

	public boolean InsertQuestion(Questions question) {

		boolean status = false;

		try {
			String insertQuestion = "INSERT INTO Questiontble(QuestionID,ExamID,CourseID,ExamNumber,Questions,Option1,Option2,Option3,Option4,Answer,Weight,InstructorID) VALUES('"
					+ question.getQuestionID() + "','" + question.getExamID() + "','"+question.getCourseID()+"',?,?,?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertQuestion);

			pSt.setInt(1, question.getQuestionNo());
			pSt.setString(2, question.getQuestion());
			pSt.setString(3, question.getOption1());
			pSt.setString(4, question.getOption2());
			pSt.setString(5, question.getOption3());
			pSt.setString(6, question.getOption4());
			pSt.setString(7, question.getAnswer());
			pSt.setDouble(8, question.getWeight());
			pSt.setString(9, question.getInstructorID());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Question: " + e.getMessage());
		}
		return status;
	}

	public boolean UpdateQuestion(Questions q, String questionID) {

		boolean status = false;

		try {
			String updateQstn = "UPDATE Questiontble SET ExamID='" + q.getExamID() + "',CourseID='"+q.getCourseID()+"',ExamNumber='"
					+ q.getQuestionNo()
					+ "',Questions=?,Option1=?,Option2=?,Option3=?,Option4=?,Answer=?,Weight=?,InstructorID=? WHERE QuestionID=?";
			pSt = con.prepareStatement(updateQstn);

			pSt.setString(1, q.getQuestion());
			pSt.setString(2, q.getOption1());
			pSt.setString(3, q.getOption2());
			pSt.setString(4, q.getOption3());
			pSt.setString(5, q.getOption4());
			pSt.setString(6, q.getAnswer());
			pSt.setDouble(7, q.getWeight());
			pSt.setString(8, q.getInstructorID());
			pSt.setString(9, questionID);

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Update Question: " + e.getMessage());
		}
		return status;
	}

	public String selectExamID(String instID) {

		String examID = "";
		try {
			String getExamID = "SELECT * FROM Exam WHERE InstructorID=?";
			pSt = con.prepareStatement(getExamID);

			pSt.setString(1, instID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				examID = rSet.getString("ExamID");

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Instructor: " + e.getMessage());
		}

		return examID;
	}

	public List<Questions> getAllQuestion(String instID, int rowNum, int totalRow) {

		List<Questions> questions = new ArrayList<Questions>();

		try {
			String getAllQstns = "SELECT * FROM Questiontble WHERE InstructorID=? LIMIT ?,?";
			pSt = con.prepareStatement(getAllQstns);

			pSt.setString(1, instID);
			pSt.setInt(2, rowNum);
			pSt.setInt(3, totalRow);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Questions qsn = new Questions();

				qsn.setQuestionID(rSet.getString("QuestionID"));
				qsn.setExamID(rSet.getString("ExamID"));
				qsn.setCourseID(rSet.getString("CourseID"));
				qsn.setQuestionNo(rSet.getInt("ExamNumber"));
				qsn.setQuestion(rSet.getString("Questions"));
				qsn.setOption1(rSet.getString("Option1"));
				qsn.setOption2(rSet.getString("Option2"));
				qsn.setOption3(rSet.getString("Option3"));
				qsn.setOption4(rSet.getString("Option4"));
				qsn.setAnswer(rSet.getString("Answer"));
				qsn.setWeight(rSet.getDouble("Weight"));
				qsn.setInstructorID(rSet.getString("InstructorID"));

				questions.add(qsn);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get All Questions: " + e.getMessage());
		}

		return questions;
	}

	public List<Questions> getQuestionByExamID(String examID) {

		List<Questions> qs = new ArrayList<Questions>();

		try {
			String getQsns = "SELECT * FROM Questiontble WHERE ExamID=?";
			pSt = con.prepareStatement(getQsns);

			pSt.setString(1, examID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				Questions qsn = new Questions();

				qsn.setQuestionID(rSet.getString("QuestionID"));
				qsn.setExamID(rSet.getString("ExamID"));
				qsn.setCourseID(rSet.getString("CourseID"));
				qsn.setQuestionNo(rSet.getInt("ExamNumber"));
				qsn.setQuestion(rSet.getString("Questions"));
				qsn.setOption1(rSet.getString("Option1"));
				qsn.setOption2(rSet.getString("Option2"));
				qsn.setOption3(rSet.getString("Option3"));
				qsn.setOption4(rSet.getString("Option4"));
				qsn.setAnswer(rSet.getString("Answer"));
				qsn.setWeight(rSet.getDouble("Weight"));
				qsn.setInstructorID(rSet.getString("InstructorID"));

				qs.add(qsn);
			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Question: " + e.getMessage());
		}

		return qs;
	}

	public Questions getQuestionByQsnID(String qsnID) {

		Questions qsn = null;

		try {
			String getQsns = "SELECT * FROM Questiontble WHERE QuestionID=?";
			pSt = con.prepareStatement(getQsns);

			pSt.setString(1, qsnID);

			rSet = pSt.executeQuery();

			while (rSet.next()) {
				qsn = new Questions();

				qsn.setQuestionID(rSet.getString("QuestionID"));
				qsn.setExamID(rSet.getString("ExamID"));
				qsn.setCourseID(rSet.getString("CourseID"));
				qsn.setQuestionNo(rSet.getInt("ExamNumber"));
				qsn.setQuestion(rSet.getString("Questions"));
				qsn.setOption1(rSet.getString("Option1"));
				qsn.setOption2(rSet.getString("Option2"));
				qsn.setOption3(rSet.getString("Option3"));
				qsn.setOption4(rSet.getString("Option4"));
				qsn.setAnswer(rSet.getString("Answer"));
				qsn.setWeight(rSet.getDouble("Weight"));
				qsn.setInstructorID(rSet.getString("InstructorID"));

			}
		} catch (Exception e) {
			System.out.println("\nUnable to get Question: " + e.getMessage());
		}

		return qsn;
	}

	public boolean DeleteQsn(String qsNID) {
		boolean status = false;

		try {
			String deleteQsn = "DELETE FROM Questiontble WHERE QuestionID=?";
			pSt = con.prepareStatement(deleteQsn);
			pSt.setString(1, qsNID);

			pSt.executeUpdate();
			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to delete Question: " + e.getMessage());
		}

		return status;
	}

	public static int getRowCout(String instID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Questiontble WHERE InstructorID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, instID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Question: " + e.getMessage());
		}

		return count;
	}

	public static int getRowCoutQn(String examID) {
		int count = 0;
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DBConnection.createConnection();

			String getRows = "SELECT COUNT(*) FROM Questiontble WHERE ExamID=?";
			ps = con.prepareStatement(getRows);

			ps.setString(1, examID);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("\nUnbale to count rows of Question: " + e.getMessage());
		}

		return count;
	}
}
