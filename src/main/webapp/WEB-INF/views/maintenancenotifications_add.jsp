<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>System Maintenance</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/systemMaintenanceNotifications.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/edit_connection.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>"/>
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
		
		.edit_connection_table tr{ 
			outline:0px!important;
		}
	</style>
</head>
<body>
<div class="systemMaintenanceNotifications">
<h3 class="systemMaintenanceNotifications_title">System Maintenance</h3>
	
	<form id="addMaintenanceNotificationsForm" >
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">

			<tr>
				<td style="padding: 6px">
					<p>Expected Start Date<text style="color:red">*</text></p>
				</td>
				<td style="padding: 8px">
					<div class="startCal">
					  	<input class="datepicker" type="text" id="expected_start_date" name="expectedStartDate" placeholder="MM/DD/YYYY" readonly="readonly">
						<text style="color:#7694b7; margin-left: 45px;font-weight:400;padding-right:5px">Time</text>
						<input id="expected_start_time" style="cursor: pointer;" type="text" class="ui-timepicker-input" autocomplete="off" readonly="readonly" size="40px;">
				  	</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 8px">
					<p>Expected End Date<text style="color:red">*</text></p>
				</td>
				<td style="padding: 8px">
					<div class="startCal">
					  	<input class="datepicker" type="text" id="expected_end_date" name="expectedEndDate" placeholder="MM/DD/YYYY" readonly="readonly">
						<text style="color:#7694b7; margin-left: 45px;font-weight:400;padding-right:5px">Time</text>
						<input id="expected_end_time" style="cursor: pointer;" type="text" class="ui-timepicker-input" autocomplete="off" readonly="readonly" size="40px;">
				  	</div>
				</td>
			</tr>			
			<tr>
				<td style="padding: 8px">
				<p>Description<text style="color:red">*</text></p>
				</td>
				<td style="padding: 8px">
					<input type="text" id="description" class="projectName" maxlength="50">
				</td>
			</tr>
			<tr>
				<td>
				</td>	
				<td class="scheduleSystemMaintenanceNotifications_buttons">
					<button type="reset" style="background-color: transparent;border: 0px;margin-top: 30px;margin-left: 22px"
						class="systemMaintenanceNotifications_cancel_button"  data-dismiss="modal" ></button>
		
					<div id="edit_save_id" class="systemMaintenanceNotifications_save_button" style="margin-top: 30px;margin-left: 25px"></div>
				</td>
		  </tr>				
		</table> 	
	</form>
</div>

</body>
<script>
 $('.systemMaintenanceNotifications_save_button').click(function(){
	var expectedStartDate=$('#expected_start_date').val();
	var expectedEndDate = $('#expected_end_date').val();
	var description = $('#description').val();
	var expectedStartTime =$('#expected_start_time').val();
	var expectedEndTime = $('#expected_end_time').val();

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
	
	var data = 'expected_start_date_time='+ encodeURIComponent($.trim(expectedStartDateTime))
	+'&&expected_end_date_time='+ encodeURIComponent($.trim(expectedEndDateTime))
	+'&&expected_start_time='+ encodeURIComponent($.trim(expectedStartTime))
	+'&&expected_end_time='+ encodeURIComponent($.trim(expectedEndTime))
	+'&&description='+ encodeURIComponent($.trim(description));

	addSystemMaintenanceNotifications(data); 
});

function addSystemMaintenanceNotifications(data){
	bootbox.confirm({
		 buttons: {
		  		 confirm: {
		    		label: 'YES',
	        	},
		        cancel: {
		            label: 'NO',
		        }
		    },
	    message: 'Are you sure want to save the Maintenance window?',
		callback: function(result) {
	    	if(result) {
	    		//blockUI();
	    		 $.ajax({
					url : "maintenancenotificationsAdd",
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
							//$.unblockUI();
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
	$('#addMaintenanceNotificationsForm').trigger("reset");
});
</script>
</html>