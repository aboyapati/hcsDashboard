<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div  id ="displayVirtualLab" class ="displayVirtualLab">
  <div id="appId" ng-app="lablist_App" ng-cloak>
	<div class="vlab_inner_table">
			
	  <div ng-controller="MyReservationCtrl" class="lablist_container">	
		<div id ="myReservations">			
		  <scrollable-table > 
		 
			<table id="reservationHistory" class="vlab_inner_table_body table-striped sortable" >
				<col width="100px">
								<col width="200px"> 
				  <thead>
					<tr>
					  
					   <th style="width:40px; max-width:40px; text-align: center;" >SheetName</th>
					   <th style="width:40px; max-width:40px; text-align: center; ">Message</th>
					  
					</tr>
				  </thead>
				  <tbody>
				  	<c:if test="${empty response}">
				  		 <div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
							No ErrorMessages 
				  		</div>
				  	</c:if>
				  	<c:if test="${not empty response}">
				  						  			
							<tr >
								
							  	<td style="width:15px; max-width:15px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.providerDtoWrapper.sheetName}
							  	</td>
							  	
							  	<td style="width:85px; max-width:85px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.providerDtoWrapper.uploadMessage}
							  	</td>
							  	
							</tr>
							<tr >
								
							  	<td style="width:15px; max-width:15px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.resellerDtoWrapper.sheetName}
							  	</td>
							  	
							  	<td style="width:85px; max-width:85px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.resellerDtoWrapper.uploadMessage}
							  	</td>
							  	
							</tr>
							<tr >
								
							  	<td style="width:15px; max-width:15px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.customerDtoWrapper.sheetName}
							  	</td>
							  	
							  	<td style="width:85px; max-width:85px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.customerDtoWrapper.uploadMessage}
							  	</td>
							  	
							</tr>
							<tr >
								
							  	<td style="width:15px; max-width:15px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.pbxInfoDtoWrapper.sheetName}
							  	</td>
							  	
							  	<td style="width:85px; max-width:85px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.pbxInfoDtoWrapper.uploadMessage}
							  	</td>
							  	
							</tr>
							<tr >
								
							  	<td style="width:15px; max-width:15px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.siteDtoWrapper.sheetName}
							  	</td>
							  	
							  	<td style="width:85px; max-width:85px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.siteDtoWrapper.uploadMessage}
							  	</td>
							  	
							</tr>
							<tr >
								
							  	<td style="width:15px; max-width:15px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.deviceDtoWrapper.sheetName}
							  	</td>
							  	
							  	<td style="width:85px; max-width:85px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.deviceDtoWrapper.uploadMessage}
							  	</td>
							  	
							</tr>
							
							<tr >
								
							  	<td style="width:15px; max-width:15px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.deviceNetworkConfigurationDtoWrapper.sheetName}
							  	</td>
							  	
							  	<td style="width:85px; max-width:85px; padding-left:5px;text-align: left; white-space: normal;" class="vlab_table_td lab_name_td">
							  		${response.deviceNetworkConfigurationDtoWrapper.uploadMessage}
							  	</td>
							  	
							</tr>
						
					</c:if>	
				  </tbody>
			</table>
			
		   </scrollable-table>							
		</div>
	  </div>
	</div>
  </div>
</div> 