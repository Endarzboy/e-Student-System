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
		String deptID = request.getParameter("searchSchedOption");
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


	<h4 style="color: blue;">Search Results</h4>
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
				List<ExamSchedule> ess = sdao.getAllScheduleByDeptID(deptID);

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

	
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>