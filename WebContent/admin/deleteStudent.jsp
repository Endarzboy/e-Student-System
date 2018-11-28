<%@page import="com.adminDao.*"%>
<%
	String idNo = request.getParameter("idNo");
	ManageStudentDao msDao = new ManageStudentDao();

	boolean deleted = msDao.DeleteStudent(idNo);
	if (deleted) {
		response.sendRedirect("viewStudent.jsp?msg=Student has been deleted");
	}
%>