 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div  id ="displayVirtualLab" class ="displayVirtualLab">
<div id="appId" ng-app="lablist_App" ng-cloak>
	<div class="vlab_inner_table">
			
	  <div ng-controller="MyReservationCtrl" class="lablist_container">	
		<div id ="myReservations">			
		  <scrollable-table watch="visibleProjects">
			<table id="reservationHistory" class="vlab_inner_table_body table-striped sortable">
				  <thead>
					<tr>
					  <th style="display: none"></th>
					  <th data-sorter="false" style="width:30px; max-width:30px; text-align: left; cursor: pointer;" class="vlab_table_th">Expected Start Date</th>
					  <th style="width:40px; max-width:40px; text-align: center; cursor: pointer;" class="vlab_table_th">Expected End Date</th>
					  <th style="width:40px; max-width:40px; text-align: center; cursor: pointer;" class="vlab_table_th">Actual Start Date</th>
					  <th style="width:40px; max-width:40px; text-align: center; cursor: pointer;" class="vlab_table_th">Actual End Date</th>
					  <th style="width:40px; max-width:40px; text-align: center; cursor: pointer;" class="vlab_table_th">Status</th>
					  <th style="width:40px; max-width:40px; text-align: center;" class="vlab_table_th sorter-false sorttable_nosort">Actions</th>
					</tr>
				  </thead>
				  <tbody>
				  	<c:if test="${empty maintenancenotificationslist}">
				  		 <div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
							No Maintenance Notifications List 
				  		</div>
				  	</c:if>
				  	<c:if test="${not empty maintenancenotificationslist}">
				  		<c:forEach var="note" items="${maintenancenotificationslist}">
				  		
							<tr style="cursor: default;">
								<td style="display: none">
				  					${note.id}
				  				</td>
							  	<td style="width:40px; max-width:30px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		<fmt:formatDate pattern="yyyy-MM-dd HH:mm"   value="${note.expectedStartDate}" />
							  	</td>							  	
							  	
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center; white-space: normal;" class="vlab_table_td lab_name_td">
							  		<fmt:formatDate pattern="yyyy-MM-dd HH:mm"   value="${note.expectedEndDate}" />
							  	</td>
								<td style="width:40px; max-width:40px; padding-left:5px;text-align: center; white-space: normal;" class="vlab_table_td lab_name_td">
							  		<fmt:formatDate pattern="yyyy-MM-dd HH:mm"   value="${note.actualStartDate}" />							  		
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center; white-space: normal;" class="vlab_table_td lab_name_td">
							  		<fmt:formatDate pattern="yyyy-MM-dd HH:mm"   value="${note.actualEndDate}" />							  		
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${note.status}							  		
							  	</td>
							  	<c:if test="${note.status=='NEW' || note.status=='ONGOING'}">
								<td style="width:40px; max-width:40px; padding-left:5px;text-align: center; white-space: normal;" class="vlab_table_td lab_name_td">
									<a data-target="#maintenancenotifications_edit_modal" onclick="editMaintenanceNotifications('${note.id}'); " data-toggle="modal" data-backdrop="static" data-keyboard="false" title="View/Modify" style="cursor: pointer;" class="maintenancenotifications_edit"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
									<a title="Delete" style="cursor: pointer;" class="maintenancenotifications_delete"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>									 
								</td>
								</c:if>
							  	<c:if test="${note.status=='COMPLETED'}">
								<td style="width:40px; max-width:40px; padding-left:5px;text-align: center; white-space: normal;" class="vlab_table_td lab_name_td">																		 
								</td>
								</c:if>																	
							</tr>						
						</c:forEach>
					</c:if>	
				  </tbody>
			</table>
		  </scrollable-table>							
		</div>
		
	  </div>
	  
	 
	</div>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	$(".maintenancenotifications_delete").click(function(){
		
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(0).text();
		var notificationId = $.trim(id);
		var $row = $(this).parent().parent();
		//var data = 'id='+ encodeURIComponent($.trim(id));
		 //alert(data);
		bootbox.confirm({
		    buttons: {
		    	confirm: {
		    		label: 'YES',
	        	},
		        cancel: {
		            label: 'NO',
		        }
		    },
		    message: 'Are you sure want to delete this Maintenance window?',
		    callback: function(result) {
		    	  if(result) {	
					$.ajax({
						url : "maintenancenotificationsDelete",
						//data: data,
						type : "POST",
						data : {
							notificationId:notificationId,
						},
						success : function(deleteMaintenanceNotifications) {
							if(deleteMaintenanceNotifications=="success"){ 
								$row.remove();
								bootbox.alert("Maintenance Notification is deleted successfully.",function(){window.location = "maintenancenotifications";
								}).find("div.modal-content").addClass("modalsuccess");
							}
							else{
								bootbox.alert(deleteMaintenanceNotifications).find("div.modal-content").addClass("modalfailure");
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
	  });
	
});

function editMaintenanceNotifications(id){
	var notificationId  = $.trim(id);
	
	 $.ajax({
			url : "maintenancenotificationsEdit",
			/* data : data, */
			type : "GET",
			data : {
				notificationId  : notificationId, 
			},
			success : function(maintenanceNotificationDetails) {
							
				if(maintenanceNotificationDetails == "failed"){
					bootbox.alert("Could not edit the Maintenance window",function(){window.location = "maintenancenotifications"}).find("div.modal-content").addClass("modalfailure");
				}else{
					$('#edit_notificationId').val(maintenanceNotificationDetails['maintenancenotificationId']);
					$('#edit_expected_start_date').val(maintenanceNotificationDetails['expectedStartDate']);
					$('#edit_expected_end_date').val(maintenanceNotificationDetails['expectedEndDate']);
					$('#edit_expected_start_time').val(maintenanceNotificationDetails['expectedStartTime']);
					$('#edit_expected_end_time').val(maintenanceNotificationDetails['expectedEndTime']);
					$('#edit_description').val(maintenanceNotificationDetails['description']);
					$('#edit_status').val(maintenanceNotificationDetails['status']);
					if(maintenanceNotificationDetails['status'] == "ONGOING")
					$('#edit_status').val("START");
					if(maintenanceNotificationDetails['status'] == "NEW")
					$('#edit_status').val("--select--");
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

		   		 