<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Component Type</title>
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
	<form id="add_componentType_form" style="color: #7694b7">
		<h3 class="edit_title">Add Component Type</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			 
			<tr>
				<td>
					<p>Type<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="add_componentType" class="testplan_select" onchange="checkAddComponentType()">
						<option value="--select--">--select--</option>
						<c:forEach var="componentTypeEnum" items="${componentTypesEnumlist}">
							<option value="${componentTypeEnum}">${componentTypeEnum}</option>
						</c:forEach>
					</select>	
				</td>
			</tr>
			
			<tr>
				<td>
					<p>Version<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_componentType_Version" class="projectName" maxlength="10">
				</td>
			</tr>
			
			<tr>
				<td>
					<p>Sub Version<text style="color:red">*</text></p>
				</td>
				<td>
					<input type="text" id="add_componentType_SubVersion" class="projectName" maxlength="10">
				</td>
			</tr>
			</table>
	<table border=0 >
		<tr id="row_Threshold_Names" hidden="true">
			<td width=150px;>
				<b>Threshold Values</b> 
			</td>
		</tr>
		<tr id="row_Column_Names" hidden="true">	
			 <td></td>
			<td rowspan=1 width="60px;">
				WARNING
			</td>
			<td rowspan=1>ALERT</td>
			<td rowspan=1>MAX</td>
			 
		</tr>
		<tr id="row_componentType_VRF" hidden="true" >
		 
		<td>VRF<text style="color:red">*</text>  </td>
				<td><input type="text" id="add_componentType_VRF_Start"  class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_VRF_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_VRF_Max" class="prefix_input"  style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
		</tr>
		<tr id="row_componentType_BGP" hidden="true">
		 
		<td>BGP<text style="color:red">*</text>  </td>
				<td><input type="text" id="add_componentType_BGP_Start"  class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_BGP_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_BGP_Max" class="prefix_input"  style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
		</tr>
		<tr id="row_componentType_VLAN" hidden="true">
		 
		<td>Vlan<text style="color:red">*</text></td>
				<td><input type="text" id="add_componentType_VLAN_Start"  class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_VLAN_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_VLAN_Max" class="prefix_input"  style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
		</tr>
		<tr id="row_componentType_HSRP" hidden="true">
		 
		<td>Hsrp<text style="color:red">*</text> </td>
				<td><input type="text" id="add_componentType_HSRP_Start"  class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_HSRP_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_HSRP_Max" class="prefix_input"  style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
		</tr>
		<tr id="row_componentType_StaticRoutes" hidden="true">
		 
		<td>Static Router<text style="color:red">*</text> </td>
				<td><input type="text" id="add_componentType_StaticRoutes_Start"  class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_StaticRoutes_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
				<td><input type="text" id="add_componentType_StaticRoutes_Max" class="prefix_input"  style="border:1px solid #7694b7; width: 50px;height:25px;" maxlength="6" onkeypress="return allowOnlyNumbers(event)"></td>
		</tr>
		 
	</table>
			 
		<table>	
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px; width: 80px;height: 35px; margin-left: -35px;" type="reset" class="add_cancel_button" data-dismiss="modal"></button>
					<div id="addComponentType" class="add_save_button"  style="width: 80px;height: 35px; margin-left: 70px; margin-top: -35px;"></div>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	$("#addComponentType").click(function(){
		
		var dataCenterId 	= $("#componentType_dataCenterId").val();
		//alert(dataCenterId);
		var type 			= $("#add_componentType").val();
		var version 		= $("#add_componentType_Version").val();
		var subVersion 		= $("#add_componentType_SubVersion").val();
		
		var vrfwarnstart 	= $("#add_componentType_VRF_Start").val();
		var vrfwarnend 		= $("#add_componentType_VRF_End").val();
		var vrfmax 			= $("#add_componentType_VRF_Max").val();
		
		var bgppeerswarnstart= $("#add_componentType_BGP_Start").val();
		var bgppeerswarnend = $("#add_componentType_BGP_End").val();
		var bgppeersmax 	= $("#add_componentType_BGP_Max").val();
		
		var vlanwarnstart 	= $("#add_componentType_VLAN_Start").val();
		var vlanwarnend		= $("#add_componentType_VLAN_End").val();
		var vlanmax 		= $("#add_componentType_VLAN_Max").val();
		
		var hsrpwarnstart 	= $("#add_componentType_HSRP_Start").val();
		var hsrpwarnend 	= $("#add_componentType_HSRP_End").val();
		var hsrpmax 		= $("#add_componentType_HSRP_Max").val();
		
		var staticroutestart = $("#add_componentType_StaticRoutes_Start").val();
		var staticrouteend 	= $("#add_componentType_StaticRoutes_End").val();
		var staticroutemax 	= $("#add_componentType_StaticRoutes_Max").val();
		 
		
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
			
			if (vrfwarnstart.indexOf(specialChars.charAt(i)) != -1 || vrfwarnend.indexOf(specialChars.charAt(i)) != -1 || vrfmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! VRF  values should not contain special characters.Allow only Digits").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    
		    if (bgppeerswarnstart.indexOf(specialChars.charAt(i)) != -1 || bgppeerswarnend.indexOf(specialChars.charAt(i)) != -1 || bgppeersmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! BGP should not contain special characters.Allow only Digits").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    if (vlanwarnstart.indexOf(specialChars.charAt(i)) != -1 || vlanwarnend.indexOf(specialChars.charAt(i)) != -1 || vlanmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! VLAN  should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    if (hsrpwarnstart.indexOf(specialChars.charAt(i)) != -1 || hsrpwarnend.indexOf(specialChars.charAt(i)) != -1 || hsrpmax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! hsrp should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    }
		    if (staticroutestart.indexOf(specialChars.charAt(i)) != -1 || staticrouteend.indexOf(specialChars.charAt(i)) != -1 || staticroutemax.indexOf(specialChars.charAt(i)) != -1) {
		    	bootbox.alert("Sorry..! Static Routes should not contain special characters.").find("div.modal-content").addClass("modalfailure");
		       	return;
		    } 
		} 
	    if(type=="NEXUS" && version.trim()!="" && subVersion.trim()!=""){			
			var validate = validateThresholdValues(parseInt(vrfwarnstart), parseInt(vrfwarnend), parseInt(vrfmax), "VRF");
			if(!validate){
				 return;
			 } 
			validate = validateThresholdValues(parseInt(bgppeerswarnstart), parseInt(bgppeerswarnend), parseInt(bgppeersmax), "BGP Peers");
			if(!validate){
				 return;
			 } 
			validate = validateThresholdValues(parseInt(vlanwarnstart), parseInt(vlanwarnend), parseInt(vlanmax), "VLAN");
			if(!validate){
				 return;
			 } 
			validate = validateThresholdValues(parseInt(hsrpwarnstart), parseInt(hsrpwarnend), parseInt(hsrpmax), "HSRP");
			if(!validate){
				 return;
			 } 
			validate = validateThresholdValues(parseInt(staticroutestart), parseInt(staticrouteend), parseInt(staticroutemax), "Static Routes");
			 if(!validate){
				 return;
			 }
		}    
		var data = 	'dataCenterId='+ encodeURIComponent($.trim(dataCenterId))
					 
					+'&&type='+ encodeURIComponent($.trim(type))
					+'&&version='+ encodeURIComponent($.trim(version))
					+'&&subVersion='+ encodeURIComponent($.trim(subVersion))
					
					+'&&vrfMax='+ encodeURIComponent($.trim(vrfmax))
					+'&&vrfWarnStart='+ encodeURIComponent($.trim(vrfwarnstart))
					+'&&vrfWarnEnd='+ encodeURIComponent($.trim(vrfwarnend))
					
					+'&&bgpPeersMax='+ encodeURIComponent($.trim(bgppeersmax))
					+'&&bgpPeersWarnStart='+ encodeURIComponent($.trim(bgppeerswarnstart))
					+'&&bgpPeersWarnEnd='+ encodeURIComponent($.trim(bgppeerswarnend))
					
					+'&&vlanMax='+ encodeURIComponent($.trim(vlanmax))
					+'&&vlanWarnStart='+ encodeURIComponent($.trim(vlanwarnstart))
					+'&&vlanWarnEnd='+ encodeURIComponent($.trim(vlanwarnend))
					
					+'&&hsrpMax='+ encodeURIComponent($.trim(hsrpmax))
					+'&&hsrpWarnStart='+ encodeURIComponent($.trim(hsrpwarnstart))
					+'&&hsrpWarnEnd='+ encodeURIComponent($.trim(hsrpwarnend))
					
					+'&&staticRoutesMax='+ encodeURIComponent($.trim(staticroutemax))
					+'&&staticRoutesWarnStart='+ encodeURIComponent($.trim(staticroutestart))
					+'&&staticRoutesWarnEnd='+ encodeURIComponent($.trim(staticrouteend));
		 
		  
		if(type.trim()=="" || type.trim()=="--select--"){
	    	bootbox.alert("Please specify the Component Type").find("div.modal-content").addClass("modalfailure");
	    	 return;
	    }else if (version.trim()=="") {
	    	bootbox.alert("Please specify the Component Type version").find("div.modal-content").addClass("modalfailure");
	    	 return;
	    }else if (version.length > 10) {
	    	bootbox.alert("Sorry..! Version should not contain more than 10 characters").find("div.modal-content").addClass("modalfailure");
	    }else  if (subVersion.trim()=="") {
	    	bootbox.alert("Please specify the Component Type sub Version").find("div.modal-content").addClass("modalfailure");
	    	 return;
	    }else if (subVersion.length > 10) {
	    	bootbox.alert("Sorry..! Sub version should not contain more than 10 characters").find("div.modal-content").addClass("modalfailure");
	    }	
	   	else {
			bootbox.confirm({
				 buttons: {
				  		 confirm: {
				    		label: 'YES',
			        	},
				        cancel: {
				            label: 'NO',
				        }
				    },
					
			    message: 'Are you sure you want to add this Component Type?',
	
				callback: function(result) {
			    	if(result) {	
			    		  $.ajax({
							url : "componentType/add",
							data : data,
							type : "POST",
							success : function(componenTypeResult) {
								if(componenTypeResult=="success"){ 
									bootbox.alert("Component Type created successfully.",function(){window.location = "componentType?dataCenterId="+dataCenterId;
									}).find("div.modal-content").addClass("modalsuccess");
								}
								else{
									bootbox.alert(componenTypeResult).find("div.modal-content").addClass("modalfailure");
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
	
	$(".add_cancel_button").click(function(){
			$("#row_componentType_VRF").hide();
			$("#row_componentType_BGP").hide();
			$("#row_componentType_VLAN").hide();
			$("#row_componentType_HSRP").hide();
			$("#row_componentType_StaticRoutes").hide();
			$("#row_Threshold_Names").hide();
			$("#row_Column_Names").hide();
			document.getElementById('createComponent_intro').style.height  = '315px';
		$('#add_componentType_form').trigger("reset");
	});
	 
});
function checkAddComponentType(){
	var componentType = $("#add_componentType").val();
	if(componentType=="NEXUS"){
		document.getElementById('createComponent_intro').style.height  = '670px';
		$("#row_componentType_VRF").show();
		$("#row_componentType_BGP").show();
		$("#row_componentType_VLAN").show();
		$("#row_componentType_HSRP").show();
		$("#row_componentType_StaticRoutes").show();
		$("#row_Threshold_Names").show();
		$("#row_Column_Names").show();
		
		$("#add_componentType_VRF_Start").val("");
		$("#add_componentType_VRF_End").val("");
		$("#add_componentType_VRF_Max").val("");
		
		$("#add_componentType_BGP_Start").val("");
		$("#add_componentType_BGP_End").val("");
		$("#add_componentType_BGP_Max").val("");
		
		$("#add_componentType_VLAN_Start").val("");
		$("#add_componentType_VLAN_End").val("");
		$("#add_componentType_VLAN_Max").val("");
		
		$("#add_componentType_HSRP_Start").val("");
		$("#add_componentType_HSRP_End").val("");
		$("#add_componentType_HSRP_Max").val("");
		
		$("#add_componentType_StaticRoutes_Start").val("");
		$("#add_componentType_StaticRoutes_End").val("");
		$("#add_componentType_StaticRoutes_Max").val("");
		
	}else if(componentType=="ASA"){
		document.getElementById('createComponent_intro').style.height  = '315px';
		$("#row_componentType_VRF").hide();
		$("#row_componentType_BGP").hide();
		$("#row_componentType_VLAN").hide();
		$("#row_componentType_HSRP").hide();
		$("#row_componentType_StaticRoutes").hide();
		$("#row_Threshold_Names").hide();
		$("#row_Column_Names").hide();
		
	}else if(componentType=="VCENTER"){
		document.getElementById('createComponent_intro').style.height  = '315px';
		$("#row_componentType_VRF").hide();
		$("#row_componentType_BGP").hide();
		$("#row_componentType_VLAN").hide();
		$("#row_componentType_HSRP").hide();
		$("#row_componentType_StaticRoutes").hide();
		$("#row_Threshold_Names").hide();
		$("#row_Column_Names").hide();
		
	}else{
		document.getElementById('createComponent_intro').style.height  = '315px';
		$("#row_componentType_VRF").hide();
		$("#row_componentType_BGP").hide();
		$("#row_componentType_VLAN").hide();
		$("#row_componentType_HSRP").hide();
		$("#row_componentType_StaticRoutes").hide();
		$("#row_Threshold_Names").hide();
		$("#row_Column_Names").hide();
		
		$("#add_componentType_VRF_Start").val("");
		$("#add_componentType_VRF_End").val("");
		$("#add_componentType_VRF_Max").val("");
		
		$("#add_componentType_BGP_Start").val("");
		$("#add_componentType_BGP_End").val("");
		$("#add_componentType_BGP_Max").val("");
		
		$("#add_componentType_VLAN_Start").val("");
		$("#add_componentType_VLAN_End").val("");
		$("#add_componentType_VLAN_Max").val("");
		
		$("#add_componentType_HSRP_Start").val("");
		$("#add_componentType_HSRP_End").val("");
		$("#add_componentType_HSRP_Max").val("");
		
		$("#add_componentType_StaticRoutes_Start").val("");
		$("#add_componentType_StaticRoutes_End").val("");
		$("#add_componentType_StaticRoutes_Max").val("");
		
	}
		 
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
 
function validateThresholdValues(start, end, max, type){
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