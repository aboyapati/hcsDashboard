
<style type="text/css">
	input[type=text][disabled]{
		background-color: transparent;
	}
</style>
<h3 class="myprofile_heading_text">App Settings</h3>
<!-- 
<div class="myprofile_image"></div><br>
<div class="myprofile_change_image">Change</div><br> --><br><br>
<div style="margin-bottom: 10px"></div>
			
		<form id="app_settings" style="margin-left: 20px "> 
		
			<label class="myprofile_label_text">Ping Command Parameters</label>
					<input type="text" id="pingCmdParms" name="pingCmdParms" class="myprofile_input_box" value="${pingCmdParms}">
			
			<label class="myprofile_label_text">Ping Interval (ms)</label>
					<input type="text" id="pingInterval" name="pingInterval" class="myprofile_input_box" value="${pingInterval}">
			
			<label class="myprofile_label_text">Ping Timeout (ms)</label>
					<input type="text" id="pingTimeout" name="pingTimeout" class="myprofile_input_box" value="${pingTimeout}">
			
			<label class="myprofile_label_text">Report Ping Fail Count</label>
					<input type="text" id="reportPingFailCount" name="reportPingFailCount" class="myprofile_input_box" value="${reportPingFailCount}">
			
			<label class="myprofile_label_text">Report Ping error Count</label>
					<input type="text" id="reportPingErrorCount" name="reportPingErrorCount" class="myprofile_input_box" value="${reportPingErrorCount}">
					
			<label class="myprofile_label_text">Phones Observed Per Thread</label>
					<input type="text" id="phonesObservedPerThread" name="phonesObservedPerThread" class="myprofile_input_box" value="${phonesObservedPerThread}">
					
			<input type="submit" class="myprofile_save_button" value="">
		</form>
		
		
<script>
	$(document).ready(function(){
		$('#app_settings').submit(
			function(event) {
				var pingCmdParms = $('#pingCmdParms').val();
				var pingInterval = $('#pingInterval').val();
				var pingTimeout = $('#pingTimeout').val();				
				var reportPingFailCount = $('#reportPingFailCount').val();				
				var reportPingErrorCount = $('#reportPingErrorCount').val();
				var phonesPerThread = $('#phonesObservedPerThread').val();
								
				var data = 'pingCmdParms='
						+ pingCmdParms
						+ '&pingInterval='
						+ pingInterval
						+ '&pingTimeout='
						+pingTimeout
						+'&reportPingFailCount='
						+reportPingFailCount
						+'&reportPingErrorCount='
						+reportPingErrorCount
						+'&phonesObservedPerThread='
						+phonesPerThread;
						
				$.ajax({
					url : "updateAppSettings",
					data : data,
					type : "GET",
	 		
					success : function(response) {
						if(response=="Successfully Updated"){
							bootbox.alert(response).find("div.modal-content").addClass("modalsuccess");
						}
						else{
							bootbox.alert(response).find("div.modal-content").addClass("modalfailure");
						}
					},
					error : function(xhr, status, error) {
						console.log(xhr.responseText);
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
	});
	
</script>