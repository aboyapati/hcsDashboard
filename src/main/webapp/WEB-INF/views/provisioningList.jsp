<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div  id ="displayVirtualLab" class ="displayVirtualLab">
  <div id="appId" ng-app="lablist_App" ng-cloak>
	<div class="vlab_inner_table">
	  <div ng-controller="MyReservationCtrl" class="lablist_container">	
		<div id ="myReservations">			
		  <scrollable-table watch="visibleProjects">
			<table id="reservationHistory" class="vlab_inner_table_body table-striped sortable">
				  <thead>
					<tr>
					 <td style="display: none;"></td>
					 <td style="display: none;"></td>
					  <th style="width:40px; max-width:40px; cursor: pointer;text-align: center; padding-left: 5px; " class="vlab_table_th">D.C.Name</th>
					  <th style="width:40px; max-width:40px; cursor: pointer;text-align: center;" class="vlab_table_th ">Country</th>
					  <th style="width:40px; max-width:40px; cursor: pointer;text-align: center;" class="vlab_table_th">State</th>
					  <th style="width:40px; max-width:40px; cursor: pointer;text-align: center;" class="vlab_table_th ">City</th>
					  <th style="width:40px; max-width:40px; cursor: pointer;text-align: center;" class="vlab_table_th">Timezone</th>
					  <!-- <td style="display: none;"></td> -->
					  <th data-sorter="false" style="width:30px; max-width:30px" class="vlab_table_th sorttable_nosort">Actions</th>
					</tr>
				  </thead>
				  <tbody>
					  	<c:if test="${empty provisioningList}">
					  		 <div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
								No Provisioning 
					  		</div>
					  	</c:if>
					  	<c:if test="${not empty provisioningList}">
				  		<c:forEach var="provision" items="${provisioningList}">
							<tr style="cursor: default;">
								<td style="display: none;">${provision.dataCenterId}</td>
							  	<td style="width:40px; max-width:40px; text-align: left; padding-left: 5px;" class="vlab_table_td">
								  <a href="component?dataCenterId=${provision.dataCenterId}">${provision.name}</a>
								   
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${provision.country}
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${provision.state}
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${provision.city}
							  	</td>
							  	<td style="display: none;">
									  	${provision.timezone.id}
								</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${provision.timezone.name}
							  	</td>
							  	<td style="width:30px; max-width:30px; text-align: center;" class="vlab_table_td">
							  		<a data-target="#provisioning_view_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" title="View" style="cursor: pointer;" class="project_view"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a>
									<a data-target="#provisioning_edit_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" title="Modify" style="cursor: pointer;" class="project_edit"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
									<a title="Delete" style="cursor: pointer;" class="customer_delete"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
								</td>
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

<script>
$(document).ready(function(){
	
	
	$(".customer_delete").click(function(){
		
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(0).text();
		var $row = $(this).parent().parent();
		var data = 'id='+ encodeURIComponent($.trim(id));
		
		bootbox.confirm({
		    buttons: {
		    	confirm: {
		    		label: 'YES',
	        	},
		        cancel: {
		            label: 'NO',
		        }
		    },
		    message: 'Are you sure you want to delete this Data Center?',
		    callback: function(result) {
		    	  if(result) {	
					$.ajax({
						url : "dataCenter/delete",
						data: data,
						type : "POST",
				
						success : function(deleteDc) {
							if(deleteDc=="success"){ 
								$row.remove();
								bootbox.alert("Data center is deleted successfully.",function(){window.location = "provisioning";
								}).find("div.modal-content").addClass("modalsuccess");
							}
							else{
								bootbox.alert(deleteDc).find("div.modal-content").addClass("modalfailure");
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


</script>