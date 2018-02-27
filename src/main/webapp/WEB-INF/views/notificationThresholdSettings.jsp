  <style>
  .ui-spinner {
  	float: right;
  	margin-right: 3px;
  }
  
  .notificationThreshold_heading_text{
    display: block;
    font-family: 'Source Sans Pro';
    font-weight: 600;
    color: rgb(111,111,111);
    margin-top: 37px;
    font-size: 18px;
    margin-left: 20px;
    margin-bottom: 15px;
  }
  </style>
  <script>
  $(function() {
	    var spinner = $( "#notification_greenThreshold_Max" ).spinner({
	    	min:1,
	    	max:100,
	    	step:1
	    });
	    
	    var spinner1 = $( "#notification_orangeThreshold_Max" ).spinner({
	    	min:1,
	    	max:100,
	    	step:1
	    });
	    
	    var val1 =  spinner.spinner( "value" ) ;
	    var val2 =  spinner1.spinner( "value" ) ;
	    $( "#notification_greenThreshold_Max" ).spinner( "option", "max", val2-1);
    	$("#notification_orangeThreshold_Min").val(val1);
    	$( "#notification_orangeThreshold_Max" ).spinner( "option", "min", val1+1);
    	$( "#notification_orangeThreshold_Max" ).spinner( "option", "max", 99);
    	
	    $("#notification_redThreshold_Min").val(val2);
	    
	    $( "#notification_greenThreshold_Max" ).on( "spinchange", function( event, ui ) {
	    	var val3 =  spinner.spinner( "value" ) ;
	    	$("#notification_orangeThreshold_Min").val(val3);
	    	$( "#notification_orangeThreshold_Max" ).spinner( "option", "min", val3+1);
	    } );
	    
	    $( "#notification_orangeThreshold_Max" ).on( "spinchange", function( event, ui ) {
	    	var val4 =  spinner1.spinner( "value" ) ;
	    	$("#notification_redThreshold_Min").val(val4);
	    	$( "#notification_greenThreshold_Max" ).spinner( "option", "max", val4-1);	    	
	    });
	 });

  function pollingProviderFilterChange(){
	  var data = "providerId="+$("#notification_filter_provider").val();
	  
	  $.ajax({
			url : "getPollingThreshold",
			data : data,
			type : "POST",

			success : function(result) {
				
				var green = result['greenIndicatorThreshold'];
				$("#notification_greenThreshold_Max").val(green);
				$("#notification_orangeThreshold_Min").val(green);
				$( "#notification_orangeThreshold_Max" ).spinner( "option", "min", green+1);
				var orange = result['orangeIndicatorThreshold'];
				$("#notification_orangeThreshold_Max").val(orange);
				$("#notification_redThreshold_Min").val(orange);
				$( "#notification_greenThreshold_Max" ).spinner( "option", "max", orange-1);
			}
		});
  }
  
  </script>
<h3 class="notificationThreshold_heading_text">Call State KPI Settings</h3>
<c:if test="${not empty providerList}">
	<div class="project_pane" style="float: right; margin-top: -44px;" >
		<table>
		 	<tbody>
				<tr>
					 <td class="table_header">Provider </td>
						 <td>
							<select id="notification_filter_provider" class="testplan_select" onchange="notificationProviderFilterChange()">
									<c:forEach var="provider" items="${providerList}">
											<option value="${provider.id}">${provider.name}</option>
									</c:forEach>
							</select> 
					 </td>
		  		</tr>			
			 </tbody>	
		</table>
	</div>
	<br>
</c:if>
<br>
<div style="margin-bottom: 10px"></div>

		<!-- Ticket: 381 -->
		<!-- Desc: Availability page enable to user Admin. -->
		<!-- Fix: Only provider admin and admin can modify the threshold values -->
		<!-- Author: Kaushik -->
			
		<form id="notificationThresholdform_id" style="margin-left: 20px " action="updateNotificationThreshold" modelAttribute="notificationThreshold"> 
			<table>
				<tr>
					<td style="padding-bottom: 15px;">
						<label class="myprofile_label_text">
							<span class="glyphicon glyphicon-ok-circle" aria-hidden="true" style="color: green;font-size: x-large;"></span>Green
						</label>
					</td>
					<td>
						<input type="text" id="notification_greenThreshold_Min" name="notification_greenThreshold_Min" class="myprofile_input_box threshold_inputBox" value="0" disabled>
						<label class="myprofile_label_text" style="width: 10px; padding-top: 5px; margin-right: 5px" >&#37;</label>
					</td>
					<td style="padding-bottom: 15px; padding-left: 20px; padding-right: 20px"><label class="myprofile_label_text"  style="width:190px;">&lt;&nbsp; Registeration Failures &nbsp;&le; </label></td>
					<c:if test="${(userRole != 'ROLE_PROVIDER_ADMIN') && (userRole != 'ROLE_ADMIN')}">
						<td style="padding-bottom: 0px;">
							<input  type="text" id="notification_greenThreshold_Max_disabled" name="notification_greenThreshold_Max_disabled" class="myprofile_input_box threshold_inputBox" value="${greenIndicatorThreshold}" disabled>
							<label class="myprofile_label_text" style="width: 10px; padding-top: 5px; float: right;">&#37;</label>
						</td>
					</c:if>
					<c:if test="${(userRole == 'ROLE_PROVIDER_ADMIN') || (userRole == 'ROLE_ADMIN')}">
						<td style="padding-bottom: 20px;">
							<label class="myprofile_label_text" style="width: 10px; padding-top: 5px; float: right;">&#37;</label>
							<input id="notification_greenThreshold_Max" name="notification_greenThreshold_Max" style="width: 36px; height: 25px" value="${greenIndicatorThreshold}">
						</td>
					</c:if> 
				</tr>
				<tr>
					<td style="padding-bottom: 15px;">
						<label class="myprofile_label_text">
							<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="color:  #ff9900 ; font-size: x-large;"></span>Orange
						</label>
					</td>
					<td>
						<c:if test="${(userRole != 'ROLE_PROVIDER_ADMIN') && (userRole != 'ROLE_ADMIN')}">
							<input type="text" id="notification_orangeThreshold_Min_disabled" name="notification_orangeThreshold_Min_disabled" class="myprofile_input_box threshold_inputBox" value="${greenIndicatorThreshold}" disabled>
						</c:if>
						<c:if test="${(userRole == 'ROLE_PROVIDER_ADMIN') || (userRole == 'ROLE_ADMIN')}">
							<input type="text" id="notification_orangeThreshold_Min" name="notification_orangeThreshold_Min" class="myprofile_input_box threshold_inputBox" disabled>
						</c:if>
						<!-- <input type="text" id="notification_orangeThreshold_Min" name="notification_orangeThreshold_Min" class="myprofile_input_box threshold_inputBox" disabled> -->
						<label class="myprofile_label_text" style="width: 10px; padding-top: 5px; margin-right: 5px" >&#37;</label>
					</td>
					<td style="padding-bottom: 15px; padding-left: 20px; padding-right: 20px"><label class="myprofile_label_text"  style="width:190px;">&lt;&nbsp; Registeration Failures &nbsp;&le; </label></td>
					<c:if test="${(userRole != 'ROLE_PROVIDER_ADMIN') && (userRole != 'ROLE_ADMIN')}">
						<td style="padding-bottom: 0px;">
							<input type="text" id="notification_orangeThreshold_Max_disabled" name="notification_orangeThreshold_Max_disabled" class="myprofile_input_box threshold_inputBox" value="${orangeIndicatorThreshold}"  disabled>
							<label class="myprofile_label_text" style="width: 10px; padding-top: 5px; float: right;">&#37;</label>
						</td>
					</c:if>
					<c:if test="${(userRole == 'ROLE_PROVIDER_ADMIN') || (userRole == 'ROLE_ADMIN')}">
						<td style="padding-bottom: 20px;">
							<label class="myprofile_label_text" style="width: 10px; padding-top: 5px; float: right;">&#37;</label>
							<input id="notification_orangeThreshold_Max" name="notification_orangeThreshold_Max" style="width: 36px; height: 25px;" value="${orangeIndicatorThreshold}">
						</td>
					</c:if>
				</tr>
				<tr>
					<td style="padding-bottom: 15px;">
						<label class="myprofile_label_text">
							<span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: red;font-size: x-large;"></span>Red
						</label>
					</td>
					<td>
						<c:if test="${(userRole != 'ROLE_PROVIDER_ADMIN') && (userRole != 'ROLE_ADMIN')}">
							<input type="text" id="notification_redThreshold_Min_diasbled" name="notification_redThreshold_Min_diasbled" class="myprofile_input_box threshold_inputBox" value="${orangeIndicatorThreshold}" disabled>
						</c:if>
						<c:if test="${(userRole == 'ROLE_PROVIDER_ADMIN') || (userRole == 'ROLE_ADMIN')}">
							<input type="text" id="notification_redThreshold_Min" name="notification_redThreshold_Min" class="myprofile_input_box threshold_inputBox" disabled>
						</c:if>
					
						<input type="text" id="notification_redThreshold_Min" name="notification_redThreshold_Min" class="myprofile_input_box threshold_inputBox" disabled>
						<label class="myprofile_label_text" style="width: 10px; padding-top: 5px; margin-right: 5px" >&#37;</label>
					</td>
					<td style="padding-bottom: 15px; padding-left: 20px; padding-right: 20px"><label class="myprofile_label_text"  style="width:190px;">&lt;&nbsp; Registeration Failures &nbsp;&le; </label></td>
					<td>
						<input type="text" id="notification_redThreshold_Max" name="notification_redThreshold_Max" class="myprofile_input_box threshold_inputBox" value="100" disabled>
						<label class="myprofile_label_text" style="width: 10px; padding-top: 5px;">&#37;</label>
					</td>
				</tr>
			</table>
				<!--   Ticket: 388
						Desc:Remove the User role_user from user type.
						Fix: Remove the user role and change the role is admin
						Author: Bala -->		
			<c:if test="${(userRole == 'ROLE_PROVIDER_ADMIN') || (userRole == 'ROLE_ADMIN')}">	
				<input type="submit" class="myprofile_save_button" value="">
			</c:if>
		</form>
		
		
<script>
	$('#notificationThresholdform_id').submit(
		function(event) {
			var green = $('#notification_greenThreshold_Max').val();
			var orange = $('#notification_orangeThreshold_Max').val();
			var providerId = $('#polling_filter_provider').val();
							
			var data = 'greenIndicatorThreshold='
					+ green
					+ '&orangeIndicatorThreshold='
					+ orange
					+ '&providerId='
					+ providerId;
					
					
			$.ajax({
				url : "updateNotificationThreshold",
				data : data,
				type : "GET",
 		
				success : function(response) {
					if(response=="Successfully Updated"){
						bootbox.alert(response).find("div.modal-content").addClass("modalsuccess");
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
</script>