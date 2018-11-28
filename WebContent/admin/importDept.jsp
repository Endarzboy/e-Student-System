<%@page import="com.model.Department"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.*, com.adminDao.ManageDepartmentDao"%>
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
				ManageDepartmentDao mdDao = new ManageDepartmentDao();
				List<ArrayList<String>> lists = mdDao.readExcelData(uploadedFile.getAbsolutePath(),index);

				for (ArrayList<String> list : lists) {
					Department dp = new Department();
					dp.setDeptID(list.get(0));
					dp.setDeptName(list.get(1));
					dp.setCollegeID(list.get(2));
					dp.setDescription(list.get(3));

					if (mdDao.BatchInsertion(dp)) {
						countRows++;
					}
				}
			} catch (Exception e) {
				//response.sendRedirect("createDept.jsp?msg=Please Selecet the file first");
			}
		}
		response.sendRedirect("viewDepartment.jsp?msg=Import has been Succeded");
		System.out.println(countRows + " Rows has been Imported");
	}
%>