package com.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.Answer;

public class AnswerDao {

	public Connection con = null;
	public PreparedStatement pSt;
	public ResultSet rSet;

	public AnswerDao() {
		con = DBConnection.createConnection();
	}
	
	public boolean InsertAnswer(Answer answer) {

		boolean status = false;

		try {
			String insertAnswer = "INSERT INTO Answertbl(QuestionID,ExamID,StudentID,CourseID,DeptID,AnswerSelected,ExamDate) VALUES(?,?,?,?,?,?,?)";
			pSt = con.prepareStatement(insertAnswer);

			pSt.setString(1, answer.getQuestionID());
			pSt.setString(2, answer.getExamID());
			pSt.setString(3, answer.getStudentID());
			pSt.setString(4, answer.getCourseID());
			pSt.setString(5, answer.getDeptID());
			pSt.setString(6, answer.getAnswerSelected());
			pSt.setString(7, answer.getExamDate());

			pSt.executeUpdate();

			status = true;

		} catch (Exception e) {
			System.out.println("\nUnable to Insert Question: " + e.getMessage());
		}
		return status;
	}
}
