<%@page import="com.instructorDao.*"%>
<%
	String examID=request.getParameter("examIDNo");

	ManageExamDao meDao = new ManageExamDao();

	boolean deleted = meDao.DeleteExam(examID);

	if (deleted)
		response.sendRedirect("publishExam.jsp");
%>