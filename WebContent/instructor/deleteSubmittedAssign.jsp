<%@page import="com.instructorDao.*"%>
<%
	String subAssignID = request.getParameter("deleteSubAssignID");

	ManageSubmittedAssignDao msaDao = new ManageSubmittedAssignDao();

	
	boolean deleted = msaDao.DeleteSubmittedAssign(subAssignID);

	if (deleted)
		response.sendRedirect("viewAssignProject.jsp");
%>