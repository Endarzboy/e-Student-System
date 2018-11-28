<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page import="com.model.ExamSchedule"%>
<%@page import="com.clientSide.ScheduleDao"%>
<%@page import="com.model.AssignmentToPost"%>
<%@page import="java.util.List"%>
<%@page import="com.clientSide.NoticeDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>


<jsp:include page="includes/leftMenu.jsp"></jsp:include>


<!-- This is the right panel -->
<div class="col-md-10">

	<%
		String deptID = (String) session.getAttribute("deptDept");
	%>
	<%
		int pageSize, noOfPages, onPage;

		pageSize = 5;
		noOfPages = (int) (Math.ceil((double) ScheduleDao.getRowCount() / pageSize));

		Connection con = null;
		PreparedStatement pSt;
		ResultSet rSet = null;

		con = DBConnection.createConnection();
		try {
			String getDept = "SELECT * FROM Department";
			pSt = con.prepareStatement(getDept);
			pSt.executeQuery();
			rSet = pSt.getResultSet();

		} catch (Exception e) {
			System.out.println("\nUnable to get Department: " + e.getMessage());
		}
	%>


	<h4 style="color: blue;">List of Schedules</h4>
	<div style="float: right;">
		<form action="searchSchedule.jsp" method="post">
			<div class="row">
				<div class="col-md-6">
					<select name="searchSchedOption" class="form-control"
						style="width: 170px;">
						<option>Select Department</option>
						<%
							while (rSet.next()) {
						%>
						<option value="<%=rSet.getString("DeptID")%>"><%=rSet.getString("DeptName")%></option>
						<%
							}
						%>

					</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-md-3">
					<input type="submit" name="btnSearchSchedul" value="Search"
						class="btn btn-info">
				</div>
			</div>
		</form>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>

				<th>Course</th>
				<th>Department</th>
				<th>Date of Exam</th>
				<th>Notice</th>
				<th>Allocated Time</th>
				<th>Invigilator</th>
				<th>Batch</th>

			</tr>
		</thead>
		<tbody>
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
				ScheduleDao sdao = new ScheduleDao();
				NoticeDao ndao = new NoticeDao();
				List<ExamSchedule> ess = sdao.getAllSchedule((onPage - 1) * pageSize, pageSize);

				for (ExamSchedule es : ess) {
			%>
			<tr>
				<td><%=ndao.getCourseTitle(es.getCourseID())%></td>
				<td><%=ndao.getDeptTitle(es.getDeptID())%></td>
				<td><%=es.getDateOfExam()%></td>
				<td><%=es.getExamNotice()%></td>
				<td><%=es.getExamTime()%></td>
				<td><%=es.getInvigilator()%></td>
				<td><%=es.getBatch()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<a style="font-family: serif;" href="schedule.jsp?page=1"
		class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a style="font-family: serif;" href="schedule.jsp?page=<%=i%>"
		class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a style="font-family: serif;" href="schedule.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>