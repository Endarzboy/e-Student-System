<%@page import="com.deptHeadDao.*"%>

<%
	String scheduleID = request.getParameter("scheduleID");

	ManageExamScheduleDao mesDao = new ManageExamScheduleDao();

	boolean deleted = mesDao.DeleteSchedule(scheduleID);
	if (deleted)
		response.sendRedirect("viewSchedule.jsp?msg=Schedule has been deleted Successfully");
%>