
<style type="text/css">
	input[type=text][disabled]{
		background-color: transparent;
	}
</style>
<h3 class="myprofile_heading_text">My Profile</h3>
<!-- 
<div class="myprofile_image"></div><br>
<div class="myprofile_change_image">Change</div><br> --><br><br>
<div style="margin-bottom: 10px"></div>
			
		<form id="myprofileform_id" style="margin-left: 20px " action="changeMyProfile" modelAttribute="myprofileform"> 
		
			<label class="myprofile_label_text">Name</label>
					<input type="text" id="myprofile_name_id" name="myprofile_name_name" class="myprofile_input_box" value="${userprofile.name}">
			
			<label class="myprofile_label_text">Login ID</label>
					<input type="text" id="myprofile_loginID_id" name="myprofile_loginID_name" class="myprofile_input_box" value="${userprofile.loginId}" disabled>
			
			<label class="myprofile_label_text">Password</label>
					<input type="password" path="newpassword" id="newpassword" name="newpassword" class="myprofile_input_box" placeholder="New Password">
			
			<label class="myprofile_label_text">Email</label>
					<input type="text" id="myprofile_email_id" name="myprofile_email_name" class="myprofile_input_box" value="${userprofile.email}" disabled>
					
			<label class="myprofile_label_text">Provider</label>
					<input type="text" id="provider" name="myprofile_provider" class="myprofile_input_box" value="${userprofile.provider.name}" disabled>
					
			<label class="myprofile_label_text">User Type</label>
					<input type="text" id="myprofile_usertype_id" name="myprofile_usertype_name" class="myprofile_input_box" value="${userprofile.usertype.name}" disabled>
			
			<input type="submit" class="myprofile_save_button" value="">
		</form>
		
		
<script>
	$('#myprofileform_id').submit(
		function(event) {
			var name = $('#myprofile_name_id').val();
			var newpswd = $('#newpassword').val();
			if(newpswd!=" "){
				if(newpswd.trim==""){
					bootbox.alert("Password cannot be less than 4 characters").find("div.modal-content").addClass("modalfailure");
					return false;
				}
			}
			var data = 'password='
					+ encodeURIComponent(newpswd)
					+ '&name='
					+ encodeURIComponent(name);
			$.ajax({
				url : $("#myprofileform_id").attr("action"),
				data : data,
				type : "POST",
 
				success : function(response) {
					if(response=="success"){ 
						bootbox.alert("Successfully Updated").find("div.modal-content").addClass("modalsuccess");
					}
					else{
						bootbox.alert(response).find("div.modal-content").addClass("modalfailure");
					}
				},
				error : function(xhr, status, error) {
					if(error=="Not Found"){
						bootbox.alert("Session Expired..Please Login again..",function(){window.location = "login";
						}).find("div.modal-content").addClass("modalfailure");
					}
					else{
						bootbox.alert("Unknown Error occurred. Try again later").find("div.modal-content").addClass("modalfailure");
					}
				}
			});
			return false;
		});
</script>