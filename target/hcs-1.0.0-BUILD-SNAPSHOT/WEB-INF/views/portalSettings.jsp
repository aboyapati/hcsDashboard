<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3 class="myprofile_heading_text">App Settings</h3>
 <div style="width:650px; height: 550px; overflow: auto;" > 
		<form id="app_settings" style="margin-left: 20px "> 		
			<table>
			<tr>
				<td>
				 	<h4 class="myprofile_heading_text" style="margin-left: 0px; ">SIP Validation</h4>
				</td> 
			</tr>
			<tr>
			</tr>
			 
			 <tr>
				<td style="display: ">
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">IP Address<text style="color:red">*</text></label>
				</td>
				<td >
					<input type="text" id="sipValidationIPAddress" name="sipValidationIPAddress"  class="myprofile_input_box" value="${sipValidationIPAddress}" maxlength="25" style="margin-bottom: 14px;">
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">Port<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="sipValidationIPPort" name="sipValidationIPPort" class="myprofile_input_box" value="${sipValidationIPPort}" 
					maxlength="25" style="margin-bottom: 14px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">Timeout<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="sipValidationTimeout" name="sipValidationTimeout" class="myprofile_input_box" 
					value="${sipValidationTimeout}" maxlength="25" style="margin-bottom: 14px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">Web Protocol<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="sipValidationURLWebProtocol" name="sipValidationURLWebProtocol" class="myprofile_input_box" value="${sipValidationURLWebProtocol}" maxlength="25" style="margin-bottom: 14px;">
					 
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">Base URL<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="sipValidationBaseURL" name="sipValidationBaseURL" class="myprofile_input_box" value="${sipValidationBaseURL}" maxlength="25" style="margin-bottom: 14px;">
				</td>
			</tr>
			
			<tr>
				<td>
					<h4 class="myprofile_heading_text" style="margin-left: 0px;margin-bottom: 23px;">Automation Service</h4>
				</td>
				 
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px;margin-bottom: 23px; ">Web Protocol<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="automationServiceURLWebProtocol" name="automationServiceURLWebProtocol" value="${automationServiceURLWebProtocol}" class="myprofile_input_box" maxlength="25" style="margin-bottom: 14px;">
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">Base URL<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="automationServiceAPIBaseURL" name="automationServiceAPIBaseURL" value="${automationServiceAPIBaseURL}" class="myprofile_input_box" maxlength="25" style="margin-bottom: 14px;">
				</td>
			</tr>
			
			<tr>
				<td>
					<h4 class="myprofile_heading_text" style="margin-left: 0px;margin-bottom: 23px;">Twilio Account Settings</h4>
				</td>
				 
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Account Sid<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="accountSid" name="accountSid" class="myprofile_input_box" 
					value="${accountSid}" style="margin-bottom: 14px;" >
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Authentication Token<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="authenticationToken" name="authenticationToken" class="myprofile_input_box" 
					value="${authToken}"  style="margin-bottom: 14px;" >
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Twilio Domain<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="twilio_domain" name="twilio_domain" class="myprofile_input_box" 
					value="${twilioDomain}"  style="margin-bottom: 14px;" >
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Twilio Version<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="twilio_version" name="twilio_version" class="myprofile_input_box" 
					value="${twilioVersion}"  style="margin-bottom: 14px;" >
				</td>
			</tr>
			
			<tr>
				<td>
					<h4 class="myprofile_heading_text" style="margin-left: 0px;margin-bottom: 23px;">Load Upgrade Settings</h4>
				</td>
				 
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">New Link Version<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="newLinkVersion" name="newLinkVersion" class="myprofile_input_box" 
					value="${newLinkVersion}" style="margin-bottom: 14px;" onkeypress="return allowOnlyNumbersAndDot(event)" maxlength="10">
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Versions supported<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="versionsSupported" name="versionsSupported" class="myprofile_input_box" 
					value="${versionsSupported}" style="margin-bottom: 14px;" maxlength="25"   onkeypress="return allowOnlyNumbersAndDotAndComma(event)">
				</td>
			</tr>
			
			<%-- <tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Upgrade File Name<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="upgradeFileName" name="upgradeFileName" class="myprofile_input_box" 
					value="${upgradeFileName}" style="margin-bottom: 14px;" >
				</td>
			</tr> --%>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Upgrade Time Out(In Seconds)<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="upgradeTimeOut" name="upgradeTimeOut" class="myprofile_input_box" 
					value="${upgradeTimeOut}" style="margin-bottom: 14px;" onkeypress="return AllowOnlyNumbers(event)" maxlength="5">
				</td>
			</tr>
			
			
			<tr>
				<td>
					<h4 class="myprofile_heading_text" style="margin-left: 0px; ">Other Settings</h4>
				</td>
				 
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Max Visible Run Instances<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="runInstanceNumberRange" name="runInstanceNumberRange" class="myprofile_input_box" 
					value="${runNumberRange}" maxlength="15" style="margin-bottom: 14px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Max Allowed Recursive Runs<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="runprojectNumberRange" name="runprojectNumberRange" class="myprofile_input_box" 
					value="${maxAllowedRecursiveRuns}" maxlength="3" style="margin-bottom: 14px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			 
			<tr>
				
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 22px;">Testcase Est.Runtime-Buffer(Sec)<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="estimatedRunTimeBuffer" name="estimatedRunTimeBuffer" value="${estimatedRunTimeBuffer}" 
					class="myprofile_input_box" maxlength="25" style="margin-bottom: 30px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
		 
			 <tr>
				<td>
					<label class="myprofile_label_text" style="width:180px;margin-bottom: 15px; ">Update Project status<text style="color:red">*</text></label>
				</td>
				<td style="padding-left: 1px;">
					 <input type="radio" <c:if test="${updateProjectStatusCronjobFlag eq 'YES'}">checked</c:if> value="true"  id="updateProjectStatusCronjobFlag" name="updateProjectStatusCronjobFlag" style="margin: 9px;">Enable &nbsp;&nbsp;	
					 <input type="radio" <c:if test="${updateProjectStatusCronjobFlag eq 'NO'}">checked</c:if> id="updateProjectStatusCronjobFlag" name="updateProjectStatusCronjobFlag" value="false" style="margin: 9px;">Disable  
				</td>
			</tr>
			<%-- <tr>
				<td >
					<label class="myprofile_label_text" style="width:180px; ">Send Emails<text style="color:red">*</text></label>
				</td>
				<td style="padding-left: 1px;">
					<input type="radio" <c:if test="${sendEmails eq 'YES'}">checked</c:if> value="true"  id="sendEmails" name="sendEmails" style="margin: 9px;">YES &nbsp;&nbsp;
					<input type="radio" <c:if test="${sendEmails eq 'NO'}">checked</c:if>  id="sendEmails" name="sendEmails" value="false" style="margin: 9px;">NO	
				</td>
			</tr> --%>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px;margin-bottom: 11px; ">Keep Alive<text style="color:red">*</text></label>
				</td>
				<td style="padding-left: 1px;">
					<input type="radio" <c:if test="${keepAliveCronJobFlag eq 'YES'}">checked</c:if>  value="true"  id="keepAliveCronJobFlag" name="keepAliveCronJobFlag" style="margin: 9px;">Enable &nbsp;&nbsp;
					<input type="radio" <c:if test="${keepAliveCronJobFlag eq 'NO'}">checked</c:if>  id="keepAliveCronJobFlag" name="keepAliveCronJobFlag" value="false" style="margin: 9px;">Disable	
				</td>
			</tr>
		 
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">Keep Alive Failure Attempts<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="totalAttemptsforKeepAliveFailures" name="totalAttemptsforKeepAliveFailures" class="myprofile_input_box" 
					value="${totalAttemptsforKeepAliveFailures}" maxlength="25" style="margin-bottom: 12px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 23px;">Max fail test cases to display on text alert<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="maxFailedTCsToDispOnTextAlert" name="maxFailedTCsToDispOnTextAlert" class="myprofile_input_box" 
					value="${maxFailedTCsToDispOnTextAlert}" maxlength="25" style="margin-bottom: 12px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px;margin-bottom: 11px; ">Bulk Execution Mode<text style="color:red">*</text></label>
				</td>
				<td style="padding-left: 1px;">
					<input type="radio" <c:if test="${bulkExecutionMode eq '1'}">checked</c:if>  value="1"  id="bulkExecutionModeFlag" name="bulkExecutionModeFlag" style="margin: 9px;">Mode 1 &nbsp;&nbsp;
					<input type="radio" <c:if test="${bulkExecutionMode eq '2'}">checked</c:if>  id="bulkExecutionModeFlag" name="bulkExecutionModeFlag" value="2" style="margin: 9px;">Mode 2	
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px;margin-bottom: 11px; ">Send Email<text style="color:red">*</text></label>
				</td>
				<td style="padding-left: 1px;">
					<input type="radio" <c:if test="${sendMailFlag eq 'YES'}">checked</c:if>  value="true"  id="sendMailFlag" name="sendMailFlag" style="margin: 9px;">YES &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" <c:if test="${sendMailFlag eq 'NO'}">checked</c:if>  id="sendMailFlag" name="sendMailFlag" value="false" style="margin: 9px;">NO	
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">OnPOINT Link Time Mismatch(Threshold)<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="timeMismatchVal" name="timeMismatchVal" class="myprofile_input_box" 
					value="${OnPOINTTimeMismatchVal}" maxlength="3" style="margin-bottom: 14px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			<tr>
				<td>
					<label class="myprofile_label_text" style="width:180px; margin-bottom: 17px;">Dhcp Scan Timeout(In Seconds)<text style="color:red">*</text></label>
				</td>
				<td>
					<input type="text" id="dhcpScanTimeOut" name="dhcpScanTimeOut" class="myprofile_input_box" 
					value="${dhcpScanTimeOut}" maxlength="3" style="margin-bottom: 14px;" onkeypress="return AllowOnlyNumbers(event)">
				</td>
			</tr>
			
		</table>
		   
		  <input type="submit" class="myprofile_save_button" value="" style="bottom: 52px; width: 140px;">
	</form>
	</div> 
  	
<script>
	
		$('#app_settings').submit(
			function(event) {
				var sipValidationIPAddress 				= $('#sipValidationIPAddress').val();
				var sipValidationIPPort 				= $('#sipValidationIPPort').val();
				var sipValidationTimeout 				= $('#sipValidationTimeout').val();				
				var sipValidationURLWebProtocol 		= $('#sipValidationURLWebProtocol').val();				
				var sipValidationBaseURL 				= $('#sipValidationBaseURL').val();
				var automationServiceAPIBaseURL 		= $('#automationServiceAPIBaseURL').val();
				var automationServiceURLWebProtocol 	= $('#automationServiceURLWebProtocol').val();
				var totalAttemptsforKeepAliveFailures 	= $('#totalAttemptsforKeepAliveFailures').val();
				var runNumberRange 						= $('#runInstanceNumberRange').val();
				var maxAllowedRecursiveRuns 			= $('#runprojectNumberRange').val();
				//var sendEmails							= $('input:radio[name=sendEmails]:checked').val();
				var keepAliveCronjobStatusFlag			= $('input:radio[name=keepAliveCronJobFlag]:checked').val();
				var updateProjectStatusCronjobFlag		= $('input:radio[name=updateProjectStatusCronjobFlag]:checked').val();
				var estimatedRuntimeBuffer 				= $('#estimatedRunTimeBuffer').val();
				var bulkExecutionModeFlag				= $('input:radio[name=bulkExecutionModeFlag]:checked').val();
				var sendMailFlag						= $('input:radio[name=sendMailFlag]:checked').val();
				var maxFailedTCsToDispOnTextAlert 	    = $('#maxFailedTCsToDispOnTextAlert').val();
				
				var accountSid 	    					= $('#accountSid').val();
				var authToken 	    					= $('#authenticationToken').val();
				var twilioDomain 	    				= $('#twilio_domain').val();
				var twilioVersion	    				= $('#twilio_version').val();
				var newLinkVersion 	    				= $('#newLinkVersion').val();
				var versionsSupported 	    			= $('#versionsSupported').val();
				/* var upgradeFileName                     = $('#upgradeFileName').val(); */
				var onPOINTTimeMismatchVal              = $('#timeMismatchVal').val();
				var upgradeTimeOut                      = $('#upgradeTimeOut').val();
				var dhcpScanTimeOut						= $('#dhcpScanTimeOut').val();
				
				
				
			  	var data = 'sipValidationIPAddress='
						+sipValidationIPAddress
						+'&sipValidationIPPort='
						+sipValidationIPPort
						+'&sipValidationTimeout='
						+sipValidationTimeout
						+'&sipValidationBaseURL='
						+sipValidationBaseURL
						+'&automationServiceURLWebProtocol='
						+automationServiceURLWebProtocol
						+'&automationServiceAPIBaseURL='
						+automationServiceAPIBaseURL
						+'&sipValidationURLWebProtocol='
						+sipValidationURLWebProtocol
						+'&totalAttemptsforKeepAliveFailures='
						+totalAttemptsforKeepAliveFailures
						+'&maxFailedTCsToDispOnTextAlert='
						+maxFailedTCsToDispOnTextAlert
						+'&runNumber='
						+runNumberRange
						+'&maxAllowedRecursiveRuns='
						+maxAllowedRecursiveRuns
						/*+'&sendEmails='
						 +sendEmails*/
						+'&estimatedRuntimeBuffer=' 
						+estimatedRuntimeBuffer
						+'&keepAliveCronjobStatusFlag='
						+keepAliveCronjobStatusFlag
						+'&updateProjectStatusCronjobFlag='
						+updateProjectStatusCronjobFlag
						+'&bulkExecutionModeFlag='
						+bulkExecutionModeFlag
						+'&sendMailFlag='
						+sendMailFlag
						+'&accountSid='
						+accountSid
						+'&authToken='
						+authToken
						+'&twilioDomain='
						+twilioDomain
						+'&twilioVersion='
						+twilioVersion
			  			+'&newLinkVersion='
						+newLinkVersion
			  			+'&versionsSupported='
			  			+versionsSupported
			  			+'&onPOINTTimeMismatchVal='
			  			+onPOINTTimeMismatchVal
			  			+'&upgradeTimeOut='
			  			+upgradeTimeOut
			  			+'&dhcpScanTimeOut='
			  			+dhcpScanTimeOut;
			  	
			  	if (sipValidationIPAddress.trim()=="") {
					bootbox.alert("Please provide sip ip address").find("div.modal-content").addClass("modalfailure");
					return false;
				}else if (sipValidationIPPort.trim()=="") {
					bootbox.alert("Please provide sip port number").find("div.modal-content").addClass("modalfailure");
					return false;
				}
				else if (sipValidationTimeout.trim()=="") {
			    	bootbox.alert("Please provide sip time number.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (sipValidationBaseURL.trim()=="") {
			    	bootbox.alert("Please provide sip validation base url.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (automationServiceURLWebProtocol.trim()=="") {
			    	bootbox.alert("Please provide automation service url web protocal.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (automationServiceAPIBaseURL.trim()=="") {
			    	bootbox.alert("Please provide automation service API Base URL.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (sipValidationURLWebProtocol.trim()=="") {
			    	bootbox.alert("Please provide sip validation URL Web Protocol.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (accountSid.trim()=="") {
			    	bootbox.alert("Please provide Account Sid.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
			    else if (authToken.trim()=="") {
			    	bootbox.alert("Please provide Authentication Token.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
			    else if (twilioDomain.trim()=="") {
			    	bootbox.alert("Please provide Twilio Domain.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
			    else if (twilioVersion.trim()=="") {
			    	bootbox.alert("Please provide Twilio Version.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
			    else if (totalAttemptsforKeepAliveFailures.trim()=="") {
			    	bootbox.alert("Please provide total keepALive failure count.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (maxFailedTCsToDispOnTextAlert.trim()=="") {
			    	bootbox.alert("Please provide max failed test cases to display on text alert.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (runNumberRange.trim()=="") {
			    	bootbox.alert("Please provide run details range.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (maxAllowedRecursiveRuns.trim()=="") {
			    	bootbox.alert("Please specify the max allowed recursive run value.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }
			  	/* else if (sendEmails.trim()=="") {
			    	bootbox.alert("Please choose the sendEmail enable or not.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    } */else if (keepAliveCronjobStatusFlag.trim()=="") {
			    	bootbox.alert("Please choose the keep Alive Cronjob Status Flag enable or not.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (updateProjectStatusCronjobFlag.trim()=="") {
			    	bootbox.alert("Please choose the update Project Status Cronjob Flag enable or not.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }else if (estimatedRuntimeBuffer.trim()=="") {
			    	bootbox.alert("Please provide estimated Runtime Buffer.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }  
			    else if (bulkExecutionModeFlag.trim()=="") {
			    	bootbox.alert("Please provide bulk execution mode.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    } else if (sendMailFlag.trim()=="") {
			    	bootbox.alert("Please provide send mail flag.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    } else if (newLinkVersion.trim()=="") {
			    	bootbox.alert("Please provide New link version.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    } else if (versionsSupported.trim()=="") {
			    	bootbox.alert("Please provide Version supported.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    } else if (onPOINTTimeMismatchVal.trim()=="") {
			    	bootbox.alert("Please provide OnPOINT Mismatch Value.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }  else if (upgradeTimeOut.trim()=="") {
			    	bootbox.alert("Please provide Upgrade Time Out.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }  else if (dhcpScanTimeOut.trim()=="") {
			    	bootbox.alert("Please provide Dhcp Scan Time Out.").find("div.modal-content").addClass("modalfailure");
			    	return false;
			    }         
			  	 
				$.ajax({
					url : "updateAppPortalSettings",
					data : data,
					type : "POST",
					success : function(response) {
						 
						if(response=="Successfully Updated"){
							bootbox.alert("Portal settings updated successfully.").find("div.modal-content").addClass("modalsuccess");
							 
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
		
		function allowOnlyNumbersAndDot(e) {

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
		        	
		            if ((key == 39 || key == 45 || key != 46)) {
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
		
		function allowOnlyNumbersAndDotAndComma(e) {

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
		        	
		        	
		            if ((key == 39 || key == 45 || key != 46 )) {
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
		        	if(key == 44){
		        		  return true;
		        	}else{
		        		 return false;
		        	}
		           
		        }
		    }
		    else {
		        return true;
		    }
		 }
	
	
</script>  