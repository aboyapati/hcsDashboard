<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>System Maintenance</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/systemMaintenanceNotifications.css"/>"/>
	<link media="all" rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/jquery.timepicker.min.css" />" />
	<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.timepicker.min.js" /> "></script>
	<style>
		.systemMaintenanceNotifications input[type="radio"]{
		  margin: 0 10px 0 0px;
		  cursor: pointer;
		}
		.systemMaintenanceNotifications input[type="checkbox"]{
		  margin: 0 5px 0 0px;
		  cursor: pointer;
		}
		
		input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button { 
		  -webkit-appearance: none; 
		  margin: 0; 
		}
		
	 	/* .edit_connection_table tr{ 
			outline:0px!important;
		}  */
	</style>
</head>
<body>
<div class="systemMaintenanceNotifications">
<h3 class="systemMaintenanceNotifications_title">System Maintenance</h3>
	
	<form id="editMaintenanceNotificationsForm">
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			<input type="hidden" id="edit_notificationId">
			<tr>
				<td style="padding: 6px">
					<p>Expected Start Date</p>
				</td>
				<td style="padding: 8px">
					<div class="startCal">
					  	<input type="text" id="edit_expected_start_date" name="expectedStartDate" placeholder="MM/DD/YYYY" readonly="readonly" disabled="disabled">
						<text style="color:#7694b7; margin-left: 45px;font-weight:400;padding-right:5px">Time</text>
						<input id="edit_expected_start_time" style="cursor: pointer;" type="text" class="ui-timepicker-input" autocomplete="off" readonly="readonly" size="40px;" disabled="disabled">
				  	</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 8px">
					<p>Expected End Date</p>
				</td>
				<td style="padding: 8px">
					<div class="startCal">
					  	<input type="text" id="edit_expected_end_date" name="expectedEndDate" placeholder="MM/DD/YYYY" readonly="readonly" disabled="disabled">
						<text style="color:#7694b7; margin-left: 45px;font-weight:400;padding-right:5px">Time</text>
						<input id="edit_expected_end_time" style="cursor: pointer;" type="text" class="ui-timepicker-input" autocomplete="off" readonly="readonly" size="40px;" disabled="disabled">
				  	</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 8px">
				<p>Description<text style="color:red">*</text></p>
				</td>
				<td style="padding: 8px">
					<input type="text" id="edit_description" class="projectName" maxlength="50">
				</td>
			</tr>
			<tr>
				<td style="padding: 8px">
				<p>Schedule Status</p>
				</td>
				<td style="padding: 8px">
					<select id=edit_status class="testplan_select">
						<option value="--select--">--select--</option>
						<option value="START">START</option>
						<option value="COMPLETED">COMPLETED</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
				</td>	
				<td class="systemMaintenanceNotifications_buttons">
					<button type="reset" style="background-color: transparent;border: 0px;margin-top: 50px;margin-left: 22px"
						class="systemMaintenanceNotifications_cancel_button"  data-dismiss="modal" ></button>
		
					<div id="edit_save_id" class="systemMaintenanceNotifications_edit_button" style="margin-top: 50px;margin-left: 25px"></div>
				</td>
			</tr>				
		</table> 	
	</form>

</div>

</body>
<script>
$(document).ready(function(){
	$('.systemMaintenanceNotifications_edit_button').click(function(){
		var notificationId=$('#edit_notificationId').val();
		var expectedStartDate=$('#edit_expected_start_date').val();
		var expectedEndDate = $('#edit_expected_end_date').val();
		var description = $('#edit_description').val();
		var expectedStartTime =$('#edit_expected_start_time').val();
		var expectedEndTime = $('#edit_expected_end_time').val();
		var editStatus = $('#edit_status').val();
		
		if(notificationId.trim()==""){
			bootbox.alert("Notification Id Cannot be Empty.").find("div.modal-content").addClass("modalfailure");
			return false;
		}		
		if(expectedStartDate.trim()==""){
			bootbox.alert("Expected Start Date Cannot be Empty.").find("div.modal-content").addClass("modalfailure");
			return false;
		}
		if(expectedStartTime.trim()==""){
			bootbox.alert("Expected Start Time Cannot be Empty.").find("div.modal-content").addClass("modalfailure");
			return false;
		}
		if(expectedEndDate.trim()==""){
			bootbox.alert("Expected End Date Cannot be Empty.").find("div.modal-content").addClass("modalfailure");
			return false;
		}
		if(expectedEndTime.trim()==""){
			bootbox.alert("Expected End Time Cannot be Empty.").find("div.modal-content").addClass("modalfailure");
			return false;
		}
		if(description.trim()==""){
			bootbox.alert("Description Cannot be Empty.").find("div.modal-content").addClass("modalfailure");
			return false;
		}

		var expectedStartDateTime = expectedStartDate+" "+expectedStartTime;
		var expectedEndDateTime = expectedEndDate+" "+expectedEndTime;
		
		var data = 'notificationId='+ encodeURIComponent($.trim(notificationId))
		+'&&status='+ encodeURIComponent($.trim(editStatus))
		+'&&description='+ encodeURIComponent($.trim(description));
	
		updateSystemMaintenanceNotifications(data); 
	});

	function updateSystemMaintenanceNotifications(data){
		bootbox.confirm({
			 buttons: {
			  		 confirm: {
			    		label: 'YES',
		        	},
			        cancel: {
			            label: 'NO',
			        }
			    },
		    message: 'Are you sure want to update the Maintenance window?',
			callback: function(result) {
		    	if(result) {
		    		//blockUI();
		    		 $.ajax({
						url : "maintenancenotificationsUpdate",
						type : "POST",
						data : data,
						success : function(systemMaintenanceNotifications) {
							if(systemMaintenanceNotifications['status']=="success"){							
								bootbox.alert(systemMaintenanceNotifications['data'],function(){
								window.location = "maintenancenotifications"}).find("div.modal-content").addClass("modalsuccess");
							}
							else{
								bootbox.alert(systemMaintenanceNotifications['data']).find("div.modal-content").addClass("modalfailure");
							}	
						},
						error : function(xhr, status, error) {
							if(error=="Not Found"){
								bootbox.alert("Session Expired..Please Login again..",function(){
									window.location = "login"}).find("div.modal-content").addClass("modalfailure");
							}
							else{
								bootbox.alert("Unknown Error occurred. Try again later").find("div.modal-content").addClass("modalfailure");
							}
						}
					});
		    	}
		    }	
		    //title: "You can also add a title",
		}).find("div.modal-content").addClass("modalalert");
	}
	
	$(".systemMaintenanceNotifications_cancel_button").click(function(){
		$('#editMaintenanceNotificationsForm').trigger("reset");
	});
});
</script>
</html>