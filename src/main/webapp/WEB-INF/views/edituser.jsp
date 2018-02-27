<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link rel="stylesheet" href="<c:url value="/resources/css/edituser.css"/>"/>

<h3 class="edit_user_heading_text">Edit User</h3>
			
		<form id="edit_user_form_id" method="post" style="margin-left: 30px " action="updateUser"> 
			<input style="display:none;" type="text" name="somefakename" />
			<input disabled="disabled" style="display:none;" type="password" name="password" value="" />    					
		
			<label class="edit_user_label_text">Name</label>
					<input type="text" path="name" id="name" name="name" class="edit_user_input_box edit_user_name" value="${user_to_edit.name }" maxlength="50">
			
			<label class="edit_user_label_text">Login ID</label>
					<input type="text" id="edituser_loginID_id" name="edituser_loginID_name" class="edit_user_input_box" disabled value="${user_to_edit.loginId }" maxlength="30">
			
			<label class="edit_user_label_text">Change Password</label>
					<input type="password" id="password" name="password" class="edit_user_pswd edit_user_input_box" placeholder="New Password" maxlength="20">
					
			
			<label class="edit_user_label_text">User Type</label>
			<c:choose>
				<c:when test="${user_logged.usertype.name=='ROLE_ADMIN'}">
					<c:choose>
						<c:when test="${user_to_edit.usertype.name=='ROLE_ADMIN'}">
							<select path="userType" id="userType" style="margin-right: 45px" name="userType" class="edituser_dropdown_box edit_user_usertype" disabled>
								<option class="usertype" id="${user_to_edit.usertype.name}" name="${user_to_edit.usertype.name}"  value="${user_to_edit.usertype.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${user_to_edit.usertype.name}</option>
							</select>
						</c:when>
						<c:otherwise>
							<select path="userType" style="margin-right: 45px" id="userType" name="userType" class="edituser_dropdown_box edit_user_usertype">
								<c:forEach var="userType" items="${userTypeList}">
									<c:choose>
										<c:when test="${userType.name==user_to_edit.usertype.name}">
											<option selected="selected" class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:when>
										<c:otherwise>
											<option class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${user_logged.usertype.name=='ROLE_PROVIDER_ADMIN'}">
				<c:choose>
						<c:when test="${user_to_edit.usertype.name=='ROLE_PROVIDER_ADMIN'}">
							<select path="userType" id="userType" style="margin-right: 45px" name="userType" class="edituser_dropdown_box edit_user_usertype" disabled>
								<option class="usertype" id="${user_to_edit.usertype.name}" name="${user_to_edit.usertype.name}"  value="${user_to_edit.usertype.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${user_to_edit.usertype.name}</option>
							</select>
						</c:when>
						<c:otherwise>
							<select path="userType" style="margin-right: 45px" id="userType" name="userType" class="edituser_dropdown_box edit_user_usertype">
								<c:forEach var="userType" items="${userTypeList}">
									<c:choose>
										<c:when test="${userType.name==user_to_edit.usertype.name}">
											<option selected="selected" class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:when>
										<c:otherwise>
											<option class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
				</c:when>
				
				<c:when test="${user_logged.usertype.name=='ROLE_RESELLER_ADMIN'}">
				<c:choose>
						<c:when test="${user_to_edit.usertype.name=='ROLE_RESELLER_ADMIN'}">
							<select path="userType" id="userType" style="margin-right: 45px" name="userType" class="edituser_dropdown_box edit_user_usertype" disabled>
								<option class="usertype" id="${user_to_edit.usertype.name}" name="${user_to_edit.usertype.name}"  value="${user_to_edit.usertype.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${user_to_edit.usertype.name}</option>
							</select>
						</c:when>
						<c:otherwise>
							<select path="userType" style="margin-right: 45px" id="userType" name="userType" class="edituser_dropdown_box edit_user_usertype">
								<c:forEach var="userType" items="${userTypeList}">
									<c:choose>
										<c:when test="${userType.name==user_to_edit.usertype.name}">
											<option selected="selected" class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:when>
										<c:otherwise>
											<option class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<!--<c:choose>
						<c:when test="${user_to_edit.usertype.name == 'ROLE_ADMIN' || user_to_edit.usertype.name == 'ROLE_CUSTOMER_ADMIN'} ">
							<select path="userType" id="userType" name="userType" class="edituser_dropdown_box" disabled>
								<option class="usertype" id="${user_to_edit.usertype.name}" name="${user_to_edit.usertype.name}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${user_to_edit.usertype.name}</option>
							</select>
						</c:when>
						<c:otherwise>-->
 							<select path="userType" style="margin-right: 45px" id="userType" name="userType" class="edituser_dropdown_box edit_user_usertype"
 							${user_to_edit.usertype.name == 'ROLE_ADMIN' || user_to_edit.usertype.name == 'ROLE_PROVIDER_ADMIN' || user_to_edit.usertype.name == 'ROLE_RESELLER_ADMIN'? 'disabled=true' : ''}>
								<c:forEach var="userType" items="${userTypeList}">
									<c:choose>
										<c:when test="${userType.name==user_to_edit.usertype.name}">
											<option selected="selected" class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:when>
										<c:otherwise>
											<option class="usertype" id="${userType.name}" name="${userType.name}" value="${userType.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${userType.name}</option>
										</c:otherwise>
									</c:choose>	
								</c:forEach>
							</select>
						<!--</c:otherwise>
					</c:choose>-->
				</c:otherwise>
				</c:choose>
			<div id="EditProviderDropdown" >
			<label class="edit_user_label_text">Provider</label>
			<select path="provider" id="providers" name="providers" class="adduser_dropdown_box providerClass" style="margin-right: 50px"
			${user_logged.usertype.name!='ROLE_ADMIN' || user_to_edit.usertype.name=='ROLE_ADMIN'? 'disabled=true' : ''} onchange="getProviderResellersForEditUser(),getProviderCustomersForEditUser()">
				<c:forEach var="provider" items="${providerList}">
					<c:choose>
						<c:when test="${provider.name==user_to_edit.provider.name}">
							<option name="provider" selected="selected" id="${provider.id}"  value="${provider.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${provider.name}</option>
						</c:when>
						<c:otherwise>
							<option name="provider" id="${provider.id}"  value="${provider.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${provider.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			</div>
			<!--   Ticket: 401
	Desc: Need provision to add users to reseller and should able to view the customers of the logged in reseller.
	Fix:Here drop down load the customers by reseller Id
	Author: Bala -->
					<div id="EditResellerDropdown" >
			<label class="edit_user_label_text">Reseller</label>
			
				<select path="reseller" id="reseller" name="reseller" class="adduser_dropdown_box resellerClass" style="margin-right: 50px"
			${ user_logged.usertype.name=='ROLE_RESELLER_ADMIN'  || user_logged.usertype.name=='ROLE_CUSTOMER_ADMIN'|| user_to_edit.usertype.name=='ROLE_PROVIDER_ADMIN' || user_to_edit.usertype.name=='ROLE_PROVIDER_USER'||user_to_edit.usertype.name=='ROLE_ADMIN'? 'disabled=true' : ''} onchange="getResellerCustomersForEditUser()">
			<option>--select--</option>
			<c:forEach var="reseller" items="${resellerList}">
			<c:choose>
						<c:when test="${reseller.name==user_to_edit.reseller.name}">
							<option name="reseller" id="${reseller.id}" selected="selected" value="${reseller.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${reseller.name}</option>
						</c:when>
						<c:otherwise>
							<option name="reseller" id="${reseller.id}"  value="${reseller.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${reseller.name}</option>
						</c:otherwise>
					</c:choose>
					<%-- <c:forEach var="reseller" items="${resellerList}">
						<option name="reseller" id="${reseller.id}"  value="${reseller.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${reseller.name}</option> --%>
					</c:forEach>
				</select>
		
		
			</div>
			
			<!--   Ticket: 404
	Desc: Customer Drop down should show up while adding user of any role. The should not be hidden while adding Admin / Provider Users.
	Fix: Show up the customer drop down but it's disabled other then customer. 
	Author: Bala -->
			<div id="EditCustomerDropdown" >
			<label class="edit_user_label_text">Customer</label>
			<select path="customer" id="customer" name="customer" class="adduser_dropdown_box customerClass" style="margin-right: 50px"
			${ user_logged.usertype.name=='ROLE_CUSTOMER_ADMIN' || user_to_edit.usertype.name=='ROLE_RESELLER_ADMIN' || user_to_edit.usertype.name=='ROLE_RESELLER_USER'|| user_to_edit.usertype.name=='ROLE_PROVIDER_ADMIN' || user_to_edit.usertype.name=='ROLE_PROVIDER_USER'||user_to_edit.usertype.name=='ROLE_ADMIN' ? 'disabled=true' : ''}>
			<option>--select--</option>
				<c:forEach var="customer" items="${customerList}">
					<c:choose>
						<c:when test="${customer.name==user_to_edit.customer.name}">
							<option name="customer" selected="selected" id="${customer.id}"  value="${customer.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${customer.name}</option>
						</c:when>
						<c:otherwise>
							<option name="customer" id="${customer.id}"  value="${customer.id}" style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${customer.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			</div>
				
				
			<div id="edit_emailNotification" style=" float: left;margin-left: 0px;margin-bottom: 0px;">
				<label class="edit_user_label_text" style="width:180px;margin-bottom: 11px; ">Email Notification</label>
				<input type="radio"   <c:if test="${user_to_edit.emailnotification eq 'true'}">checked</c:if> value="true"  id="edit_emailNotificationFlag" name="edit_emailNotificationFlag"  onclick="javascript:yesnoCheckForEmailNotification();" style="margin: 9px;">Enable &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio"   <c:if test="${user_to_edit.emailnotification eq 'false'}">checked</c:if> value="false" id="edit_emailNotificationFlag" name="edit_emailNotificationFlag"  onclick="javascript:yesnoCheckForEmailNotification();" style="margin: 9px;">Disable	
					</div>
					<div id="edit_email_notification" style=" float: left;margin-left: 0px;margin-bottom: 0px;">
					<c:if test="${user_to_edit.emailnotification eq 'true'}">
			<label class="edit_user_label_text" id="edituser_email">Email</label>
			<input type="text" id="edituser_email_id" name="edituser_email_name" class="edit_user_input_box edituser_email_id" value="${user_to_edit.email }" maxlength="254" >
			</c:if>
			<c:if test="${user_to_edit.emailnotification ne 'true'}">
			<label class="edit_user_label_text" id="edituser_email" style="display:none;">Email</label>
			<input type="text" id="edituser_email_id" name="edituser_email_name" class="edit_user_input_box edituser_email_id" value="${user_to_edit.email }" maxlength="254" style="display:none;">
			</c:if>
			</div>
				<div id="edit_textAlert" style="float: left;margin-right: 52px">
				<label class="add_user_label_text" >Text Alert</label>
			
				 <input type="radio"   <c:if test="${user_to_edit.textAlert eq 'true'}">checked</c:if> value="true"  id="edit_textAlertFlag" name="edit_textAlertFlag"  onclick="javascript:yesnoCheckForTextAlert();" style="margin: 9px;">Enable &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio"   <c:if test="${user_to_edit.textAlert eq 'false'}">checked</c:if> value="false" id="edit_textAlertFlag" name="edit_textAlertFlag"   onclick="javascript:yesnoCheckForTextAlert();" style="margin: 9px;">Disable	
					</div>	
					<div id="edit_text_alert" style=" float: left;margin-left: 0px;margin-bottom: 0px;">
					<c:if test="${user_to_edit.textAlert eq 'true'}">	
			<label class="edit_user_label_text" id="edit_mobile_number">Mobile Number</label>
			<input type="text"  id="edit_mobileNumber" name="edit_mobileNumber" class="edit_user_input_box mobileNumClass" value="${user_to_edit.mobileNumber}" maxlength="10" onkeypress="return AllowOnlyNumbers(event)">
			<label class="edit_user_label_text" id="edit_carriersType">Carriers Type</label>
			<select id="carriersType" name="carriersType" class="adduser_dropdown_box carriersTypeClass" style="margin-right: 50px">
			    <option>--select--</option>
				<c:forEach var="carriersType" items="${carriersTypeList}">
				<c:choose>
				   <c:when test="${carriersType.id==user_to_edit.carriersType.id}">
					   <option  selected="selected" id="${carriersType.id}"  value="${carriersType.id}"  style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${carriersType.name}</option>
					</c:when>
					<c:otherwise>
					<option  id="${carriersType.id}"  value="${carriersType.id}"  style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${carriersType.name}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</c:if>
				<c:if test="${user_to_edit.textAlert ne 'true'}">	
			<label class="edit_user_label_text" id="edit_mobile_number" style="display: none;">Mobile Number</label>
			<input type="text"  id="edit_mobileNumber" name="edit_mobileNumber" class="edit_user_input_box mobileNumClass" value="${user_to_edit.mobileNumber}" maxlength="10" onkeypress="return AllowOnlyNumbers(event)" style="display: none;">
			<label class="edit_user_label_text" id="edit_carriersType" style="display: none;">Carriers Type</label>
			<select id="carriersType" name="carriersType" class="adduser_dropdown_box carriersTypeClass" style="margin-right: 50px;display: none;">
			    <option>--select--</option>
				<c:forEach var="carriersType" items="${carriersTypeList}">
				<c:choose>
				   <c:when test="${carriersType.id==user_to_edit.carriersType.id}">
					   <option  selected="selected" id="${carriersType.id}"  value="${carriersType.id}"  style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${carriersType.name}</option>
					</c:when>
					<c:otherwise>
					<option  id="${carriersType.id}"  value="${carriersType.id}"  style="font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;">${carriersType.name}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</c:if>
			</div>	
			<input type="hidden" id="id" path="id" name="id" value="${user_to_edit.id}"/>
			<button style="left:282px;background-color: transparent; bottom: -20px;" type="reset" class="edit_user_back_button" onclick=" display_users()"></button>
			<!-- <input type="submit"  class="edit_user_save_button" value="" style="bottom: -20px;"> -->
			<input type="button" id="edit_user_submit"  class="edit_user_save_button" value="" style="bottom: -20px;">
		</form>

<script>

	$('#edit_user_submit').click(function(){
				
			var name 					= $('.edit_user_name').val();
			var userType 				= $('.edituser_dropdown_box').val();
			var id 						= $('#id').val();
			var pswd 					= $('.edit_user_pswd').val();
			var provider 				= $('#edit_user_form_id .providerClass').val();
			var customer 				= $('#edit_user_form_id .customerClass').val();
			var reseller 				= $('#edit_user_form_id .resellerClass').val();
			var mobileNumber 			= $('#edit_user_form_id .mobileNumClass').val();
			var carriersTypeId 			= $('#edit_user_form_id .carriersTypeClass').val();
			var emailAddress 			= $('#edit_user_form_id .edituser_email_id').val();
			var emailnotificationflag 	= $('input:radio[name=edit_emailNotificationFlag]:checked').val();	
			var textAlertflag 			= $('input:radio[name=edit_textAlertFlag]:checked').val();
			var data = 'name='
					+ encodeURIComponent(name)
					+ '&id='
					+ encodeURIComponent(id)
					+ '&userType='
					+ encodeURIComponent(userType)
					+ '&providerId='
					+ encodeURIComponent(provider)
					+ '&password='
					+ encodeURIComponent(pswd)
					+ '&customerId='
					+ encodeURIComponent(customer)
					+ '&resellerId='
					+ encodeURIComponent(reseller)
					+ '&mobileNumber='
					+ encodeURIComponent(mobileNumber)
					+ '&carriersTypeId='
					+ encodeURIComponent(carriersTypeId)
					+ '&emailAddress='
					+ encodeURIComponent(emailAddress)
					+ '&emailnotificationflag='
					+ encodeURIComponent(emailnotificationflag)
					+ '&textAlert='
					+ encodeURIComponent(textAlertflag);
			if (name.length >50) {
		    	bootbox.alert("Name cannot exceed 50 characters").find("div.modal-content").addClass("modalfailure");
		    	return false;
		    }
			if (name.length <4) {
		    	bootbox.alert("Name cannot be less than 4 characters").find("div.modal-content").addClass("modalfailure");
		    	return false;
		    }
			
			if($(".edit_user_usertype option:selected").text() == 'ROLE_CUSTOMER_ADMIN' 
					||  $(".edit_user_usertype option:selected").text() == 'ROLE_CUSTOMER_USER') {
				if(customer==""){
			    	bootbox.alert("No Customers Available for this Provider. Change the Provider or User Type to Continue.")
					.find("div.modal-content").addClass("modalfailure");
			    	return false;
				}
		    }
			if(emailnotificationflag=="true"){
				if(emailAddress.trim()== ""){
			    	bootbox.alert("Please specify the email address").find("div.modal-content").addClass("modalfailure");
			    	return false;
				}
			  	if(emailAddress.trim().length>254){
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
			    	bootbox.alert("Please specify the mobile number.")
					.find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
				
				var mobRegexp = /^[1-9]{1}[0-9]{9}$/;
				if (!mobRegexp.test(mobileNumber.trim())){
			    	bootbox.alert("Please enter a valid Mobile Number").find("div.modal-content").addClass("modalfailure");
			    	return false;	
			    }
				
				if( carriersTypeId == "" || carriersTypeId =="--select--"){
			    	bootbox.alert("Please select the Carriers Type")
					.find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
			}else if(textAlertflag=="false"){
		    	
		    }else{
		    	bootbox.alert("Please select text alert").find("div.modal-content").addClass("modalfailure");
		    	return false;	
		    }
			
			$.ajax({
				url : $("#edit_user_form_id").attr("action"),
				data : data,
				type : "POST",
 
				success : function(edituser_response) {
					if(edituser_response=="success"){ 
						bootbox.alert("Successfully Edited User details").find("div.modal-content").addClass("modalsuccess");
						display_users();
					}
					else{
						bootbox.alert(edituser_response).find("div.modal-content").addClass("modalfailure");
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
	});

	$('.edit_user_usertype').change(function() {
		if($(".edit_user_usertype option:selected").text() == 'ROLE_ADMIN') {
			getProviders();
    	 	$('#providers').prop('disabled', true); 
    	}else{
			  if(${user_logged.usertype.name=='ROLE_ADMIN'}) {
				  getProviders();
				  $('#providers').prop('disabled', false); 
			  }
		}
	});
	
	
	$('.edit_user_usertype').change(function() {
		if($(".edit_user_usertype option:selected").text() != 'ROLE_CUSTOMER_ADMIN' 
			&& $(".edit_user_usertype option:selected").text() != 'ROLE_CUSTOMER_USER') {
			
			if(${user_logged.usertype.name!='ROLE_RESELLER_ADMIN' && user_logged.usertype.name!='ROLE_CUSTOMER_ADMIN'}){
			getProviderCustomersForEditUser();
			getProviderResellersForEditUser();
			}
			 $('#customer').prop('disabled', true); 
	    }else{
	    	
	    	if(${user_logged.usertype.name!='ROLE_RESELLER_ADMIN' && user_logged.usertype.name!='ROLE_CUSTOMER_ADMIN'}){
				getProviderResellersForEditUser();
				getProviderCustomersForEditUser();
			}
	    	$('#customer').prop('disabled', false); 
	    }
	});
	
	$('.edit_user_usertype').change(function() {
		if($(".edit_user_usertype option:selected").text() == 'ROLE_ADMIN' 
			||  $(".edit_user_usertype option:selected").text() == 'ROLE_PROVIDER_ADMIN' || $(".add_user_usertype option:selected").text() == 'ROLE_PROVIDER_USER') {
			getResellerCustomersForEditUser();
			$('#reseller').prop('disabled', true); 
    	
		}else{
			  getResellerCustomersForEditUser();
			  if(${user_logged.usertype.name=='ROLE_RESELLER_ADMIN' || user_logged.usertype.name=='ROLE_CUSTOMER_ADMIN' }){
				  $('#reseller').prop('disabled', true); 
			  } else{
				  $('#reseller').prop('disabled', false); 
			  }
		 }
	}); 
	
	
	
	/* Ticket: 401
	Desc: Need provision to add users to reseller and should able to view the customers of the logged in reseller.
	Fix:Here drop down load the customers by reseller Id
	Author: Bala */
	function getResellerCustomersForEditUser(){
		var reseller = $('#edit_user_form_id .resellerClass').val();
		$.ajax({
			url : "customer/listByReseller",
			data : 'resellerId='+ encodeURIComponent(reseller),
			type : "POST",

			success : function(customersList) {
				if(customersList.length>0){
					
					$('#EditCustomerDropdown #customer').empty();
					 $('#EditCustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					
					for(var i=0;i<customersList.length;i++){
						 $('#EditCustomerDropdown #customer').append($("<option name=\"customer\"  value="+customersList[i].id+
								 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;\">"+customersList[i].name+"</option>"));
					}
				}else{
					
					$('#EditCustomerDropdown #customer').empty();
					getProviderCustomersForEditUser();
					 $('#EditCustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					
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
		var userType = $(".edit_user_usertype option:selected").text();
		$.ajax({
			url : "provider/listByProvider",
			data : 'userType='+ encodeURIComponent(userType),
			type : "POST",

			success : function(providersList) {
				if(providersList.length>0){
					$('#EditProviderDropdown #providers').empty();
					if(userType!='ROLE_ADMIN'){
					 $('#EditProviderDropdown #providers').append($("<option name=\"provider\"  value=\"--select--\">--select--</option>"));  
					}
					for(var i=0;i<providersList.length;i++){
						 $('#EditProviderDropdown #providers').append($("<option name=\"provider\"  value="+providersList[i].id+
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
	
	
	function getProviderCustomersForEditUser(){
		var provider = $('#edit_user_form_id .providerClass').val();
		$.ajax({
			url : "customer/listByProvider",
			data : 'providerId='+ encodeURIComponent(provider),
			type : "POST",

			success : function(customersList) {
				if(customersList.length>0){
					
					$('#EditCustomerDropdown #customer').empty();
					 $('#EditCustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					
					for(var i=0;i<customersList.length;i++){
						 $('#EditCustomerDropdown #customer').append($("<option name=\"customer\"  value="+customersList[i].id+
								 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;\">"+customersList[i].name+"</option>"));
					}
				}else{
					
					$('#EditCustomerDropdown #customer').empty();
					 $('#EditCustomerDropdown #customer').append($("<option name=\"customer\"  value=\"--select--\">--select--</option>")); 
					
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
	function getProviderResellersForEditUser(){
		var provider = $('#edit_user_form_id .providerClass').val();
		$.ajax({
			url : "reseller/listByProvider",
			data : 'providerId='+ encodeURIComponent(provider),
			type : "POST",

			success : function(resellersList) {
				if(resellersList.length>0){
					
					 $('#EditResellerDropdown #reseller').empty(); 
					$('#EditResellerDropdown #reseller').append($("<option name=\"reseller\"  value=\"--select--\">--select--</option>")); 
					for(var i=0;i<resellersList.length;i++){
						 $('#EditResellerDropdown #reseller').append($("<option name=\"reseller\"  value="+resellersList[i].id+
								 " style=\"font-family: 'Source Sans Pro';	font-weight: 600;color:#7694b7;\">"+resellersList[i].name+"</option>"));
					}
				}else{
					
					$('#EditResellerDropdown #reseller').empty();
					$('#EditResellerDropdown #reseller').append($("<option name=\"reseller\"  value=\"--select--\">--select--</option>")); 
					
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
		
		var emailnotificationflag 	= $('input:radio[name=edit_emailNotificationFlag]:checked').val();
	
		if (emailnotificationflag=="true") {
	        document.getElementById('edituser_email').style.display = 'block';
	        document.getElementById('edituser_email_id').style.display = 'block';
	    } else{
		 document.getElementById('edituser_email').style.display = 'none';
	     document.getElementById('edituser_email_id').style.display = 'none';
	    }
		}
		
		function yesnoCheckForTextAlert() {
			
			var textAlert 	= $('input:radio[name=edit_textAlertFlag]:checked').val();
			
			if (textAlert=="true") {
				
		      document.getElementById('edit_mobile_number').style.display= 'block'; 
		        document.getElementById('edit_mobileNumber').style.display = 'block';
		        document.getElementById('edit_carriersType').style.display = 'block';
			     document.getElementById('carriersType').style.display = 'block';
		    } else{
		   	 document.getElementById('edit_mobile_number').style.display = 'none';
			 document.getElementById('edit_mobileNumber').style.display = 'none';
			 document.getElementById('edit_carriersType').style.display = 'none';
		     document.getElementById('carriersType').style.display = 'none';
		    }
			}
</script>		
