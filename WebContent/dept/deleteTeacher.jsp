<%@page import="com.deptHeadDao.*"%>

<%
	String instCode = request.getParameter("idNo");

	ManageTeacherDao mtDao = new ManageTeacherDao();

	boolean deleted = mtDao.DeleteInstructor(instCode);
	if (deleted)
		response.sendRedirect("viewTeachers.jsp?msg=Instructor has been deleted Successfully");
%>