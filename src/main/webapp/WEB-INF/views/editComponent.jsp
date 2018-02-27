<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Edit Component</title>
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
	<input type="hidden" id="component_dataCenterId" value="${dataCenterId}" />   
	<form id="edit_component_form" style="color: #7694b7">
		<h3 class="edit_title">Edit Component</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">

			<tr>
				<td>
					<p>Name<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="hidden" id="edit_componentId" class="projectName" maxlength="100">
					<input type="text" id="edit_componentName" class="projectName">
					<input type="hidden" id="edit_componentTypeId" class="projectName" maxlength="100">
					
				</td>
			</tr>
			<tr>
				<td>
					<p>Type</p>
				</td>
				<td>
					<select id="edit_componentType" class="nonEditable" disabled="disabled">
						<option value="--select--">--select--</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td>
					<p>Version</p>
				</td>
				<td>
					<select id="edit_componentTypeVersion" class="nonEditable" disabled="disabled" maxlength="10">
						<option value="--select--">--select--</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td>
					<p>IP<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="edit_componentIPAddress" class="projectName" maxlength="100">
				</td>
			</tr>
			 <tr>
				<td>
					<p>User Name<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="edit_componentUserName" class="projectName" maxlength="100">
				</td>
			</tr>
			 <tr>
				<td>
					<p>Password<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="edit_componentPassword" class="projectName" maxlength="100">
				</td>
			</tr>
			 
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px; width: 80px;height: 35px;" type="reset" class="edit_cancel_button" data-dismiss="modal"></button>
					<div id="edit_save_id" class="edit_save_button"  style="width: 80px;height: 35px;"></div>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$(".component_edit").click(function(){
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(0).text();
		var name = tr.find('td').eq(1).text();
		var type = tr.find('td').eq(2).text();
		var typeId = tr.find('td').eq(3).text();
		var dataCenterId = tr.find('td').eq(4).text();
		var version = tr.find('td').eq(5).text();
		var ipAddress = tr.find('td').eq(6).text();
		var userName = tr.find('td').eq(7).text();
		var password = tr.find('td').eq(8).text();
		
		$("#edit_componentId").val($.trim(id));
		$("#edit_componentName").val($.trim(name));
		 $("#edit_componentTypeId").val($.trim(typeId)); 
		$("#edit_componentType").html("<option value='"+$.trim(type)+"'>"+$.trim(type)+"</option>");
		$("#component_dataCenterId").val($.trim(dataCenterId));
		
		//$("#edit_componentTypeVersion").val($.trim(version));
		 $("#edit_componentTypeVersion").html("<option value='"+$.trim(version)+"'>"+$.trim(version)+"</option>");
		$("#edit_componentIPAddress").val($.trim(ipAddress));
		$("#edit_componentUserName").val($.trim(userName));
		$("#edit_componentPassword").val($.trim(password));
		
	}); 
	
	$(".edit_cancel_button").click(function(){
		$('#edit_component_form').trigger("reset");
	});
	
	$(".edit_save_button").click(function(){
		var id = $("#edit_componentId").val();
		var name = $("#edit_componentName").val();
		var dataCenterId = $("#component_dataCenterId").val();
		var ipAddress 			= $("#edit_componentIPAddress").val();
		var userName 			= $("#edit_componentUserName").val();
		var pass 				= $("#edit_componentPassword").val();
		var specialChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
		/* for (var i = 0; i < specialChars.length; i++) {
			 if (ipAddress.indexOf(specialChars.charAt(i)) != -1) {
			    	bootbox.alert("Sorry..! IP Address should not contain special characters.").find("div.modal-content").addClass("modalfailure");
			       	return;
			    }
			} */
		var data = 	'id='+ encodeURIComponent($.trim(id))
						 +'&&name='+ encodeURIComponent($.trim(name))
						 +'&&ipAddress='+ encodeURIComponent($.trim(ipAddress))
						 +'&&componentUser='+ encodeURIComponent($.trim(userName))
						 +'&&password='+ encodeURIComponent($.trim(pass));
		
		if (name.trim()=="") {
	    	bootbox.alert("Please specify the Component Name").find("div.modal-content").addClass("modalfailure");
	    }else if (name.length > 100) {
	    	bootbox.alert("Sorry..! Component Name should not contain more than 100 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(ipAddress.trim()==""){
	    	bootbox.alert("Please specify the IP Address").find("div.modal-content").addClass("modalfailure");
	    }else if(userName.trim()==""){
	    	bootbox.alert("Please specify the User Name").find("div.modal-content").addClass("modalfailure");
	    }else if(pass.trim()==""){
	    	bootbox.alert("Please specify the PassWord").find("div.modal-content").addClass("modalfailure");
	    } 
	    else  {
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
							url : "component/update",
							data : data,
							type : "POST",
				
							success : function(addComponent) {
								if(addComponent=="success"){
									bootbox.alert("Component Updated Successfully.",function(){window.location = "component?dataCenterId="+dataCenterId;
									}).find("div.modal-content").addClass("modalsuccess");
								}
								else{
									bootbox.alert(addComponent).find("div.modal-content").addClass("modalfailure");
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
});
</script>
</html>