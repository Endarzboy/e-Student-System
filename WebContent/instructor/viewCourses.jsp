<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.clientSide.NoticeDao"%>
<%@page import="com.instructorDao.CourseDetail"%>
<%@page import="com.model.*,com.deptHeadDao.*"%>
<%@page import="com.instructorDao.ManagePostAssignDao"%>
<%@page import="com.adminDao.AccountDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!-- This is the right panel -->
<div class="col-md-10">


	<%
		AccountDao acDao = new AccountDao();
		String courseCode = acDao.selectCourse((String) session.getAttribute("instID"));

		CourseDetail cd = new CourseDetail();
		NoticeDao ndao = new NoticeDao();

		if (courseCode != null && courseCode != "") {
			Course c = cd.getCourseByCode(courseCode);
	%>
	<br>
	<h4 style="color: blue;">Details of My Course</h4>
	<hr>
	<table style="color: black; border-radius: 5px; border-style: solid;">

		<tbody style="padding: 5px;">
			<tr>
				<td><strong>College: </strong></td>
				<td><%=acDao.getCollegeTitle(c.getCollegeID())%></td>
			</tr>
			<tr>
				<td><strong>Department: </strong></td>
				<td><%=ndao.getDeptTitle(c.getDeptID())%></td>
			</tr>
			<tr>
				<td><strong>Course Title: </strong></td>
				<td><%=c.getTitle()%></td>
			</tr>
			<tr>
				<td><strong>Course Code: </strong></td>
				<td><%=c.getCourseCode()%></td>
			</tr>
			
			<tr>
				<td><strong>Credit</strong></td>
				<td><%=c.getCreditHour()%></td>
			</tr>
			<tr>
				<td><strong>PreRequisit: </strong></td>
				<td><%=c.getPreRequisit()%></td>
			</tr>
			<tr>
				<td><strong>Stream: </strong></td>
				<td><%=c.getStreamID()%></td>
			</tr>
		</tbody>
	</table>
	<%
		} else {
	%>
	<h4>Course Details are hidden, session has hidden them. Re-Login</h4>
	<%
		}
	%>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>