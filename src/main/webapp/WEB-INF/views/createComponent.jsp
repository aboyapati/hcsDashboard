<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Compoent</title>
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
	<form id="add_component_form" style="color: #7694b7">
		<h3 class="edit_title">Add Component</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">

			<tr>
				<td>
					<p>Name<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_componentName" class="projectName" maxlength="100">
				</td>
			</tr>
			<tr>
				<td>
					<p>Type<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="add_componentType" class="testplan_select" onchange="getComponentVersion()">
						<option value="--select--">--select--</option>
						<c:forEach var="componentTypeEnum" items="${componentTypesEnumlist}">
							<option value="${componentTypeEnum}">${componentTypeEnum}</option>
						</c:forEach>
						 
					</select>	
				</td>
			</tr>
			<tr>
				<td>
					<p>Version<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="add_componentTypeVersion" class="testplan_select" >
						<option value="--select--">--select--</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td>
					<p>IP<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_componentIPAddress" class="projectName" maxlength="100">
				</td>
			</tr>
			 <tr>
				<td>
					<p>User Name<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_componentUserName" class="projectName" maxlength="100">
				</td>
			</tr>
			 <tr>
				<td>
					<p>Password<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_componentPassword" class="projectName" maxlength="100">
				</td>
			</tr>
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px; width: 80px;height: 35px;" type="reset" class="add_cancel_button" data-dismiss="modal"></button>
					<div id="addComponent" class="add_save_button"  style="width: 80px;height: 35px;"></div>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$("#addComponent").click(function(){
		var dataCenterId = $("#component_dataCenterId").val();
		 
		var componentName 		= $("#add_componentName").val();
		var componentType		= $("#add_componentType").val();
		var componentTypeId 	= $("#add_componentTypeVersion").val();
		var ipAddress 			= $("#add_componentIPAddress").val();
		var userName 			= $("#add_componentUserName").val();
		var pass 				= $("#add_componentPassword").val();
		
		var specialChars = "!@#$%^&*()+=-[]\\\';,/{}|\":<>?";
		for (var i = 0; i < specialChars.length; i++) {
		 if (ipAddress.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! IP Address should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		}
		var data = 	'name='+ encodeURIComponent($.trim(componentName))
					+'&&componentTypeId='+ encodeURIComponent($.trim(componentTypeId))
					+'&&dataCenterId='+ encodeURIComponent($.trim(dataCenterId))
					+'&&ipAddress='+ encodeURIComponent($.trim(ipAddress))
					+'&&componentUser='+ encodeURIComponent($.trim(userName))
					+'&&password='+ encodeURIComponent($.trim(pass));
					 
 
					
		if (componentName.trim()=="") {
	    	bootbox.alert("Please specify the Component Name").find("div.modal-content").addClass("modalfailure");
	    }else if (componentName.length > 100) {
	    	bootbox.alert("Sorry..! Component Name should not contain more than 100 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(componentType.trim()=="" || componentType.trim()=="--select--"){
	    	bootbox.alert("Please specify the component type").find("div.modal-content").addClass("modalfailure");
	    }else if(componentTypeId.trim()=="" || componentTypeId.trim()=="--select--"){
	    	bootbox.alert("Please specify the component version").find("div.modal-content").addClass("modalfailure");
	    }else if(ipAddress.trim()==""){
	    	bootbox.alert("Please specify the IP Address").find("div.modal-content").addClass("modalfailure");
	    }else if(userName.trim()==""){
	    	bootbox.alert("Please specify the User Name").find("div.modal-content").addClass("modalfailure");
	    }else if(pass.trim()==""){
	    	bootbox.alert("Please specify the PassWord").find("div.modal-content").addClass("modalfailure");
	    }
	     
	    else {
			bootbox.confirm({
				 buttons: {
				  		 confirm: {
				    		label: 'YES',
			        	},
				        cancel: {
				            label: 'NO',
				        }
				    },
					
			    message: 'Are you sure you want to add this Component?',
	
				callback: function(result) {
			    	if(result) {	
			    		  $.ajax({
							url : "component/add",
							data : data,
							type : "POST",
				
							success : function(addComponent) {
								if(addComponent=="success"){
									bootbox.alert("Component created successfully.",function(){window.location = "component?dataCenterId="+dataCenterId;
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
	
	$(".add_cancel_button").click(function(){
		$('#add_component_form').trigger("reset");
	});
	        
	 
});
 
function getComponentVersion(){
	var componenttype = $("#add_componentType").val();
	var dataCenterId = $("#component_dataCenterId").val();
	$("#add_componentTypeVersion").html("<option value='"+"--select--"+"'>"+"--select--"+"</option>");
	if (componenttype.trim()=="" || componenttype.trim()=="--select--") {
		 $("#add_componentTypeVersion").html("<option value='"+"--select--"+"'>"+"--select--"+"</option>");
		 return;
    } 
	//var data = "componenttype="+encodeURIComponent($.trim(componenttype));
	var data ='componenttype='+ encodeURIComponent($.trim(componenttype))
			  +'&&dataCenterId='+ encodeURIComponent($.trim(dataCenterId));
	$.ajax({
		url : "component/getVersion",
		data : data,
		type : "POST",
		success : function(result) {
			for(var i=0; i<result['componentTypeVersionList'].length;i++){
				 $('#add_componentTypeVersion').append('<option value="' + result['componentTypeIdList'][i] + '">' + result['componentTypeVersionList'][i] + '</option>');
				 
			}
		}
	});
	
}
</script>
</html>