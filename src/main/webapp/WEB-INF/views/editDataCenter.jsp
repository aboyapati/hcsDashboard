<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Edit Provisioning</title>
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
	
	<form id="edit_connection_form">
		<h3 class="edit_title">Edit Data Center</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			 
			<tr>
				<td>
					<p>Name<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="hidden" id="edit_provisingId" class="projectName">
					<input type="text" id="edit_provisingName" class="projectName" maxlength="100">
				</td>
			</tr>
			<tr>
				<td>
					<p>Country<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="edit_country" class="testplan_select">
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
					<input type="text" id="edit_state" class="projectName" maxlength="255">
				</td>
			</tr>

			<tr>
				<td>
					<p>City<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="edit_city" class="projectName" maxlength="50">
				</td>
			</tr>
			<tr>
				<td>
					<p>TimeZone<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="edit_siteTimeZone" class="testplan_select">
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
					<button style="background-color: transparent;border: 0px; width: 80px;height: 35px;" type="reset" class="edit_cancel_button" data-dismiss="modal"></button>
					<div id="edit_save_id" class="edit_save_button" style="width: 80px;height: 35px;"></div>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
$(".project_edit").click(function(){
		
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(0).text();
		
		var name = tr.find('td').eq(1).text();
		var country = tr.find('td').eq(2).text();
		var state = tr.find('td').eq(3).text();
		var city = tr.find('td').eq(4).text();
		var timezone = tr.find('td').eq(5).text();
		
		 
		$("#edit_provisingId").val($.trim(id));
		$("#edit_provisingName").val($.trim(name));
		$("#edit_country").val($.trim(country));
		$("#edit_state").val($.trim(state));
		$("#edit_city").val($.trim(city));
		$("#edit_siteTimeZone").val($.trim(timezone));
		
	});

	$(".edit_save_button").click(function(){

		var id = $("#edit_provisingId").val();
		var name = $("#edit_provisingName").val();
		var country = $("#edit_country").val();
		var state = $("#edit_state").val();
		var city = $("#edit_city").val();
		var timezone = $("#edit_siteTimeZone").val();

		var specialChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
		for (var i = 0; i < specialChars.length; i++) {
		    if (city.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! City should not contain special charcters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		     
		}
		
		var data = 	'id='+ encodeURIComponent($.trim(id))
					+'&&name='+ encodeURIComponent($.trim(name))
					+'&&country='+ encodeURIComponent($.trim(country))
					+'&&state='+ encodeURIComponent($.trim(state))
					+'&&city='+ encodeURIComponent($.trim(city))
					+'&&timeZoneId='+ encodeURIComponent($.trim(timezone));
					
					
		
		if (id.trim()=="") {
	    	bootbox.alert("Data Center not found. Please try again.").find("div.modal-content").addClass("modalfailure");
	    }else if (country.trim()=="" || country.trim()=="--select--") {
	    	bootbox.alert("Please specify the country.").find("div.modal-content").addClass("modalfailure");
	    }
		else if (country.trim()=="") {
	    	bootbox.alert("country not found. Please try again.").find("div.modal-content").addClass("modalfailure");
	    }else if (name.trim()=="") {
	    	bootbox.alert("Please specify the name").find("div.modal-content").addClass("modalfailure");
	    }else if (name.length > 100) {
	    	bootbox.alert("Sorry..! Name should not contain more than 100 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(state.trim()==""){
	    	bootbox.alert("Please specify the state").find("div.modal-content").addClass("modalfailure");
	    }else if(city.trim()==""){
	    	bootbox.alert("Please specify the city").find("div.modal-content").addClass("modalfailure");
	    }else if (city.length > 50) {
	    	bootbox.alert("Sorry..! City should not contain more than 50 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(timezone.trim()==""){
	    	bootbox.alert("Please specify the timezone").find("div.modal-content").addClass("modalfailure");
	    } 
		else{
			bootbox.confirm({
				 buttons: {
				  		 confirm: {
				    		label: 'YES',
			        	},
				        cancel: {
				            label: 'NO',
				        }
				    },
					
			    message: 'Are you sure you want to save this changes?',
	
				callback: function(result) {
			    	if(result) {	
			    		  $.ajax({
							url : "dataCenter/update",
							data : data,
							type : "POST",
				
							success : function(editProvision) {
								if(editProvision=="success"){
									bootbox.alert("Datacenter Updated Successfully.",function(){window.location = "provisioning";
									}).find("div.modal-content").addClass("modalsuccess");
								}
								else{
									bootbox.alert(editProvision).find("div.modal-content").addClass("modalfailure");
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

	$(".edit_cancel_button").click(function(){
		$('#edit_connection_form').trigger("reset");
	});
});

 
</script>
</html>