<%@page import="com.deptHeadDao.*"%>

<%
	String ccode = request.getParameter("courseToStudeIDNo");

	ManageCourseToStudentDao moDao = new ManageCourseToStudentDao();

	boolean deleted = moDao.DeleteCourseToStudent(ccode);
	if (deleted)
		response.sendRedirect("viewStudCourse.jsp?msg=Assigned Course has been deleted Successfully");
%>