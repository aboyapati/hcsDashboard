<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link rel="stylesheet" href="<c:url value="/resources/css/license.css"/>"/>
  <style>
  .ui-spinner {
  	float: right;
  	margin-right: 3px;
  }
  
  .customerLicensing_heading_text{
    display: block;
    font-family: 'Source Sans Pro';
    font-weight: 600;
    color: #203c66;
    margin-top: 37px;
    font-size: 18px;
    margin-left: 20px;
    margin-bottom: 15px;
  }
  .customerLicensing_label_text{
	font-size: 16px;
	color: #7694b7;
	font-family: 'Source Sans Pro';
	font-weight: 600;
	width:180px;
	float: left;
	
}
.table_body_tr_customerLicensing{	
	font-family: 'Source Sans Pro';
	font-weight: 400;
	/* font-family: 'Exo2-Regular'; */
	font-size: 15px;
	color: #7694b7;	
	border:none;	
}
 </style>

 <h4 class="customerLicensing_heading_text">My License</h4>
<div style="margin-bottom: 50px"></div>
<form:form method="post" action="addLicensing" modelAttribute="addLicense" style="margin-left: 20px ">
		 
	<label class="license_txt">Customer</label>			
	<c:choose>
		 <c:when test="${loggeduser=='ROLE_PROVIDER_ADMIN' || loggeduser=='ROLE_PROVIDER_USER' || loggeduser=='ROLE_RESELLER_ADMIN' || loggeduser=='ROLE_RESELLER_USER'}">			
				<select id="filter_customer" class="adduser_dropdown_box customerClass" name="filter_customer" onchange="customerLiceseFilter()">
					<option value="--select--">--select--</option>
					<c:forEach var="customer" items="${customerList}" >
							<option value="${customer.id}">${customer.name}</option>
					</c:forEach>
				</select>
		</c:when>
			
		<c:otherwise>
			<input type="text" id="companyName" class="myprofile_input_box" value="${customerName}"  disabled="disabled" >
		</c:otherwise>
	</c:choose>	
			<label class="license_txt">Subscription Plan</label>
			<input type="text" id="license_plan" class="myprofile_input_box" value="${packageName}"  disabled="disabled" >
			<label class="license_txt">Trace Capture : </label>
			<div class="license_data" id="lincense_traceCapture">
			<c:if test="${traceCapture eq 'YES'}"><text  style="color:green">ENABLED</text></c:if>
			<c:if test="${traceCapture eq 'NO'}"><text   style="color:red">DISABLED</text></c:if>
			</div>	
			<label class="license_txt">Sites Used / Allowed : </label>
			<div class="license_data" id="lincense_sites">${usedSites} / ${allocatedSites}</div>
			<label class="license_txt">Phones Used / Allowed : </label>
			<div class="license_data" id="lincense_devices"> ${usedDevices} / ${allocatedDevices} </div>
			<label class="license_txt">Project Runs Used / Allowed : </label>
			<div class="license_data" id="lincense_projects"> ${usedProjectRuns} / ${allocatedProjectRuns} </div>
		 
	</form:form> 

<script type="text/javascript">
function customerLiceseFilter(){
	var customerId = $("#filter_customer").val();
	var data = "customerId="+encodeURIComponent($.trim(customerId));
	if (customerId.trim()!="" && customerId.trim()!="--select--") {
		$.ajax({
			url : "licensing/customerByLicenseDetails",
			data : data,
			type : "POST",
			success : function(res) {
				$("#add_licensing_form").empty();
			 	 $("#license_plan").val(res['packageName']);
				 document.getElementById("lincense_sites").innerHTML =res['usedSites']+" / "+res['allocatedSites'];
				 document.getElementById("lincense_devices").innerHTML =res['usedDevices']+" / "+res['allocatedDevices'];
				 document.getElementById("lincense_projects").innerHTML =res['usedProjectRuns']+" / "+res['allocatedProjectRuns'];
				 if(res['isTraceCapture_enabled']=="YES"){
					 document.getElementById("lincense_traceCapture").innerHTML= "<text  style=\"color:green\">ENABLED</text>";
				 }else{
					 document.getElementById("lincense_traceCapture").innerHTML= "<text  style=\"color:red\">DISABLED</text>"; 
				 }
		    	 
			}
		 
		});
	} 
	}

</script>
</html>