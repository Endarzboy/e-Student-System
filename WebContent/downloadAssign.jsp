
<%@page language="java" trimDirectiveWhitespaces="true"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	String downloadID = request.getParameter("downloadAssignID");

	Connection con = null;
	PreparedStatement pSet = null;
	ResultSet rSet;

	String fileName = "";
	int fileSize = 0, bytesRead = 0;
	Blob blobData = null;
	InputStream is = null;
	FileOutputStream fos = null;

	con = DBConnection.createConnection();
	try {

		String selectToDownload = "SELECT AssignmentFile,FileName,FileSize FROM AssignmentToPost WHERE AssignID=?";
		pSet = con.prepareStatement(selectToDownload);
		pSet.setString(1, downloadID);

		rSet = pSet.executeQuery();

		if (!rSet.next())
			return;

		fileName = rSet.getString("FileName");
		fileSize = rSet.getInt("FileSize");

		blobData = rSet.getBlob("AssignmentFile");

		String contentType = this.getServletContext().getMimeType(fileName);
		//response.reset();
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", String.valueOf(fileSize));
		response.setHeader("Content-Disposition", "inline;filename=\"" + fileName + "\"");

		is = blobData.getBinaryStream();
		
		if (is == null)
			return;

		byte bytes[] = new byte[fileSize];

		while ((bytesRead = is.read(bytes)) != -1) {
			response.getOutputStream().write(bytes, 0, bytesRead);
		}

		is.close();

		response.getOutputStream().flush();
		response.getOutputStream().close();

		con.close();

	} catch (Exception e) {
		
		System.out.println("\nUnable to Download the file: " + e.getMessage());
	}
%>