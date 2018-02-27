<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<head>
</head>
<body>
<h3 class="add_user_heading_text">Add User</h3>

<c:choose>
	<c:when test="${loggeduser=='ROLE_ADMIN' || loggeduser== 'ROLE_CUSTOMER_ADMIN'}">
		<form id="adduserform_id" method="post" style="margin-left: 30px " action="addUser"> 
			<input style="display:none;" type="text" name="somefakename" />
			<input disabled="disabled" style="display:none;" type="password" name="password" value="" />    
		
			<label class="add_user_label_text">Name</label>
		<!-- Ticket: 526
			Desc:   Name length is limited to 50 but if we try to enter a  string of 50 it shows the error that you cannot use more than 50.
			Fix: Name text box should accept the string of length 50.
			Author: Bala -->
					<input type="text" path="name" id="name" name="name" class="add_user_input_box" maxlength="50">
			
			<label class="add_user_label_text">Login ID</label>
			<input type="text" path="loginid" id="loginid" name="loginid" class="add_user_input_box" maxlength="30">
			
			<label class="add_user_label_text">Password</label>
			<!--  Ticket: 518
			Desc:  Password length is limited to 20 but if we try to enter a  string of 20 it shows the error that you cannot use more than 20.
			Fix: Password text box should accept the string of length 20.
			Author: Bala -->
					<input type="password" path="password" id="password" name="password" class="add_user_input_box" maxlength="20">
			
			
		<label class="add_user_label_text">User Type</label>
			<select path="userType" id="userType" name="userType" class="adduser_dropdown_box add_user_usertype" style="margin-right: 50px">
			<option>--select--</option>
				<c:forEach var="userType" items="${userTypeList}">
					<option name="userType"  value="${userType.id}"  style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
				</c:forEach>
			</select>
			<div id="ProviderDropdown" >
			<c:if test="${loggeduser=='ROLE_ADMIN'}">
			<label class="add_user_label_text">Provider</label>
			<select path="provider" id="providers" name="providers" class="adduser_dropdown_box providerClass" style="margin-right: 50px" onchange="getProviderResellers(),getProviderCustomers()">
			<option>--select--</option>
				<c:forEach var="provider" items="${providerList}">
					<option name="provider" id="${provider.id}"  value="${provider.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;" >${provider.name}</option>
				</c:forEach>
			</select>
			</c:if>
			<c:if test="${loggeduser!='ROLE_ADMIN'}">
			<label class="add_user_label_text">Provider</label>
			<select path="provider" id="providers" name="providers" class="adduser_dropdown_box providerClass" style="margin-right: 50px" onchange="getProviderResellers()">
				<option name="provider" id="${loggedInprovider.id}"  value="${loggedInprovider.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;" >${loggedInprovider.name}</option>
			</select>
			</c:if>
				</div>
				
				<!--  Ticket: 401
			Desc: Need provision to add users to reseller and should able to view the customers of the logged in reseller.
			Fix:Here drop down load the customers by reseller Id
			Author: Bala */--> 
				<div id="ResellerDropdown" >
			
			<c:if test="${loggeduser=='ROLE_ADMIN' || loggeduser=='ROLE_CUSTOMER_ADMIN'}">
			<label class="add_user_label_text">Reseller</label>
				<select path="reseller" id="reseller" name="reseller" class="adduser_dropdown_box resellerClass"  style="margin-right: 50px" onchange="getResellerCustomers()">
					<option>--select--</option>
					<c:forEach var="reseller" items="${resellerList}">
						<option name="reseller" id="${reseller.id}"  value="${reseller.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${reseller.name}</option>
					</c:forEach>
				</select>
			</c:if>
			<c:if test="${loggeduser!='ROLE_ADMIN' && loggeduser!='ROLE_CUSTOMER_ADMIN'}">
			<label class="add_user_label_text">Reseller</label>
				<select path="reseller" id="reseller" name="reseller" class="adduser_dropdown_box resellerClass" style="margin-right: 50px" onchange="getResellerCustomers()">
						<option name="reseller" id="${loggedInreseller.id}"  value="${loggedInreseller.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${loggedInreseller.name}</option>
				</select>
			</c:if> 
			</div>
			
				<!--   Ticket: 404
	Desc: Customer Drop down should show up while adding user of any role. The should not be hidden while adding Admin / Provider Users.
	Fix: Show up the customer drop down but it's disabled other then customer. 
	Author: Bala -->
			
			<div id="CustomerDropdown" style="margin-right: 50px">
			<c:if test="${loggeduser!='ROLE_CUSTOMER_ADMIN'}">
			<label class="add_user_label_text">Customer</label>
			
				<select path="customer" id="customer" name="customer" class="adduser_dropdown_box customerClass" style="margin-right: 50px">
				<option>--select--</option>
					<c:forEach var="customer" items="${customerList}">
						<option name="customer" id="${customer.id}"  value="${customer.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${customer.name}</option>
					</c:forEach>
				</select>
			 </c:if> 
			<c:if test="${loggeduser=='ROLE_CUSTOMER_ADMIN'}">
			<label class="add_user_label_text">Customer</label>
				<select path="customer" id="customer" name="customer" class="adduser_dropdown_box customerClass">
					
						<option name="customer" id="${loggedIncustomer.id}"  value="${loggedIncustomer.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${loggedIncustomer.name}</option>
					
				</select>
			</c:if> 
			</div>
			
			
			<!-- <div id="CustomerDropdown" style="margin-right: 50px"> -->
			<div id="emailNotification" style=" float: left;margin-left: 0px;margin-bottom: 20px;">
				<label class="add_user_label_text" >Email Notification</label>
				
				<input type="radio"   value="true"  id="emailNotificationFlag" name="emailNotificationFlag"  onclick="javascript:yesnoCheckForEmailNotification();" style="margin-left: 8px;margin: 9px;">Enable &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio"   value="false" id="emailNotificationFlag" name="emailNotificationFlag"  checked="checked" onclick="javascript:yesnoCheckForEmailNotification();"style="margin: 9px;">Disable	 
				</div>
				<div id="emailNotification" style=" float: left;margin-left: 0px;margin-bottom: 0px;">
				<label class="add_user_label_text" style="display: none;" id="add_email">Email</label>
			<!--   Ticket: 519
			Desc: There is no max limit given for the email Id.
			Fix: Email text box should accept the string of length 254.
			Author: Bala -->
					<input type="text" path="email" id="email" name="email" class="add_user_input_box" maxlength="254" style="display: none;" >
					</div>
				<div id="textAlert" style=" float: left;margin-right: 52px;">
				<label class="add_user_label_text" >Text Alert</label>
			
				 <input type="radio"   value="true"  id="textAlertFlag" name="textAlertFlag"  onclick="javascript:yesnoCheckForTextAlert();" style="margin-left: 8px;margin: 9px;">Enable &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio"   value="false" id="textAlertFlag" name="textAlertFlag"  checked="checked" onclick="javascript:yesnoCheckForTextAlert();" style="margin: 9px;">Disable	
					</div>
					<div id="emailNotification" style=" float: left;margin-left: 0px;margin-bottom: 0px;">
					<label class="add_user_label_text" id="mobile_number" style="display: none;">Mobile Number</label>
			<input type="text"  id="mobileNumber" name="mobileNumber" class="add_user_input_box mobileNumClass" maxlength="10" onkeypress="return AllowOnlyNumbers(event)" style="display: none;">
			<label class="add_user_label_text" id="carriers_type" style="display: none;">Carriers Type</label>
			<select  id="carriersType" name="carriersType" class="adduser_dropdown_box carriersTypeClass" style="margin-right: 50px;display: none;" >
			 <option>--select--</option>
				<c:forEach var="carriersType" items="${carriersTypeList}">
					<option  id="${carriersType.id}" value="${carriersType.id}"  style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${carriersType.name}</option>
				</c:forEach>
			</select>
			</div>
			<button style="left:282px;background-color: transparent;bottom: -20px;" type="reset" class="add_user_back_button" onClick="display_users()"></button>
			<input type="submit" class="add_user_save_button" value="" style="bottom: -20px;">
		</form>
	</c:when>
	<c:otherwise>
	<div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">User doesn't have access to add a user</div>
	</c:otherwise>
</c:choose>
			
</body>

<script>
	$('#adduserform_id').submit(
		function(event) {
			var name 					= $('#adduserform_id #name').val();
			var	loginid 				= $('#adduserform_id #loginid').val();
			var password 				= $('#adduserform_id #password').val();
			var email 					= $('#adduserform_id #email').val();
			var userType 				= $('#adduserform_id #userType').val();
			var provider 				= $('#adduserform_id .providerClass').val();
			var customer 				= $('#adduserform_id .customerClass').val();
			var reseller 				= $('#adduserform_id .resellerClass').val();
			var mobileNumber 			= $('#adduserform_id .mobileNumClass').val();
			var carriersTypeId 			= $('#adduserform_id .carriersTypeClass').val();
			var emailnotificationflag 	= $('input:radio[name=emailNotificationFlag]:checked').val();
			var textAlertflag 			= $('input:radio[name=textAlertFlag]:checked').val();
			
		    try {
	      		var filter = new RegExp("^[_A-Za-z0-9~!$%^&*-+}{\'?=]+(\\.[_A-Za-z0-9~!$%^&*-+}{\'?=]+)*@"+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,4})$");
	   		} catch(e) {
	    		bootbox.alert("Unknown error while validating email address. Try again later...").find("div.modal-content").addClass("modalfailure");
	        	return false;
	    	}		
			
			var data = 'name='
						+ encodeURIComponent(name)
						+ '&loginId='
						+ encodeURIComponent(loginid)
						+ '&password='
						+ encodeURIComponent(password)
						+ '&email='
						+ encodeURIComponent(email)
						+ '&userTypeId='
						+ encodeURIComponent(userType)
						+ '&providerId='
						+ encodeURIComponent(provider)
						+ '&customerId='
						+ encodeURIComponent(customer)
						+ '&resellerId='
						+ encodeURIComponent(reseller)
						+ '&mobileNumber='
						+ encodeURIComponent(mobileNumber)
						+ '&carriersTypeId='
						+ encodeURIComponent(carriersTypeId)
						+ '&emailnotificationflag='
						+ encodeURIComponent(emailnotificationflag)
						+ '&textAlertflag='
						+ encodeURIComponent(textAlertflag);

			if (name.trim().length >50) {
		    	bootbox.alert("Name cannot exceed 50 characters").find("div.modal-content").addClass("modalfailure");
		    	return false;
		    }
			/* Ticket: 527
			Desc:  Now the name should be displayed T with 5 white spaces but it is not, it will display the name as T.
			Fix: While checking length before trim the name.
			Author: Bala */
			if(name.trim().length <4){
				bootbox.alert("Name cannot be less than 4 characters").find("div.modal-content").addClass("modalfailure");
				return false;
			}
			/* Ticket: 525
			Desc:  Now the loginid should be displayed T with 5 white spaces but it is not, it will display the loginid as T.
			Fix: While checking length before trim the loginid.
			Author: Bala */
			if(loginid.trim().length>30){
		    	bootbox.alert("Login ID cannot exceed 30 characters").find("div.modal-content").addClass("modalfailure");
		    	return false;
			}
		    if(loginid.trim().length<4){
		    	bootbox.alert("Login ID cannot be less than 4 characters").find("div.modal-content").addClass("modalfailure");
		    	return false;
			}
		    if(password.trim().length<4){
		    	bootbox.alert("Password length cannot be less than 4 characters").find("div.modal-content").addClass("modalfailure");
		    	return false;
			}
		    
		    if(password.trim().length>20){
		    	bootbox.alert("Password cannot exceed 20 characters").find("div.modal-content").addClass("modalfailure");
		    	return false;
			}
		   
		   
		    if($(".add_user_usertype option:selected").text() == 'ROLE_PROVIDER_ADMIN' || $(".add_user_usertype option:selected").text() == 'ROLE_PROVIDER_USER' || $(".add_user_usertype option:selected").text() == 'ROLE_RESELLER_ADMIN' 
				||  $(".add_user_usertype option:selected").text() == 'ROLE_RESELLER_USER' || $(".add_user_usertype option:selected").text() == 'ROLE_CUSTOMER_ADMIN' || $(".add_user_usertype option:selected").text() == 'ROLE_CUSTOMER_USER') {
			if(provider=="" || provider=="--select--"){ 
		    	bootbox.alert("Please select the provider")
				.find("div.modal-content").addClass("modalfailure");
		    	return false;
			} 
		    }
		    if($(".add_user_usertype option:selected").text() == 'ROLE_RESELLER_ADMIN' 
				||  $(".add_user_usertype option:selected").text() == 'ROLE_RESELLER_USER') {
			if(reseller=="" || reseller=="--select--"){
		    	bootbox.alert("No Reseller Available for this Provider. Change the Provider or User Type to Continue.")
				.find("div.modal-content").addClass("modalfailure");
		    	return false;
			} 
		    }
		    if($(".add_user_usertype option:selected").text() == 'ROLE_CUSTOMER_ADMIN' 
					||  $(".add_user_usertype option:selected").text() == 'ROLE_CUSTOMER_USER') {
				if(customer=="" || customer=="--select--"){
			    	bootbox.alert("No Customers Available for this Provider. Change the Provider or User Type to Continue.")
					.find("div.modal-content").addClass("modalfailure");
			    	return false;
				}
		    }
 			if(emailnotificationflag=="true"){
		    	
			    if(!filter.test(email)) {
			    	bootbox.alert("Enter a valid email address").find("div.modal-content").addClass("modalfailure");
			    	return false;
				}
			    if(email.trim().length>254){
			    	bootbox.alert("Email address length cannot be less than 254 characters").find("div.modal-content").addClass("modalfailure");
			    	return false;
				}
		    }else if(emailnotificationflag=="false"){
		    	
		    }else{
		    	bootbox.alert("Please select email notification").find("div.modal-content").addClass("modalfailure");
		    	return false;	
		    }
		    if(textAlertflag=="true"){
			    if( mobileNumber == ""){
			    	bootbox.alert("Please specify mobile number.")
					.find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
			    var mobRegexp = /^[1-9]{1}[0-9]{9}$/;
				if (!mobRegexp.test(mobileNumber.trim())){
			    	bootbox.alert("Please specify mobile number.").find("div.modal-content").addClass("modalfailure");
			    	return false;	
				}
			    if( carriersTypeId == "" || carriersTypeId =="--select--"){
			    	bootbox.alert("Please select Carriers Type")
					.find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
		    }else if(textAlertflag=="false"){
		    	
		    }else{
		    	bootbox.alert("Please select text alert").find("div.modal-content").addClass("modalfailure");
		    	return false;	
		    }

		    $.ajax({
				url : $("#adduserform_id").attr("action"),
				data : data,
				type : "POST",
 
				success : function(adduser_response) {
					if(adduser_response=="success"){ 
						bootbox.alert("New User Added Successfully").find("div.modal-content").addClass("modalsuccess");
						display_users();
					}
					else {
						 bootbox.alert(adduser_response).find("div.modal-content").addClass("modalfailure");
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
	
	
	$('.add_user_usertype').change(function() {
		if($(".add_user_usertype option:selected").text() == 'ROLE_ADMIN') {
			getProviders();
    	 $('#providers').prop('disabled', true); 
    	
    } 
		  else{
			  if(${loggeduser=='ROLE_ADMIN'}){
			  getProviders();
		  }
			  $('#providers').prop('disabled', false); 
			 
		  }
	});
	$('.add_user_usertype').change(function() {
		if($(".add_user_usertype option:selected").text() != 'ROLE_CUSTOMER_ADMIN' 
			&& $(".add_user_usertype option:selected").text() != 'ROLE_CUSTOMER_USER') {
			
			if(${loggeduser!='ROLE_CUSTOMER_ADMIN'}){
			getProviderCustomers();
			getResellerCustomers();
			}
			
			 $('#customer').prop('disabled', true); 
	    }else{
	    	if(${loggeduser!='ROLE_CUSTOMER_ADMIN'}){
				getProviderCustomers();
				getResellerCustomers();
				}
	    
	    	$('#customer').prop('disabled', false); 
	    }
	});
	
	$('.add_user_usertype').change(function() {
		if($(".add_user_usertype option:selected").text() == 'ROLE_ADMIN' 
			||  $(".add_user_usertype option:selected").text() == 'ROLE_PROVIDER_ADMIN' || $(".add_user_usertype option:selected").text() == 'ROLE_PROVIDER_USER') {
			 
			if(${loggeduser!='ROLE_RESELLER_ADMIN' && loggeduser!='ROLE_CUSTOMER_ADMIN'}){
			getProviderResellers();
			 }
    	 $('#reseller').prop('disabled', true); 
    } 
		  else{
			 if(${loggeduser!='ROLE_RESELLER_ADMIN' && loggeduser!='ROLE_CUSTOMER_ADMIN'}){
					getProviderResellers();
			 }	
			 
			  $('#reseller').prop('disabled', false); 
			 
		  }
	}); 
	
	/* Ticket: 401
	Desc: Need provision to add users to reseller and should able to view the customers of the logged in reseller.
	Fix:Here drop down load the customers by reseller Id
	Author: Bala */
	function getResellerCustomers(){
		var reseller = $('#adduserform_id .resellerClass').val();
		$.ajax({
			url : "customer/listByReseller",
			data : 'resellerId='+ encodeURIComponent(reseller),
			type : "POST",

			success : function(customersList) { 
				if(customersList.length>0){
					$('#CustomerDropdown #customer').empty();
					 $('#CustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					for(var i=0;i<customersList.length;i++){
						 $('#CustomerDropdown #customer').append($("<option name=\"customer\"  value="+customersList[i].id+
								 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;\">"+customersList[i].name+"</option>"));
					}
				}else{
					$('#CustomerDropdown #customer').empty();
					 $('#CustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					 getProviderCustomers();
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
	
	
	
	function getProviders(){
		var userType = $(".add_user_usertype option:selected").text();
		$.ajax({
			url : "provider/listByProvider",
			data : 'userType='+ encodeURIComponent(userType),
			type : "POST",

			success : function(providersList) {
				if(providersList.length>0){
					$('#ProviderDropdown #providers').empty();
					if(userType!='ROLE_ADMIN'){
					 $('#ProviderDropdown #providers').append($("<option name=\"provider\"  value=\"--select--\">--select--</option>"));  
					}
					for(var i=0;i<providersList.length;i++){
						 $('#ProviderDropdown #providers').append($("<option name=\"provider\"  value="+providersList[i].id+
								 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;\">"+providersList[i].name+"</option>"));
					}
				}else{
					$('#ProviderDropdown #providers').empty();
					/*  $('#CustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>"));  */
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
	
	
	function getProviderCustomers(){
		var provider = $('#adduserform_id .providerClass').val();
		
		$.ajax({
			url : "customer/listByProvider",
			data : 'providerId='+ encodeURIComponent(provider),
			type : "POST",

			success : function(customersList) {
				if(customersList.length>0){
					$('#CustomerDropdown #customer').empty();
					 $('#CustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					for(var i=0;i<customersList.length;i++){
						 $('#CustomerDropdown #customer').append($("<option name=\"customer\"  value="+customersList[i].id+
								 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;\">"+customersList[i].name+"</option>"));
					}
				}else{
					
					$('#CustomerDropdown #customer').empty();
					 $('#CustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					
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
	
	function getProviderResellers(){
		var provider = $('#adduserform_id .providerClass').val();
		
		$.ajax({
			url : "reseller/listByProvider",
			data : 'providerId='+ encodeURIComponent(provider),
			type : "POST",

			success : function(resellersList) {
				if(resellersList.length>0){
					
					 $('#ResellerDropdown #reseller').empty();
					  $('#ResellerDropdown #reseller').append($("<option name=\"reseller\"  value=\"--select--\">--select--</option>")); 
					for(var i=0;i<resellersList.length;i++){
						 $('#ResellerDropdown #reseller').append($("<option name=\"reseller\"  value="+resellersList[i].id+
								 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;\">"+resellersList[i].name+"</option>"));
					}
				}else{
					
					 $('#ResellerDropdown #reseller').empty();
					$('#ResellerDropdown #reseller').append($("<option name=\"reseller\"  value=\"--select--\">--select--</option>"));
					
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
	
	function AllowOnlyNumbers(e) {

	    e = (e) ? e : window.event;
	    var key = null;
	    var charsKeys = [
	        97, // a  Ctrl + a Select All
	        65, // A Ctrl + A Select All
	        99, // c Ctrl + c Copy
	        67, // C Ctrl + C Copy
	        118, // v Ctrl + v paste
	        86, // V Ctrl + V paste
	        115, // s Ctrl + s save
	        83, // S Ctrl + S save
	        112, // p Ctrl + p print
	        80 // P Ctrl + P print
	    ];

	    var specialKeys = [
	    8, // backspace
	    9, // tab
	    27, // escape
	    13, // enter
	    35, // Home & shiftKey +  #
	    36, // End & shiftKey + $
	    37, // left arrow &  shiftKey + %
	    39, //right arrow & '
	    46, // delete & .
	    45 //Ins &  -
	    ];

	    key = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;

	    // check if pressed key is not number 
	    if (key && key < 48 || key > 57) {

	        //Allow: Ctrl + char for action save, print, copy, ...etc
	        if ((e.ctrlKey && charsKeys.indexOf(key) != -1) ||
	            (navigator.userAgent.indexOf("Firefox") != -1 && ((e.ctrlKey && e.keyCode && e.keyCode > 0 && key >= 112 && key <= 123) || (e.keyCode && e.keyCode > 0 && key && key >= 112 && key <= 123)))) {
	            return true
	        }
	            // Allow: Special Keys
	        else if (specialKeys.indexOf(key) != -1) {
	            
	            if ((key == 39 || key == 45 || key == 46)) {
	                return (navigator.userAgent.indexOf("Firefox") != -1 && e.keyCode != undefined && e.keyCode > 0);
	            }
	                //DisAllow : "#" & "$" & "%"
	            else if (e.shiftKey && (key == 35 || key == 36 || key == 37)) {
	                return false;
	            }
	            else {
	                return true;
	            }
	        }
	        else {
	            return false;
	        }
	    }
	    else {
	        return true;
	       }
	    } 
	
	function yesnoCheckForEmailNotification() {
		
	var emailnotificationflag 	= $('input:radio[name=emailNotificationFlag]:checked').val();
	if (emailnotificationflag=="true") {
        document.getElementById('add_email').style.display = 'block';
        document.getElementById('email').style.display = 'block';
    } else{
	 document.getElementById('add_email').style.display = 'none';
     document.getElementById('email').style.display = 'none';
    }
	}
	
	function yesnoCheckForTextAlert() {
		
		var textAlert 	= $('input:radio[name=textAlertFlag]:checked').val();
		if (textAlert=="true") {
	        document.getElementById('mobile_number').style.display = 'block';
	        document.getElementById('mobileNumber').style.display = 'block';
	        document.getElementById('carriers_type').style.display = 'block';
		     document.getElementById('carriersType').style.display = 'block';
	    } else{
	   	 document.getElementById('mobile_number').style.display = 'none';
		 document.getElementById('mobileNumber').style.display = 'none';
		 document.getElementById('carriers_type').style.display = 'none';
	     document.getElementById('carriersType').style.display = 'none';
	    }
		}
</script>