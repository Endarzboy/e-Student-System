<%@page import="com.model.Student"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.*, com.adminDao.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
	int countRows = 0;
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if (isMultipart) {

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		// List of Input types / Collections of Input types
		List<FileItem> items = upload.parseRequest(request);

		int index = 0;
		File uploadedFile = null;

		for (FileItem item : items) {

			if (!item.isFormField()) {
				String fileName = item.getName();//toImport.xlsx

				//Root directory where the file is to be uploaded
				String root = getServletContext().getRealPath("/");
				File path = new File(root + "/upload");
				if (!path.exists()) {
					boolean status = path.mkdirs();
				}

				// Uploaded File
				uploadedFile = new File(path + "/" + fileName);
				System.out.println(uploadedFile.getAbsolutePath());
				item.write(uploadedFile);

			} else if (item.isFormField()) {
				if (item.getFieldName().equals("index"))
					index = Integer.parseInt(item.getString());
			}
			
			try {
				ManageStudentDao msDao = new ManageStudentDao();
				List<ArrayList<String>> lists = msDao.readExcelData(uploadedFile.getAbsolutePath(),index);

				for (ArrayList<String> list : lists) {
					Student stud = new Student();
					stud.setStudentID(list.get(0));
					stud.setFullName(list.get(1));
					stud.setGender(list.get(2));
					stud.setAddress(list.get(3));
					stud.setDeptID(list.get(4));
					stud.setCollegeID(list.get(5));
					stud.setStreamID(list.get(6));
					stud.setBatch(list.get(7));

					if (msDao.BatchInsertion(stud)) {
						countRows++;
					}
				}
			} catch (Exception e) {
				//response.sendRedirect("registerStud.jsp?msg=Please Selecet the file first");
			}
		}
		response.sendRedirect("viewStudent.jsp?msg=Import has been Succeded");
		System.out.println(countRows + " Rows has been Imported");
	}
%>