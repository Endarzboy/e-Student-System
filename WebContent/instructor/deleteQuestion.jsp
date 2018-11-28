<%@page import="com.instructorDao.*"%>
<%
	String examID = request.getParameter("deleteQnID");

	ManageQuestionDao mqDao = new ManageQuestionDao();

	boolean deleted = mqDao.DeleteQsn(examID);

	if (deleted)
		response.sendRedirect("viewQuestions.jsp");
%>