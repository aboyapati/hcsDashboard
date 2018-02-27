<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Edit Component Type</title>
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
	<input type="hidden" id="componentType_dataCenterId" value="${dataCenterId}" />   
	<form id="edit_componentType_form" style="color: #7694b7">
		<h3 class="edit_title">Edit Component Type</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			<tr>
				<td>
					<p>Type<text style="color:red">*</text></p>
				</td>
				<td>
				<select id="edit_componentType" class="testplan_select" onchange="checkComponentType()">
						<option value="--select--">--select--</option>
						<c:forEach var="componentTypeEnum" items="${componentTypesEnumlist}">
							<option value="${componentTypeEnum}">${componentTypeEnum}</option>
						</c:forEach>
					</select>
					<input type="hidden" id="edit_componentTypeId" class="projectName" maxlength="100">
					<input type="text" id="edit_componentType1" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			
			<tr>
				<td>
					<p>Version<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="edit_componentType_Version" class="projectName" maxlength="10">
				</td>
			</tr>
			
			<tr>
				<td>
					<p>Sub Version<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="edit_componentType_SubVersion" class="projectName" maxlength="10">
				</td>
			</tr>
			</table>
		<table>	
			<tr id="rowEdit_Threshold_Names" hidden="true">
			<td width=150px;>
				<b>Threshold Values</b>
			</td>
		</tr>
		<tr id="rowEdit_Column_Names" hidden="true">	
			 <td></td>
			<td rowspan=1 width="60px;">
				WARNING
			</td>
			<td rowspan=1>ALERT</td>
			<td rowspan=1>MAX</td>
			 
		</tr>
			<tr id="rowEdit_componentType_VRF" >
				<td><p>VRF<text style="color:red">*</text></p></td>
				<td><input type="text" id="edit_componentType_VRF_Start" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_VRF_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_VRF_Max" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
			</tr>
			
			<tr id="rowEdit_componentType_BGP">
				<td><p>BGP peers<text style="color:red">*</text></p></td>
				<td><input type="text" id="edit_componentType_BGP_Start" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_BGP_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_BGP_Max" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>			
			</tr>
			
			<tr id="rowEdit_componentType_VLAN">
				<td><p>VLAN<text style="color:red">*</text></p></td>
				<td><input type="text" id="edit_componentType_VLAN_Start" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_VLAN_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_VLAN_Max" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
			</tr>
			
			<tr id="rowEdit_componentType_HSRP">
				<td><p>HSRP<text style="color:red">*</text></p></td>
				<td><input type="text" id="edit_componentType_HSRP_Start" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_HSRP_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_HSRP_Max" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
			</tr>
			
			<tr id="rowEdit_componentType_StaticRoutes">
				<td><p>Static routes<text style="color:red">*</text></p></td>
				<td><input type="text" id="edit_componentType_StaticRoutes_Start" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_StaticRoutes_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="edit_componentType_StaticRoutes_Max" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
			</tr>
			</table>
		 
	  <table>
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px;  width: 80px;height: 35px;margin-left: -35px;" type="reset" class="edit_cancel_button" data-dismiss="modal"></button>
					<div id="editComponentType" class="edit_save_button"   style="width: 80px;height: 35px; margin-left: 70px; margin-top: -35px;"></div>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$(".componentType_edit").click(function(){
		 
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(0).text();
		var type = tr.find('td').eq(1).text();
		var typeId = tr.find('td').eq(2).text();
		var version = tr.find('td').eq(3).text();
		var subVersion = tr.find('td').eq(4).text();
		
		var vrfstart = tr.find('td').eq(5).text();
		var vrfend = tr.find('td').eq(6).text();
		var vrfmax = tr.find('td').eq(7).text();
		
		var bgpPeersstart = tr.find('td').eq(8).text();
		var bgpPeersend = tr.find('td').eq(9).text();
		var bgpPeersmax = tr.find('td').eq(10).text();
		
		var vlanstart = tr.find('td').eq(11).text();
		var vlanend = tr.find('td').eq(12).text();
		var vlanmax = tr.find('td').eq(13).text();

		var hsrpstart = tr.find('td').eq(14).text();
		var hsrpend = tr.find('td').eq(15).text();
		var hsrpmax = tr.find('td').eq(16).text();
		
		var staticRoutesstart = tr.find('td').eq(17).text();
		var staticRoutesend = tr.find('td').eq(18).text();
		var staticRoutesmax = tr.find('td').eq(19).text();
		
		var dataCenterId = tr.find('td').eq(20).text();
		loadEditComponentType(id);
		
		if($.trim(type)=="NEXUS"){
			document.getElementById('editComponent_intro').style.height  = '670px';
			$("#edit_componentTypeId").val($.trim(id));
			//$("#edit_componentName").val($.trim(name));
			$("#edit_componentType").val($.trim(type));
			//$("#edit_componentTypeId").val($.trim(typeId)); 
			$("#edit_componentType_Version").val($.trim(version));
			$("#edit_componentType_SubVersion").val($.trim(subVersion));
			
			$("#edit_componentType_VRF_Start").val($.trim(vrfstart));
			$("#edit_componentType_VRF_End").val($.trim(vrfend));
			$("#edit_componentType_VRF_Max").val($.trim(vrfmax));
			
			$("#edit_componentType_BGP_Start").val($.trim(bgpPeersstart));
			$("#edit_componentType_BGP_End").val($.trim(bgpPeersend));
			$("#edit_componentType_BGP_Max").val($.trim(bgpPeersmax));
			
			$("#edit_componentType_VLAN_Start").val($.trim(vlanstart));
			$("#edit_componentType_VLAN_End").val($.trim(vlanend));
			$("#edit_componentType_VLAN_Max").val($.trim(vlanmax));
			
			$("#edit_componentType_HSRP_Start").val($.trim(hsrpstart));
			$("#edit_componentType_HSRP_End").val($.trim(hsrpend));
			$("#edit_componentType_HSRP_Max").val($.trim(hsrpmax));
			
			$("#edit_componentType_StaticRoutes_Start").val($.trim(staticRoutesstart));
			$("#edit_componentType_StaticRoutes_End").val($.trim(staticRoutesend));
			$("#edit_componentType_StaticRoutes_Max").val($.trim(staticRoutesmax));
			
			$("#componentType_dataCenterId").val($.trim(dataCenterId));
			 
			$("#rowEdit_Threshold_Names").show();
			$("#rowEdit_Column_Names").show();
			$("#rowEdit_componentType_VRF").show();
			$("#rowEdit_componentType_BGP").show();
			$("#rowEdit_componentType_VLAN").show();
			$("#rowEdit_componentType_HSRP").show();
			$("#rowEdit_componentType_StaticRoutes").show();
			
		
		}else if($.trim(type)=="ASA"){
			document.getElementById('editComponent_intro').style.height  = '315px';
			$("#edit_componentTypeId").val($.trim(id));
			$("#edit_componentType").val($.trim(type));
			$("#edit_componentType_Version").val($.trim(version));
			$("#edit_componentType_SubVersion").val($.trim(subVersion));
			 
			$("#rowEdit_Threshold_Names").hide();
			$("#rowEdit_Column_Names").hide();
			$("#rowEdit_componentType_VRF").hide();
			$("#rowEdit_componentType_BGP").hide();
			$("#rowEdit_componentType_VLAN").hide();
			$("#rowEdit_componentType_HSRP").hide();
			$("#rowEdit_componentType_StaticRoutes").hide();
			 
		}else if($.trim(type)=="VCENTER"){
			document.getElementById('editComponent_intro').style.height  = '315px';
			$("#edit_componentTypeId").val($.trim(id));
			$("#edit_componentType").val($.trim(type));
			$("#edit_componentType_Version").val($.trim(version));
			$("#edit_componentType_SubVersion").val($.trim(subVersion));
			
			$("#rowEdit_Threshold_Names").hide();
			$("#rowEdit_Column_Names").hide();
			
			$("#rowEdit_componentType_VRF").hide();
			$("#rowEdit_componentType_BGP").hide();
			$("#rowEdit_componentType_VLAN").hide();
			$("#rowEdit_componentType_HSRP").hide();
			$("#rowEdit_componentType_StaticRoutes").hide();
			 
		}
		
	}); 
	
	$(".edit_cancel_button").click(function(){		
		$('#edit_componentType_form').trigger("reset");
	});
	

$(".edit_save_button").click(function(){
	
	var dataCenterId 		= $("#componentType_dataCenterId").val();
	var id 					= $("#edit_componentTypeId").val();
	var type 				= $("#edit_componentType").val();
	var version 			= $("#edit_componentType_Version").val();
	var subVersion 			= $("#edit_componentType_SubVersion").val();
	
	var vrfstart 			= $("#edit_componentType_VRF_Start").val();
	var vrfend 				= $("#edit_componentType_VRF_End").val();
	var vrfmax 				= $("#edit_componentType_VRF_Max").val();
	
	var bgpPeersstart 		= $("#edit_componentType_BGP_Start").val();
	var bgpPeersend 		= $("#edit_componentType_BGP_End").val();
	var bgpPeersmax 		= $("#edit_componentType_BGP_Max").val();
	
	var vlanstart 			= $("#edit_componentType_VLAN_Start").val();
	var vlanend 			= $("#edit_componentType_VLAN_End").val();
	var vlanmax 			= $("#edit_componentType_VLAN_Max").val();
	
	var hsrpstart 			= $("#edit_componentType_HSRP_Start").val();
	var hsrpend 			= $("#edit_componentType_HSRP_End").val();
	var hsrpmax 			= $("#edit_componentType_HSRP_Max").val();
	
	var staticRoutesstart 	= $("#edit_componentType_StaticRoutes_Start").val();
	var staticRoutesend 	= $("#edit_componentType_StaticRoutes_End").val();
	var staticRoutesmax 	= $("#edit_componentType_StaticRoutes_Max").val();
	
	var specialCharsforVersions = "!#@$%^&*()+=-[]\\\';,/{}|\":<>?";
	 for (var i = 0; i < specialCharsforVersions.length; i++) {
		 if (version.indexOf(specialCharsforVersions.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! Version should not contain special charcters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		} 
		if (subVersion.indexOf(specialCharsforVersions.charAt(i)) != -1) {
	    	bootbox.alert("Sorry..! SubVersion should not contain special charcters.").find("div.modal-content").addClass("modalfailure");
	       	return;
		} 
	 }
	
	var specialChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
		for (var i = 0; i < specialChars.length; i++) {
			if (vrfstart.indexOf(specialChars.charAt(i)) != -1 || vrfend.indexOf(specialChars.charAt(i)) != -1 || vrfmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! VRF should not contain special characters.Allow only Digits").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    
		    if (bgpPeersstart.indexOf(specialChars.charAt(i)) != -1 || bgpPeersend.indexOf(specialChars.charAt(i)) != -1 || bgpPeersmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! BGP should not contain special characters.Allow only Digits").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    if (vlanstart.indexOf(specialChars.charAt(i)) != -1 || vlanend.indexOf(specialChars.charAt(i)) != -1 || vlanmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! VLAN  should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    if (hsrpstart.indexOf(specialChars.charAt(i)) != -1 || hsrpend.indexOf(specialChars.charAt(i)) != -1 || hsrpmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! hsrp should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    if (staticRoutesstart.indexOf(specialChars.charAt(i)) != -1 || staticRoutesend.indexOf(specialChars.charAt(i)) != -1 || staticRoutesmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! Static Routes should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		}
	 
	if(type=="NEXUS" && version.trim()!="" && subVersion.trim()!=""){
		 
		var validate =validateThresholdValuesEdit(parseInt(vrfstart), parseInt(vrfend), parseInt(vrfmax), "VRF"); 
		 if(!validate){
			 return;
		 } 
		 validate = validateThresholdValuesEdit(parseInt(bgpPeersstart), parseInt(bgpPeersend), parseInt(bgpPeersmax), "BGP Peers");
		 if(!validate){
			 return;
		 } 
		 validate = validateThresholdValuesEdit(parseInt(vlanstart), parseInt(vlanend), parseInt(vlanmax), "VLAN");
		 if(!validate){
			 return;
		 } 
		 validate = validateThresholdValuesEdit(parseInt(hsrpstart), parseInt(hsrpend), parseInt(hsrpmax), "HSRP");
		 if(!validate){
			 return;
		 } 
		 validate = validateThresholdValuesEdit(parseInt(staticRoutesstart), parseInt(staticRoutesend), parseInt(staticRoutesmax), "Static Routes");
		 if(!validate){
			 return;
		 } 
		 
	} 
	
	var data = 	'id='+ encodeURIComponent($.trim(id))
				+'&&dataCenterId='+ encodeURIComponent($.trim(dataCenterId))
				+'&&type='+ encodeURIComponent($.trim(type))
				+'&&version='+ encodeURIComponent($.trim(version))
				+'&&subVersion='+ encodeURIComponent($.trim(subVersion))
				
				+'&&vrfMax='+ encodeURIComponent($.trim(vrfmax))
				+'&&vrfWarnStart='+ encodeURIComponent($.trim(vrfstart))
				+'&&vrfWarnEnd='+ encodeURIComponent($.trim(vrfend))
					
				+'&&bgpPeersMax='+ encodeURIComponent($.trim(bgpPeersmax))
				+'&&bgpPeersWarnStart='+ encodeURIComponent($.trim(bgpPeersstart))
				+'&&bgpPeersWarnEnd='+ encodeURIComponent($.trim(bgpPeersend))
					
				+'&&vlanMax='+ encodeURIComponent($.trim(vlanmax))
				+'&&vlanWarnStart='+ encodeURIComponent($.trim(vlanstart))
				+'&&vlanWarnEnd='+ encodeURIComponent($.trim(vlanend))
					
				+'&&hsrpMax='+ encodeURIComponent($.trim(hsrpmax))
				+'&&hsrpWarnStart='+ encodeURIComponent($.trim(hsrpstart))
				+'&&hsrpWarnEnd='+ encodeURIComponent($.trim(hsrpend))
					
				+'&&staticRoutesMax='+ encodeURIComponent($.trim(staticRoutesmax))
				+'&&staticRoutesWarnStart='+ encodeURIComponent($.trim(staticRoutesstart))
				+'&&staticRoutesWarnEnd='+ encodeURIComponent($.trim(staticRoutesend));
				 
	 
	if(type.trim()=="" || type.trim()=="--select--"){
    	bootbox.alert("Please specify the Component Type").find("div.modal-content").addClass("modalfailure");
    }else if (version.trim()=="") {
    	bootbox.alert("Please specify the Component Type version").find("div.modal-content").addClass("modalfailure");
    }else if (version.length > 10) {
    	bootbox.alert("Sorry..! Version should not contain more than 10 characters").find("div.modal-content").addClass("modalfailure");
    }else  if (subVersion.trim()=="") {
    	bootbox.alert("Please specify the Component Type sub Version").find("div.modal-content").addClass("modalfailure");
    }else if (subVersion.length > 10) {
    	bootbox.alert("Sorry..! Sub version should not contain more than 10 characters").find("div.modal-content").addClass("modalfailure");
    }	
    else  {
		bootbox.confirm({
			 buttons: {
			  		 confirm: {
			    		label: 'YES',
		        	},
			        cancel: {
			            label: 'NO',
			        }
			    },
				
		    message: 'Are you sure you want to save this changes?',

			  callback: function(result) {
		    	  if(result) {	
		    		  $.ajax({
						url : "componentType/update",
						data : data,
						type : "POST",
						success : function(editComponentType) {
							//alert(editComponentType);
							if(editComponentType=="success"){
								bootbox.alert("Component type Updated Successfully.",function(){window.location = "componentType?dataCenterId="+dataCenterId;
								}).find("div.modal-content").addClass("modalsuccess");
							}
							else{
								bootbox.alert(editComponentType).find("div.modal-content").addClass("modalfailure");
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
	}
});
});
function checkComponentType(){
	
	var componentType = $("#edit_componentType").val();
	//alert(componentType);
	if(componentType=="NEXUS"){
		document.getElementById('editComponent_intro').style.height  = '670px';
		$("#rowEdit_Threshold_Names").show();
		$("#rowEdit_Column_Names").show();
		$("#rowEdit_componentType_VRF").show();
		$("#rowEdit_componentType_BGP").show();
		$("#rowEdit_componentType_VLAN").show();
		$("#rowEdit_componentType_HSRP").show();
		$("#rowEdit_componentType_StaticRoutes").show();
		
		$("#edit_componentType_VRF").val("");
		$("#edit_componentType_BGP").val("");
		$("#edit_componentType_VLAN").val("");
		$("#edit_componentType_HSRP").val("");
		$("#edit_componentType_StaticRoutes").val("");
		
	}else if(componentType=="ASA"){
		document.getElementById('editComponent_intro').style.height  = '315px';
		$("#rowEdit_Threshold_Names").hide();
		$("#rowEdit_Column_Names").hide();
		$("#rowEdit_componentType_VRF").hide();
		$("#rowEdit_componentType_BGP").hide();
		$("#rowEdit_componentType_VLAN").hide();
		$("#rowEdit_componentType_HSRP").hide();
		$("#rowEdit_componentType_StaticRoutes").hide();
		
	}else if(componentType=="VCENTER"){
		document.getElementById('editComponent_intro').style.height  = '315px';
		$("#rowEdit_Threshold_Names").hide();
		$("#rowEdit_Column_Names").hide();
		$("#rowEdit_componentType_VRF").hide();
		$("#rowEdit_componentType_BGP").hide();
		$("#rowEdit_componentType_VLAN").hide();
		$("#rowEdit_componentType_HSRP").hide();
		$("#rowEdit_componentType_StaticRoutes").hide();
		
	}else{
		document.getElementById('editComponent_intro').style.height  = '315px';
		$("#rowEdit_Threshold_Names").hide();
		$("#rowEdit_Column_Names").hide();
		$("#rowEdit_componentType_VRF").hide();
		$("#rowEdit_componentType_BGP").hide();
		$("#rowEdit_componentType_VLAN").hide();
		$("#rowEdit_componentType_HSRP").hide();
		$("#rowEdit_componentType_StaticRoutes").hide();
		
		$("#edit_componentType_VRF").val("");
		$("#edit_componentType_BGP").val("");
		$("#edit_componentType_VLAN").val("");
		$("#edit_componentType_HSRP").val("");
		$("#edit_componentType_StaticRoutes").val("");
		
	}
		 
}
function loadEditComponentType(componentTypeId){
		var data = "id="+encodeURIComponent($.trim(componentTypeId));
		$.ajax({
			url : "componentType/getType",
			data : data,
			type : "POST",
			success : function(result) {
				var  checkTypeAssociatedWithComponent =result['associatedwithcomponenttype'];
				var  type =result['componenttype'];
				if(checkTypeAssociatedWithComponent){
					 $("#edit_componentType1").val($.trim(type));
					 $('#edit_componentType').hide();
					 $('#edit_componentType1').show();
					  
				 }else{
					 var  type =result['componenttype'];
					 $('#edit_componentType1').hide();
					 $("#edit_componentType").append(type);
					 $('#edit_componentType').show();
					 
				} 
			}
		});
	}
function allowOnlyNumbers(e) {
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
 
 function validateThresholdValuesEdit(start, end, max, type){
	 if (isNaN(start)){
			bootbox.alert("Please specify the " + type + " Start of the Component").find("div.modal-content").addClass("modalfailure");
	    return false;
	 }else if (isNaN(end)){
			bootbox.alert("Please specify the " + type + " Alert of the Component").find("div.modal-content").addClass("modalfailure");
	    return false;
	 }else if (isNaN(max)){
			bootbox.alert("Please specify the " + type + " Max of the Component").find("div.modal-content").addClass("modalfailure");
	    return false;
	 }else if(start > end){
		bootbox.alert("Warning value is greater than Alert value of " + type).find("div.modal-content").addClass("modalfailure");
		return false;
    }else if(start > max){
		bootbox.alert("Warning value is greater than Max value of " + type).find("div.modal-content").addClass("modalfailure");
		return false;
    }else if(end > max){
    	 
		bootbox.alert("Alert value is greater than Max value of " + type).find("div.modal-content").addClass("modalfailure");
		return false;
    } 
     
    return true;   
 }
</script>
</html>