<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page import="com.instructorDao.ManageHandoutDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.adminDao.AccountDao,com.deptHeadDao.*,com.model.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<style type="text/css">
#frm {
	margin-top: 80px;
	margin-left: 100px;
}
</style>
<%
	String msg = "";
	String hid = request.getParameter("editHoID");
	boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
	if (isMultiPart) {

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> items = upload.parseRequest(request);

		File directoryPath = null, uploadedFile = null;
		String fileName = "", course = "", stream = "", semester = "", filePath = "", batch = "";

		for (FileItem item : items) {

			if (!item.isFormField()) {

				fileName = item.getName();

				directoryPath = new File(getServletContext().getRealPath("/") + "/UploadedHandout");
				if (!directoryPath.exists())
					directoryPath.mkdirs();

				uploadedFile = new File(directoryPath + "/" + fileName);
				System.out.println(uploadedFile.getAbsolutePath());
				item.write(uploadedFile);

				filePath = uploadedFile.getAbsolutePath();

			} else if (item.isFormField()) {

				if (item.getFieldName().equals("course"))
					course = item.getString();
				if (item.getFieldName().equals("stream"))
					stream = item.getString();
				if (item.getFieldName().equals("batch"))
					batch = item.getString();
				if (item.getFieldName().equals("semester"))
					semester = item.getString();

			}
		}

		Handout ho = new Handout();

		String deptID = (String) session.getAttribute("instDept");
		String instID = (String) session.getAttribute("instID");

		String hoID = Long.toHexString(Double.doubleToLongBits(Math.random()));

		ho.setHandoutID("ho" + hoID);
		ho.setCourseID(course);
		ho.setStreamID(stream);
		ho.setDeptID(deptID);
		ho.setPreparedBy(instID);
		ho.setBatch(Integer.parseInt(batch));
		ho.setSemester(Integer.parseInt(semester));

		ManageHandoutDao mhoDao = new ManageHandoutDao();

		boolean updated = mhoDao.UpdateHandout(ho, filePath, hid);//(at, filePath);//E:\Selams_Project\JSP_Basic_Tutorials\Final.Documentation\Sent.Documents\Chapter.2-3.docx
		if (updated) {
			msg = "Handout has been Updated Successfully";
		} else {
			msg = "Failed Uploading and Updating Handout";
		}

	}
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Upload Handouts and Course Materials</h4>
	<hr>
	<%
		if (msg != null && msg != "") {
	%>
	<strong style="color: green;"><%=msg%></strong>
	<%
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
	<form action="" method="post" enctype="multipart/form-data">

		<%
			ManageHandoutDao mhoDao = new ManageHandoutDao();

			Handout ho = mhoDao.getHandoutByCourseID(hid);
			if (hid != null && hid != "") {
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Course:</label> <select name="course" required="required"
							class="form-control" style="width: 300px;">
							<option value="<%=ho.getCourseID()%>"><%=ho.getCourseID()%></option>
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
						<label>File:</label><input type="file" name="handout"
							required="required" class="form-control" style="width: 300px;">
					</div>
					<div class="form-group">
						<%
							String selectStream = "SELECT * FROM Stream";
								pSt1 = con.prepareStatement(selectStream);

								rSet1 = pSt1.executeQuery();
						%>
						<label>Stream:</label> <select name="stream" required="required"
							class="form-control" style="width: 300px;">
							<option value="<%=ho.getStreamID()%>"><%=ho.getStreamID()%></option>
							<%
								while (rSet1.next()) {
							%>
							<option value="<%=rSet1.getString("StreamID")%>"><%=rSet1.getString("StreamName")%></option>
							<%
								}
							%>
						</select>
					</div>

				</div>
				<div class="col-md-6">

					<div class="form-group">
						<label>Batch:</label> <select name="batch" required="required"
							class="form-control" style="width: 300px;">
							<option value="<%=ho.getBatch()%>"><%=ho.getBatch()%></option>
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
							class="form-control" style="width: 300px;">
							<option value="<%=ho.getSemester()%>"><%=ho.getSemester()%></option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>

					</div>
					<%
						}
					%>
					<div class="form-group">
						<input type="submit" name="updateHandout" value="Upload Handouts"
							class="btn btn-info btn-sm"> <a href="viewHandouts.jsp"
							class="btn btn-default btn-sm"> Back to Exam List</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>