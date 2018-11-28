<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">







	<h4>Import Course Offer</h4>
	<hr>
	
	<form action="importCourseOfferExcel.jsp" method="post"
		enctype="multipart/form-data">
		<div class="container">
			<div class="row">
				<div class="col-md-2.7">
					<div class="form-group">
						<label>Browse Here:</label> <input type="file" name="deptFile"
							class="form-control" style="width: 200px;" required="required">
						<br> <input type="submit" name="importDept"
							class="btn btn-info btn-sm" value="Import Course Offer">
					</div>
				</div>
				<div class="col-md-3" style="float: left;">
					<div class="form-group" style="width: 100px; margin-top: 37px;">
						<select name="index" class="form-control">
							<option>Index</option>
							<option value="0">0 Index</option>
							<option value="1">1 Index</option>
							<option value="2">2 Index</option>
							<option value="3">3 Index</option>
							<option value="4">4 Index</option>
							<option value="5">5 Index</option>
							<option value="6">6 Index</option>
							<option value="7">7 Index</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>
	<hr>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>