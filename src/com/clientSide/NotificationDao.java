package com.clientSide;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Notification;

public class NotificationDao {

	public Connection con = null;
	public PreparedStatement pSet;
	public ResultSet rSet;

	public NotificationDao() {
		con = DBConnection.createConnection();

	}

	public boolean insertNotification(Notification not) {

		boolean status = false;
		try {
			String insertNotice = "INSERT INTO Notifications(NotifID,InstructorID,CourseID,AssignID,Notification,dateOfNotify) VALUES(?,?,?,?,?,?)";
			pSet = con.prepareStatement(insertNotice);
			pSet.setString(1, not.getNotifyID());
			pSet.setString(2, not.getInstructorID());
			pSet.setString(3, not.getCourseID());
			pSet.setString(4, not.getAssignID());
			pSet.setString(5, not.getNotification());
			pSet.setString(6, not.getDate());

			pSet.executeUpdate();

			status = true;

			con.close();
		} catch (Exception e) {
			System.out.println("\nUnable to insert Notice: " + e.getMessage());
		}

		return status;
	}

	public boolean deleteNotification(String noticeID) {

		boolean status = false;
		try {
			String deleteNotice = "DELETE FROM Notifications WHERE NotifID=?";
			pSet = con.prepareStatement(deleteNotice);
			pSet.setString(1, noticeID);

			pSet.executeUpdate();

			status = true;

			con.close();
		} catch (Exception e) {
			System.out.println("\nUnable to Delete Notice: " + e.getMessage());
		}

		return status;
	}

	public List<Notification> getNotification(String courseID) {
		List<Notification> notices = new ArrayList<Notification>();

		try {
			String selectNotification = "SELECT * FROM Notifications WHERE CourseID=?";
			pSet = con.prepareStatement(selectNotification);
			pSet.setString(1, courseID);

			rSet = pSet.executeQuery();
			while (rSet.next()) {
				Notification notice = new Notification();

				notice.setNotifyID(rSet.getString("NotifID"));
				notice.setInstructorID(rSet.getString("InstructorID"));
				notice.setCourseID(rSet.getString("CourseID"));
				notice.setAssignID(rSet.getString("AssignID"));
				notice.setNotification(rSet.getString("Notification"));
				notice.setDate(rSet.getString("dateOfNotify"));

				notices.add(notice);
			}

		} catch (Exception e) {
			System.out.println("\nUnable to get Notice: " + e.getMessage());
		}

		return notices;
	}

	public int countNotifications(String courseID) {

		int count = 0;
		try {
			String selectNotification = "SELECT COUNT(*) FROM Notifications WHERE CourseID=?";
			pSet = con.prepareStatement(selectNotification);
			pSet.setString(1, courseID);

			rSet = pSet.executeQuery();
			while (rSet.next()) {

				count = rSet.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("\nUnable to count Notices: " + e.getMessage());
		}

		return count;
	}

	public static void main(String[] args) {
		System.out.println(new NotificationDao().deleteNotification("AsID3fdbe7ad00216336"));
	}

}
