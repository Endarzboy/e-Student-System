<%@page import="com.deptHeadDao.*"%>

<%
	String ccode = request.getParameter("ccode");

	ManageCourseDao mcDao = new ManageCourseDao();

	boolean deleted = mcDao.DeleteCourse(ccode);
	if (deleted)
		response.sendRedirect("viewCourses.jsp?msg=Course has been deleted Successfully");
%>