<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Provisioning</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/edit_connection.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>"/>
	<style>
		.edit_connection_table tr{ 
			outline:0px!important;
		}
		.editconnection {
			height: 293px !important;
		} 
	</style>

</head>
<body>
<div class="editconnection">
	
	<form id="add_provisioning_form">
		<h3 class="edit_title">Add Data Center</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			
			<tr>
				<td>
					<p>Name<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_provisingName" class="projectName" maxlength="100">
				</td>
			</tr>
			<tr>
				<td>
					<p>Country<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="add_country" class="testplan_select">
						<option value="--select--">--select--</option>
						<%@include file="countries.jsp" %>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>State<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_state" class="projectName" maxlength="50">
				</td>
			</tr>

			<tr>
				<td>
					<p>City<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_city" class="projectName" maxlength="50">
				</td>
			</tr>
			<tr>
				<td>
					<p>TimeZone<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="add_siteTimeZone" class="testplan_select">
						<option value="--select--">--select--</option>
						<c:forEach var="timeZone" items="${timeZoneList}">
							<option value="${timeZone.id}">${timeZone.name} - ${timeZone.description}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px; width: 80px;height: 35px;" type="reset" class="add_cancel_button" data-dismiss="modal"></button>
					<div id="addProvisioning" class="add_save_button" style="width: 80px;height: 35px;"></div>
				
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$("#addProvisioning").click(function(){
		 
		var name = $("#add_provisingName").val();
		var country = $("#add_country").val();
		var state = $("#add_state").val();
		var city = $("#add_city").val();
		var timezone = $("#add_siteTimeZone").val();
		 
		var specialChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
		for (var i = 0; i < specialChars.length; i++) {
		    if (city.indexOf(specialChars.charAt(i)) != -1) {		    	
		    	bootbox.alert("Sorry..! City should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }		     
		    if (state.indexOf(specialChars.charAt(i)) != -1) {		    	
		    	bootbox.alert("Sorry..! State should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		}
		  
		var data = 	'name='+ encodeURIComponent($.trim(name))
					+'&&country='+ encodeURIComponent($.trim(country))
					+'&&state='+ encodeURIComponent($.trim(state))
					+'&&city='+ encodeURIComponent($.trim(city))
					+'&&timeZoneId='+ encodeURIComponent($.trim(timezone));
					
		
		if (name.trim()=="") {
	    	bootbox.alert("Please specify the name").find("div.modal-content").addClass("modalfailure");
	    }else if (name.length > 100) {
	    	bootbox.alert("Sorry..! Name should not contain more than 100 characters").find("div.modal-content").addClass("modalfailure");
	    }else if (country.trim()=="" || country.trim()=="--select--") {
			bootbox.alert("Please specify the country").find("div.modal-content").addClass("modalfailure");
		}else if(state.trim()==""){
	    	bootbox.alert("Please specify the state").find("div.modal-content").addClass("modalfailure");
	    }else if (state.length > 50) {
	    	bootbox.alert("Sorry..! State should not contain more than 50 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(city.trim()==""){
	    	bootbox.alert("Please specify the city").find("div.modal-content").addClass("modalfailure");
	    }else if (city.length > 50) {
	    	bootbox.alert("Sorry..! City should not contain more than 50 characters").find("div.modal-content").addClass("modalfailure");
	    }else if (timezone.trim()=="" || timezone.trim()=="--select--") {
	    	bootbox.alert("Please specify the timezone").find("div.modal-content").addClass("modalfailure");
	    } else {

	    	bootbox.confirm({
				 buttons: {
				  		 confirm: {
				    		label: 'YES',
			        	},
				        cancel: {
				            label: 'NO',
				        }
				    },
					
			    message: 'Are you sure you want to add this data center?',
	
				callback: function(result) {
			    	if(result) {	
			    		  $.ajax({
							url : "dataCenter/add",
							data : data,
							type : "POST",
				
							success : function(addProvision) {
								if(addProvision=="success"){
									bootbox.alert("Datacenter created successfully.",function(){window.location = "provisioning";
									}).find("div.modal-content").addClass("modalsuccess");
								}
								else{
									bootbox.alert(addProvision).find("div.modal-content").addClass("modalfailure");
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
			    	}
			    },
			    //title: "You can also add a title",
			}).find("div.modal-content").addClass("modalalert");
		}
		
	});
	
	$(".add_cancel_button").click(function(){
		$('#add_provisioning_form').trigger("reset");
	});
});
 
</script>
</html>