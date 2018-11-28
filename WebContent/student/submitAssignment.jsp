
<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.adminDao.ManageStudentDao"%>
<%@page import="com.model.Instructor"%>
<%@page import="com.studentDao.InfoHubDao"%>
<%@page import="com.model.SubmittedAssignment"%>
<%@page import="com.studentDao.SubmitAssignmentDao"%>
<%@page import="com.studentDao.StudentDao"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">

	<%
		String studCourses = (String) session.getAttribute("studID");
		Connection con = null;
		PreparedStatement pSt, pSt1, pSt2, pSt3;
		ResultSet rSet, rSet1, rSet2, rSet3;
		con = DBConnection.createConnection();
	%>
	<%
		String dateWarning = "", success = "", error = "", msg = "";
		boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
		if (isMultiPart) {

			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);

			List<FileItem> items = upload.parseRequest(request);

			File directoryPath = null, uploadedFile = null;
			String fileName = "", assignment = "", batch = "", stream = "", instructorid = "", filePath = "";

			for (FileItem item : items) {

				if (!item.isFormField()) {

					fileName = item.getName();

					directoryPath = new File(getServletContext().getRealPath("/") + "/SubmittedAssignms");
					if (!directoryPath.exists())
						directoryPath.mkdirs();

					uploadedFile = new File(directoryPath + "/" + fileName);
					item.write(uploadedFile);

					filePath = uploadedFile.getAbsolutePath();

				} else if (item.isFormField()) {

					if (item.getFieldName().equals("assign"))
						assignment = item.getString();
					if (item.getFieldName().equals("stream"))
						stream = item.getString();

					if (item.getFieldName().equals("batch"))
						batch = item.getString();
					if (item.getFieldName().equals("instructor"))
						instructorid = item.getString();

				}
			}

			String deptID = (String) session.getAttribute("studDept");
			String studiD = (String) session.getAttribute("studID");
			String course = request.getParameter("courseIDNo");

			LocalDate ld = LocalDate.now();
			String today = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(ld);//to set the day when the teacher posts the assignment

			//String assignID = Long.toHexString(Double.doubleToLongBits(Math.random()));
			String deadLine = "";
			String selectAssignId = "SELECT DeadLine FROM AssignmentToPost WHERE AssignID=?";
			pSt3 = con.prepareStatement(selectAssignId);
			pSt3.setString(1, assignment);

			rSet3 = pSt3.executeQuery();
			if (rSet3.next()) {
				deadLine = rSet3.getString("DeadLine");
			}

			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
			Date currentDate = dtf.parse(today);
			Date deadLineDate = dtf.parse(deadLine);

			SubmittedAssignment sa = new SubmittedAssignment();

			sa.setSubAssignID(assignment);
			sa.setCourseID(course);
			sa.setDeptID(deptID);
			sa.setStreamID(stream);
			sa.setSubmittedDate(today);
			sa.setBatch(Integer.parseInt(batch));
			sa.setInstructorID(instructorid);
			sa.setStudentID(studiD);

			SubmitAssignmentDao saDao = new SubmitAssignmentDao();

			if (currentDate.compareTo(deadLineDate) <= 0) {

				if (saDao.SubmitAssignment(sa, filePath, assignment, studiD)) {
					success = "You have Submitted Your Assignment Successfully.";
				} else {
					error = "You are trying to Submit more than one times.";
				}

			} else {
				dateWarning = "The DeadLine has already Passed, Please Contact your Instructor in person.";
			}

		}
	%>

	<%
		String selectCourses = "SELECT * FROM CourseToStudent WHERE StudentID=?";
		pSt = con.prepareStatement(selectCourses);
		pSt.setString(1, studCourses);

		rSet = pSt.executeQuery();
	%>

	<%
		InfoHubDao ih = new InfoHubDao();
		String ccid = request.getParameter("courseIDNo");
		String title = ih.getCourseTitle(ccid);
	%>


	<h3 style="color: blue;">Submit Assignment or Project</h3>
	<hr>
	<%
		Instructor inst = ih.getInstructorName(ccid);
		if (inst != null) {
	%>
	<h5>
		<strong style="color: blue;">Course: </strong> <strong
			style="color: red;"><%=title%></strong>
		<div style="float: right;">
			<strong style="color: blue;">Instructor: </strong><strong
				style="color: red;"><%=inst.getFullName()%></strong>
		</div>
	</h5>
	<%
		}
	%>
	<hr>
	<%
		if (success != null && success != "") {
	%>
	<strong style="color: green;"><%=success%></strong>
	<%
		}
	%>
	<%
		if (error != null && error != "") {
	%>
	<strong style="color: red;"><%=error%></strong>
	<%
		}
	%>
	<%
		if (dateWarning != null && dateWarning != "") {
	%>
	<strong style="color: red;"><%=dateWarning%></strong>
	<%
		}
	%>
	<%
		if (msg != null && msg != "") {
	%>
	<strong style="color: red;"><%=msg%></strong>
	<%
		}
	%>
	<hr>
	<form action="" method="post" enctype="multipart/form-data">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<%
							String courseID = request.getParameter("courseIDNo");
							String selectAssignId = "SELECT * FROM AssignmentToPost WHERE CourseID=?";
							pSt3 = con.prepareStatement(selectAssignId);
							pSt3.setString(1, courseID);

							rSet3 = pSt3.executeQuery();
						%>
						<label>Assignment:</label> <select name="assign"
							class="form-control" style="width: 300px;" required>
							<option>Select Assignment</option>
							<%
								while (rSet3.next()) {
							%>
							<option value="<%=rSet3.getString("AssignID")%>"><%=rSet3.getString("Title")%></option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group">
						<%
							String selectStream = "SELECT * FROM Stream";
							pSt1 = con.prepareStatement(selectStream);

							rSet1 = pSt1.executeQuery();
						%>
						<label>Stream:</label> <select name="stream" class="form-control"
							style="width: 300px;" required="required">
							<option>Select Stream</option>
							<%
								while (rSet1.next()) {
							%>
							<option value="<%=rSet1.getString("StreamID")%>"><%=rSet1.getString("StreamName")%></option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group">
						<label>File:</label> <input type="file" name="myfile"
							required="required" class="form-control" style="width: 300px;">
					</div>

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Batch:</label> <select name="batch" required="required"
							class="form-control" style="width: 300px;">
							<option>Select Batch</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</div>
					<div class="form-group">
						<%
							String departmenttID = (String) session.getAttribute("studDept");

							String selectInstructor = "SELECT * FROM Instructor WHERE DeptID=?";
							pSt2 = con.prepareStatement(selectInstructor);
							pSt2.setString(1, departmenttID);

							rSet2 = pSt2.executeQuery();
						%>
						<label>Instructors:</label> <select name="instructor"
							class="form-control" style="width: 300px;" required="required">
							<option>Select Instructor</option>
							<%
								while (rSet2.next()) {
							%>
							<option value="<%=rSet2.getString("InstructorID")%>"><%=rSet2.getString("FullName")%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<input type="submit" name="submitAssign"
							class="btn btn-info btn-sm" value="Submit Assignment"> <a
							href="viewCourses.jsp" class="btn btn-default btn-sm">Back to
							Course</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>