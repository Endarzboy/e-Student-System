<%@page import="com.instructorDao.*"%>
<%
	String deleteID = request.getParameter("deleteAssignResultID");

	ManageAssignmentResultDao meDao = new ManageAssignmentResultDao();

	boolean deleted = meDao.DeleteStudentResult(deleteID);

	if (deleted)
		response.sendRedirect("viewStudentResult.jsp");
%>