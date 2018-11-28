<%@page import="com.model.AssignmentToPost"%>
<%@page import="java.util.List"%>
<%@page import="com.clientSide.NoticeDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>


<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<%
	String courseIDNOs = request.getParameter("searchAssignByCourse");
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Assignments and Projects</h4>

	<br>
	<hr>

	<%
		NoticeDao ndao = new NoticeDao();
		AssignmentToPost atp = ndao.getAssignmentToPostsByID(courseIDNOs);
		if (courseIDNOs != null && courseIDNOs != "") {

			if (courseIDNOs.equals(atp.getCourseID())) {
	%>
	<table class="jumbotron"">
		<tr>
			<td
				style="color: blue; font-family: serif; font-size: 13px; width: 200px; margin-left: 10px;"><strong
				style="color: black;">&nbsp;&nbsp;&nbsp;Department:</strong><strong><br>&nbsp;&nbsp;&nbsp;<%=ndao.getDeptTitle(atp.getDeptID())%></strong></td>

			<td style="border-right-style: outset;"><strong
				style="color: black; font-family: serif;">&nbsp;&nbsp;Course:</strong>
				<strong style="color: red; font-size: 13px; font-family: serif;"><%=ndao.getCourseTitle(atp.getCourseID())%></strong></td>
			<td
				style="width: 140px; font-size: 12px; color: black; font-family: serif; margin-left: 5px;">
				<strong>Posted on: <%=atp.getDateToPost()%></strong>
			</td>

		</tr>
		<tr>
			<td
				style="color: black; font-size: 13px; margin-left: 10px; font-family: serif;"><strong>&nbsp;&nbsp;&nbsp;<%=atp.getTitle()%></strong></td>
			<td
				style="color: black; font-family: serif; border-right-style: outset;"><%=atp.getDescription()%></td>

			<td style="color: black; font-family: serif; font-size: 12px;">Batch:
				<strong style="color: red;"><%=atp.getBatch()%></strong>&nbsp;Semester:
				<strong style="color: red;"><%=atp.getSemester()%></strong>
		</tr>
		<tr>
			<td
				style="color: black; font-family: serif; font-size: 12px; margin-left: 10px;">&nbsp;&nbsp;&nbsp;By:
				<span class="glyphicon glyphicon-user"><strong
					style="font-size: 12px; font-family: serif;"><%=ndao.getInstructorName(atp.getInstructorID())%></strong></span>
			</td>
			<td
				style="color: black; font-family: serif; font-size: 12px; border-right-style: outset;"><a
				href="downloadAssign.jsp?downloadAssignID=<%=atp.getAssignID()%>"><strong
					style="font-size: 10px;">Download : <%=atp.getFileName()%></strong></a></td>
			<td style="color: black; font-family: serif; font-size: 12px;">Dead
				Line: <strong><%=atp.getDeadLine()%></strong>
			</td>
		</tr>
	</table>
	<%
		} else {
	%>
	<table class="jumbotron" style="border-style: hidden;">
		<tr>
			<td colspan="4">No Assignment has been posted for Course code: <%=courseIDNOs%></td>
		</tr>
	</table>
	<%
		}
		} else {
	%>

	<table class="jumbotron" style="color: red; font-size: 20px;">
		<tr>
			<td colspan="4">No Assignment has been posted for Course code: <%=courseIDNOs%></td>
		</tr>
	</table>
	<%
		}
	%>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>