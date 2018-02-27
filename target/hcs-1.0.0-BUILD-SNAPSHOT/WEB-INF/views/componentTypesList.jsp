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
					 <th style="display: none;"></th>
					 <th style="display: none;"></th>
					 <th  style="width:40px; max-width:40px;text-align: left;cursor: pointer;"  class="vlab_table_th ">Type</th>
					 <th style="width:40px; max-width:40px;cursor: pointer;text-align: center;" class="vlab_table_th">Version</th>
					   <th style="width:40px; max-width:40px;cursor: pointer;text-align: center;" class="vlab_table_th">Sub Version</th>
					 <th style="display: none;"></th>
					 <th data-sorter="false" style="width:30px; max-width:30px" class="vlab_table_th sorttable_nosort">Actions</th>
					</tr>
				  </thead>
				  <tbody>
				  	
				  		<c:if test="${empty componentTypesList}">
					  		 <div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
								No Component Types
					  		</div>
					  	</c:if>
				  		<c:if test="${not empty componentTypesList}">
					  		<c:forEach var="componenttype" items="${componentTypesList}">
					  			<tr style="cursor: default;">
					  				<td style="display: none;">${componenttype.id}</td>
					  				
					  				<td style="width:40px; max-width:40px; text-align: left;" class="vlab_table_td">
									  	${componenttype.type}
								  	</td>
								    <td style="display: none;">${componenttype.id}</td> 
									<td style="width:40px; max-width:40px; text-align: center;" class="vlab_table_td">
									  	${componenttype.version}
								  	</td>
								  	<td style="width:40px; max-width:40px; text-align: center;" class="vlab_table_td">
									  	${componenttype.subVersion}
								  	</td>
								  	 <td style="display: none;">${componenttype.vrfWarnStart}</td>
								  	 <td style="display: none;">${componenttype.vrfWarnEnd}</td>
								  	 <td style="display: none;">${componenttype.vrfMax}</td>
								  	  
								  	 <td style="display: none;">${componenttype.bgpPeersWarnStart}</td>
								  	 <td style="display: none;">${componenttype.bgpPeersWarnEnd}</td>
								  	 <td style="display: none;">${componenttype.bgpPeersMax}</td>
								  	 
								  	 <td style="display: none;">${componenttype.vlanWarnStart}</td>
								  	 <td style="display: none;">${componenttype.vlanWarnEnd}</td>
								  	 <td style="display: none;">${componenttype.vlanMax}</td>
								  	 
								  	 <td style="display: none;">${componenttype.hsrpWarnStart}</td>
								  	 <td style="display: none;">${componenttype.hsrpWarnEnd}</td>
								  	 <td style="display: none;">${componenttype.hsrpMax}</td>
								  	 
								  	 <td style="display: none;">${componenttype.staticRoutesWarnStart}</td>
								  	 <td style="display: none;">${componenttype.staticRoutesWarnEnd}</td>
								  	 <td style="display: none;">${componenttype.staticRoutesMax}</td>
								  	 
								  	<td style="display: none;">${dataCenterId}</td>
								  
								  	<%-- <td style="display: none;">${componenttype.securityContextActive}</td>
								  	<td style="display: none;">${componenttype.securityContextFailOver}</td>
								  	<td style="display: none;">${componenttype.logicalcoresUsed}</td>
								  	<td style="display: none;">${componenttype.memoryUsed}</td>
								  	<td style="display: none;">${componenttype.datastoreUsed}</td> --%>
								  	<td style="width:30px; max-width:30px; text-align: center;" class="vlab_table_td">
							  			<a data-target="#componentType_view_modal" data-toggle="modal" data-keyboard="false" title="View" style="cursor: pointer;" class="componentType_view"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a>
							  		 
							  			<c:if test="${userRole!='ROLE_CUSTOMER_USER' && userRole!='ROLE_PROVIDER_USER' && userRole!='ROLE_RESELLER_USER'}">
											<a data-target="#componentType_edit_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" title="Modify" style="cursor: pointer;" class="componentType_edit"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
											<a title="Delete" style="cursor: pointer;" class="componentType_delete"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
										</c:if>
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

<script type="text/javascript">
$(document).ready(function(){
 $(".componentType_delete").click(function(){
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(2).text();
		var $row = $(this).parent().parent();
		var data = 'id='+ encodeURIComponent($.trim(id));
		var dataCenterId = $("#componentType_dataCenterId").val();
		 
		bootbox.confirm({
		    buttons: {
		    	confirm: {
		    		label: 'YES',
	        	},
		        cancel: {
		            label: 'NO',
		        }
		    },
		    message: 'Are you sure you want to delete this Component Type?',
		    callback: function(result) {
		    	  if(result) {	
					$.ajax({
						url : "componentType/delete",
						data: data,
						type : "POST",
				
						success : function(deleteComponent) {
							if(deleteComponent=="success"){ 
								
								  $row.remove(); 
								bootbox.alert("Component Type is deleted successfully.",function(){window.location = "componentType?dataCenterId="+dataCenterId;
								}).find("div.modal-content").addClass("modalsuccess");
							}
							else{
								bootbox.alert(deleteComponent).find("div.modal-content").addClass("modalfailure");
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
<body>


  
</body>