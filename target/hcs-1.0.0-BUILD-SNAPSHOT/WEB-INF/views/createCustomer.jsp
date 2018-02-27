<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Customer</title>
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
	
	<form id="add_customer_form">
		<h3 class="edit_title">Add Customer</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			
			
			<tr>
				<td>
					<p>Provider<text style="color:red">*</text></p>
				</td>
				<c:choose>
				<c:when test="${loggeduser=='ROLE_ADMIN'}">
				<td>
					<select id="add_customerProvider" class="testplan_select" onchange="getProviderResellers()">
						<option value="--select--">--select--</option>
					</select>
				</td>
				</c:when>
				<c:otherwise>
				<td>
				<select id="add_customerProvider" class="testplan_select" disabled>
				<c:forEach var="provider" items="${providerList}">
				<option value="${provider.id}">${provider.name}</option>
				</c:forEach>
				</select>
				<!-- </select>
				<select id="add_customerProvider" class="testplan_select" disabled>
						
					</select> -->
				</td>
				</c:otherwise>
				</c:choose>
			</tr>
			<%-- <c:if test="${userRole=='ROLE_ADMIN'}">
			<tr>
				<td>
					<p>Provider<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="add_customerProvider" class="testplan_select">
						<option value="--select--">--select--</option>
					</select>
				</td>
			</tr>
			</c:if> --%>
			<tr>
				<td>
					<p>Reseller</p>
				</td>
				
				<c:choose>
				<c:when test="${loggeduser!='ROLE_RESELLER_ADMIN'}">
				<td>
					<select id="add_customerReseller" class="testplan_select">
						<option value="--select--">--select--</option>
						<c:forEach var="reseller" items="${resellerList}">
							<option value="${reseller.id}">${reseller.name}</option>
						</c:forEach>
					</select>
				</td>
				</c:when>
				<c:otherwise>
				<td>
				<select id="add_customerReseller" class="testplan_select" disabled>
				<c:forEach var="reseller" items="${resellerList}">
				<option value="${reseller.id}">${reseller.name}</option>
				</c:forEach>
				</select>
				</td>
				</c:otherwise>
				
				</c:choose>
			</tr>
			
			<tr>
				<td>
					<p>Name<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_customerName" class="projectName" maxlength="100">
				</td>
			</tr>
			<tr>
				<td>
					<p>Address<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_customerAddress" class="projectName" maxlength="255">
				</td>
			</tr>

			<tr>
				<td>
					<p>City<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_customerCity" class="projectName" maxlength="50">
				</td>
			</tr>
			<tr>
				<td>
					<p>Zip code<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_customerZipcode" class="projectName" maxlength="12">
				</td>
			</tr>
			<tr>
				<td>
					<p>Country<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="add_customerCountry" class="testplan_select">
						<option value="--select--">--select--</option>
						<%@include file="countries.jsp" %>
					</select>
				</td>
			</tr>
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px" type="reset" class="add_cancel_button" data-dismiss="modal"></button>
					<div id="addCustomer" class="add_save_button"></div>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$("#addCustomer").click(function(){
		var resellerId = $("#add_customerReseller").val();
		var name = $("#add_customerName").val();
		var city = $("#add_customerCity").val();
		var zipCode = $("#add_customerZipcode").val();
		var country = $("#add_customerCountry").val();
		var address = $("#add_customerAddress").val();
		var providerId = $("#add_customerProvider").val();
		
		
		var specialChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
		for (var i = 0; i < specialChars.length; i++) {
		    if (city.indexOf(specialChars.charAt(i)) != -1) {
		    	/* Ticket: 353
				Desc: Typo in error message
				Fix: fixed the typo "charcters" to "characters"
				Author: Shveta */
		    	bootbox.alert("Sorry..! City should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    if (zipCode.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! Zip Code should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    
		}
		  
		var data = 	'providerId='+ encodeURIComponent($.trim(providerId))
					+'&&resellerId='+ encodeURIComponent($.trim(resellerId))
					+'&&name='+ encodeURIComponent($.trim(name))
					+'&&address='+ encodeURIComponent($.trim(address))
					+'&&zipCode='+ encodeURIComponent($.trim(zipCode))
					+'&&city='+ encodeURIComponent($.trim(city))
					+'&&country='+ encodeURIComponent($.trim(country));
					
		if (providerId.trim()=="" || providerId.trim()=="--select--") {
			bootbox.alert("Please specify the provider").find("div.modal-content").addClass("modalfailure");
		}
		else if (name.trim()=="") {
	    	bootbox.alert("Please specify the name").find("div.modal-content").addClass("modalfailure");
	    }else if (name.length > 100) {
	    	bootbox.alert("Sorry..! Name should not contain more than 100 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(address.trim()==""){
	    	bootbox.alert("Please specify the address").find("div.modal-content").addClass("modalfailure");
	    }else if (address.length > 255) {
	    	bootbox.alert("Sorry..! Address should not contain more than 255 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(city.trim()==""){
	    	bootbox.alert("Please specify the city").find("div.modal-content").addClass("modalfailure");
	    }else if (city.length > 50) {
	    	bootbox.alert("Sorry..! City should not contain more than 50 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(zipCode.trim()==""){
	    	bootbox.alert("Please specify the zip code").find("div.modal-content").addClass("modalfailure");
	    }else if (zipCode.length > 12) {
	    	bootbox.alert("Sorry..! Zip Code should not contain more than 12 characters").find("div.modal-content").addClass("modalfailure");
	    }else if(country.trim()=="" || country.trim()=="--select--"){
	    	/* Ticket: 362
			Desc: Currently allowing to save without the mandatory field Country
			Fix: The country value is now validated for '--select--' option as well
			Author: Shveta */ 
	    	bootbox.alert("Please specify the country").find("div.modal-content").addClass("modalfailure");
	    }else {

	    	bootbox.confirm({
				 buttons: {
				  		 confirm: {
				    		label: 'YES',
			        	},
				        cancel: {
				            label: 'NO',
				        }
				    },
					
			    message: 'Are you sure you want to add this customer?',
	
				callback: function(result) {
			    	if(result) {	
			    		  $.ajax({
							url : "customer/add",
							data : data,
							type : "POST",
				
							success : function(addCust) {
								if(addCust=="success"){
									bootbox.alert("Customer created successfully.",function(){window.location = "customer";
									}).find("div.modal-content").addClass("modalsuccess");
								}
								else{
									bootbox.alert(addCust).find("div.modal-content").addClass("modalfailure");
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
		$('#add_customer_form').trigger("reset");
	});
});

function getProviderResellers(){
	var provider = $('#add_customerProvider').val();
	// Ticket Id: 440
	// Desc: When selecting the drop down value error message throws as popup
	// Fix: removed the alert message
	// Author: Shveta Sharma
	$.ajax({
		url : "reseller/listByProvider",
		data : 'providerId='+ encodeURIComponent(provider),
		type : "POST",

		success : function(resellersList) {
			if(resellersList.length>0){
				
				 $('#add_customerReseller').empty();
				  $('#add_customerReseller').append($("<option name=\"reseller\"  value=\"--select--\">--select--</option>")); 
				for(var i=0;i<resellersList.length;i++){
					 $('#add_customerReseller').append($("<option name=\"reseller\"  value="+resellersList[i].id+
							 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:rgb(111,111,111);\">"+resellersList[i].name+"</option>"));
				}
			}else{
				
				 $('#add_customerReseller').empty();
				$('#add_customerReseller').append($("<option name=\"reseller\"  value=\"--select--\">--select--</option>"));
				
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
</script>
</html>