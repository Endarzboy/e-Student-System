<%@page import="com.model.AssignmentToPost"%>
<%@page import="java.util.List"%>
<%@page import="com.clientSide.NoticeDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>


<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<%
	int pageSize, noOfPages, onPage;

	pageSize = 5;
	noOfPages = (int) (Math.ceil((double) NoticeDao.getRowCount() / pageSize));
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Assignments and Projects</h4>

	<br>
	<hr>

	<%
		String pageNumber = request.getParameter("page");
		if (pageNumber == null) {
			onPage = 1;
		} else {
			try {
				onPage = Integer.parseInt(pageNumber);
			} catch (NumberFormatException e) {
				onPage = 1;
			}
		}
		NoticeDao ndao = new NoticeDao();
		List<AssignmentToPost> atps = ndao.getAllAssignmentToPosts((onPage - 1) * pageSize, pageSize);

		for (AssignmentToPost atp : atps) {
	%>
	<table class="jumbotron" style="border-style: hidden;">
		<tr>
			<!--  border-right-style: outset; removed -->
			<td
				style="color: blue; font-family: serif; font-size: 13px; width: 200px; margin-left: 10px;"><strong
				style="color: black;">&nbsp;&nbsp;&nbsp;Department:</strong><strong><br>&nbsp;&nbsp;&nbsp;<%=ndao.getDeptTitle(atp.getDeptID())%></strong></td>

			<td style=""><strong style="color: black; font-family: serif;">&nbsp;&nbsp;Course:</strong>
				<strong style="color: red; font-size: 13px; font-family: serif;"><%=ndao.getCourseTitle(atp.getCourseID())%></strong></td>
			<td
				style="width: 140px; font-size: 12px; color: black; font-family: serif; margin-left: 5px;">
				<strong>Posted on: <%=atp.getDateToPost()%></strong>
			</td>

		</tr>
		<tr>
			<td
				style="color: black; font-size: 13px; margin-left: 10px; font-family: serif;"><strong>&nbsp;&nbsp;&nbsp;<%=atp.getTitle()%></strong></td>
			<td style="color: black; font-family: serif;"><%=atp.getDescription()%></td>

			<td style="color: black; font-family: serif; font-size: 12px;"><strong
				style="color: black;">Batch:</strong> <strong style="color: red;"><%=atp.getBatch()%></strong>&nbsp;<strong
				style="color: black;">Semester:</strong> <strong style="color: red;"><%=atp.getSemester()%></strong>
		</tr>
		<tr>
			<td
				style="color: black; font-family: serif; font-size: 12px; margin-left: 10px;">&nbsp;&nbsp;&nbsp;By:
				<span class="glyphicon glyphicon-user"><strong
					style="font-size: 12px; font-family: serif;"><%=ndao.getInstructorName(atp.getInstructorID())%></strong></span>
			</td>
			<td style="color: black; font-family: serif; font-size: 12px;"><a
				href="downloadAssign.jsp?downloadAssignID=<%=atp.getAssignID()%>"><strong
					style="font-size: 10px;">Download : <%=atp.getFileName()%></strong></a></td>
			<td style="color: black; font-family: serif; font-size: 12px;">Dead
				Line: <strong><%=atp.getDeadLine()%></strong>
			</td>
		</tr>
	</table>
	<%
		}
	%>
	<a style="font-family: serif;" href="notice.jsp?page=1"
		class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a style="font-family: serif;" href="notice.jsp?page=<%=i%>"
		class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a style="font-family: serif;" href="notice.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>