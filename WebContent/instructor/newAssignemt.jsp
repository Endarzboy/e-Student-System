<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.clientSide.NotificationDao"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.model.*,com.instructorDao.*"%>
<%@page import="com.db.*"%>
<%@page import="java.sql.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<%
	String dateWarning = "";
	boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
	if (isMultiPart) {

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> items = upload.parseRequest(request);

		File directoryPath = null, uploadedFile = null;
		String fileName = "", desc = "", course = "", title = "", deadLine = "", batch = "", semester = "",
				filePath = "";

		for (FileItem item : items) {

			if (!item.isFormField()) {

				fileName = item.getName();

				directoryPath = new File(getServletContext().getRealPath("/") + "/UploadedAssignments");
				if (!directoryPath.exists())
					directoryPath.mkdirs();

				uploadedFile = new File(directoryPath + "/" + fileName);
				item.write(uploadedFile);

				filePath = uploadedFile.getAbsolutePath();

			} else if (item.isFormField()) {

				if (item.getFieldName().equals("title"))
					title = item.getString();
				if (item.getFieldName().equals("desc"))
					desc = item.getString();
				if (item.getFieldName().equals("course"))
					course = item.getString();
				if (item.getFieldName().equals("deadLine"))
					deadLine = item.getString();
				if (item.getFieldName().equals("batch"))
					batch = item.getString();
				if (item.getFieldName().equals("semester"))
					semester = item.getString();

			}
		}

		AssignmentToPost at = new AssignmentToPost();

		String deptID = (String) session.getAttribute("instDept");
		String instID = (String) session.getAttribute("instID");

		LocalDate ld = LocalDate.now();
		String today = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(ld);//to set the day when the teacher posts the assignment

		String assignID = Long.toHexString(Double.doubleToLongBits(Math.random()));

		at.setAssignID("AsID-" + assignID);
		at.setTitle(title);
		at.setDescription(desc);
		at.setCourseID(course);
		at.setDeptID(deptID);
		at.setDateToPost(today);
		at.setDeadLine(deadLine);
		at.setInstructorID(instID);
		at.setBatch(Integer.parseInt(batch));
		at.setSemester(Integer.parseInt(semester));

		/* ------------------------------------- */

		Notification nf = new Notification();

		String notification = "You have an assignment from instructor : " + instID + " for the course : "
				+ course + " posted on: " + today + " that has to be submitted on:" + deadLine;

		nf.setNotifyID(assignID);
		nf.setInstructorID(instID);
		nf.setCourseID(course);
		nf.setAssignID("AsID" + assignID);
		nf.setNotification(notification);
		nf.setDate(today);

		NotificationDao ndao = new NotificationDao();

		/* -------------------------------------- */

		ManagePostAssignDao mpaDao = new ManagePostAssignDao();

		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = dtf.parse(today);
		Date deadLineDate = dtf.parse(deadLine);

		if (currentDate.compareTo(deadLineDate) <= 0) {
			boolean inserted = mpaDao.InsertAssignment(at, filePath);
			boolean saved = ndao.insertNotification(nf);
			if (inserted && saved)
				response.sendRedirect("postAssignment.jsp");
		} else {
			dateWarning = "You are trying to set the dead line to the already passed days";
		}

	}
%>


<%
	String deptID = (String) session.getAttribute("instDept");
	Connection con = null;
	PreparedStatement pSt, pSt1;
	ResultSet rSet, rSet1;
	con = DBConnection.createConnection();

	String selectCourses = "SELECT * FROM Course WHERE DeptID=?";
	pSt = con.prepareStatement(selectCourses);
	pSt.setString(1, deptID);

	rSet = pSt.executeQuery();
%>

<!-- This is the right panel -->

<div class="col-md-10">

	<h4>Post New Assignment</h4>
	<hr>
	<form action="" method="post" enctype="multipart/form-data"
		class="form-horizontal">
		<div class="container">
			<div class="row">
				<div class="col-md-6">

					<div class="form-group">
						<label>Title:</label> <input type="text" name="title"
							placeholder="Title of Assignment" required="required"
							class="form-control" style="width: 300px;">
					</div>
					<div class="form-group">
						<label>Course:</label> <select name="course" class="form-control"
							style="width: 300px;" required="required">
							<option>Select Course</option>
							<%
								while (rSet.next()) {
							%>
							<option value="<%=rSet.getString("CourseCode")%>"><%=rSet.getString("Title")%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>File:</label> <input type="file" name="myfile"
							required="required" class="form-control" style="width: 300px;">
					</div>
					<div class="form-group">
						<label>Description:</label>
						<textarea rows="6" cols="15" name="desc" class="form-control"
							required="required"></textarea>

					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Deadline:</label> <input type="date" name="deadLine"
							required="required" class="form-control" style="width: 300px;">
						<%
							if (dateWarning != null && dateWarning != "") {
						%>
						<strong style="color: red; font-size: 13px;"><%=dateWarning%></strong>
						<%
							}
						%>
					</div>

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
						<label>Semester:</label> <select name="semester"
							class="form-control" style="width: 300px;" required="required">
							<option>Select Semester</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>

					</div>
					<div class="form-group">
						<input type="submit" name="postAssign" class="btn btn-info btn-sm"
							value="Post Assignment"> <a href="postAssignment.jsp"
							class="btn btn-default btn-sm">Back to Assignment</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>