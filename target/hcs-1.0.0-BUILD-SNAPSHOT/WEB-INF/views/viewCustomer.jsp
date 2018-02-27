<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>View Customer</title>
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
	
	<form id="view_customer_form">
		<h3 class="edit_title">View Customer</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			<tr>
				<td>
					<p>Reseller</p>
				</td>
				<td>
					<input type="text" id="view_customerResellerName" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>
					<p>Name</p>
				</td>
				<td>
					<input type="text" id="view_customerName" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>
					<p>Address</p>
				</td>
				<td>
					<input type="text" id="view_customerAddress" class="nonEditable" disabled="disabled">
				</td>
			</tr>

			<tr>
				<td>
					<p>City</p>
				</td>
				<td>
					<input type="text" id="view_customerCity" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>
					<p>Zip code</p>
				</td>
				<td>
					<input type="text" id="view_customerZipcode" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>
					<p>Country</p>
				</td>
				<td>
					<input type="text" id="view_customerCountry" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			 	  <!-- Ticket: 373 -->
		 		  <!-- Desc: Need to remove customer number text box from View Customer pop up -->
		 		  <!-- Fix: Removed the row of Customer number from the form -->
		 		  <!-- Author: Kaushik -->
			
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px" type="reset" class="view_cancel_button" data-dismiss="modal"></button>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$(".project_view").click(function(){
		
		var tr = $(this).closest('tr');
		var resellerName= tr.find('td').eq(4).text();
		var name = tr.find('td').eq(3).text();
		var address = tr.find('td').eq(8).text();
		var zipCode = tr.find('td').eq(6).text();
		var city = tr.find('td').eq(5).text();
		var country = tr.find('td').eq(7).text();
		
		  /* Ticket: 373 */
		  /* Desc: Need to remove customer number text box from View Customer pop up */
		  /* Fix: Removed the row of Customer number from the form */
		  /* Author: Kaushik */ 
		$("#view_customerResellerName").val($.trim(resellerName));
		$("#view_customerName").val($.trim(name));
		$("#view_customerAddress").val($.trim(address));
		$("#view_customerZipcode").val($.trim(zipCode));
		$("#view_customerCity").val($.trim(city));
		$("#view_customerCountry").val($.trim(country));
		
		  /* Ticket: 373 */
		  /* Desc: Need to remove customer number text box from View Customer pop up */
		  /* Fix: Removed the row of Customer number from the form */
		  /* Author: Kaushik */
	});
	
	$(".view_cancel_button").click(function(){
	$('#view_connection_form').trigger("reset");
	});
});
</script>
</html>