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
					  <th style="width:40px; max-width:40px; text-align: center; padding-left: 5px; " class="vlab_table_th sorter-false sorttable_nosort">Name</th>
					  <th style="width:40px; max-width:40px;  text-align: center;" class="vlab_table_th sorter-false sorttable_nosort">Reseller</th>
					  <th style="width:40px; max-width:40px; cursor: pointer;text-align: center;" class="vlab_table_th">City</th>
					  <th style="width:40px; max-width:40px; text-align: center;" class="vlab_table_th sorter-false sorttable_nosort">Zip code</th>
					  <th style="width:40px; max-width:40px; cursor: pointer;text-align: center;" class="vlab_table_th">Country</th>
					  <td style="display: none;"></td>
					  <th data-sorter="false" style="width:30px; max-width:30px" class="vlab_table_th sorter-false">Actions</th>
					</tr>
				  </thead>
				  <tbody>
					  	<c:if test="${empty customerList}">
					  		 <div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
								No Customers 
					  		</div>
					  	</c:if>
					  	<c:if test="${not empty customerList}">
				  		<c:forEach var="customer" items="${customerList}">
							<tr style="cursor: default;">
								 <td style="display: none;">${customer.id}</td>
								 <td style="display: none;">${customer.reseller.id}</td>
								 <td style="display: none;">${customer.provider.id}</td>
									<%-- <td style="display: none;">${customer.provider.name}</td> --%>
							  	<td style="width:40px; max-width:40px; text-align: left; padding-left: 5px;" class="vlab_table_td">
								  	<a href="site?customerId=${customer.id}">${customer.name}</a>
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${customer.reseller.name}
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${customer.city}
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${customer.zipCode}
							  	</td>
							  	<td style="width:40px; max-width:40px; padding-left:5px;text-align: center;white-space: normal;" class="vlab_table_td lab_name_td">
							  		${customer.country}
							  	</td>
							  	 <td style="display: none;">${customer.address}</td>
							  	<td style="width:30px; max-width:30px; text-align: center;" class="vlab_table_td">
							  		<a data-target="#customer_view_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" title="View" style="cursor: pointer;" class="project_view"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a>
							  		<!--   Ticket: 390 and 392
									Desc: Customer delete link shown for customer admin user and delete link is shown for current login user.
									Fix: Not show up delete and edit while logging customer user and customer admin.  
									Author: Bala -->
							  		<c:if test="${userRole!='ROLE_CUSTOMER_USER' && userRole!='ROLE_CUSTOMER_ADMIN' && userRole!='ROLE_PROVIDER_USER' && userRole!='ROLE_RESELLER_USER'}">
										<a data-target="#customer_edit_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" title="Modify" style="cursor: pointer;" class="project_edit"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
										<a title="Delete" style="cursor: pointer;" class="customer_delete"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
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
		    message: 'Are you sure want to delete this Customer?',
		    callback: function(result) {
		    	  if(result) {	
					$.ajax({
						url : "customer/delete",
						data: data,
						type : "POST",
				
						success : function(deleteCust) {
							if(deleteCust=="success"){ 
								$row.remove();
								bootbox.alert("Customer is deleted successfully.",function(){window.location = "customer";
								}).find("div.modal-content").addClass("modalsuccess");
							}
							else{
								bootbox.alert(deleteCust).find("div.modal-content").addClass("modalfailure");
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