<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>View Component Type</title>
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
	<form id="view_componentType_form" style="color: #7694b7">
		<h3 class="edit_title">View Component Type</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			 
			<tr>
				<td>
					<p>Type</p>
				</td>
				<td>
					<select id="view_componentType" class="nonEditable" disabled="disabled">
						<option value="--select--">--select--</option>
						<c:forEach var="componentTypeEnum" items="${componentTypesEnumlist}">
							<option value="${componentTypeEnum}">${componentTypeEnum}</option>
						</c:forEach>
					</select>	
					<input type="hidden" id="view_componentTypeId" class="projectName" maxlength="100">
				</td>
			</tr>
			
			<tr>
				<td>
					<p>Version</p>
				</td>
				<td>
					<input type="text" id="view_componentType_Version" class="nonEditable" disabled="disabled" maxlength="100">
				</td>
			</tr>
			
			<tr>
				<td>
					<p>Sub Version</p>
				</td>
				<td>
					<input type="text" id="view_componentType_SubVersion" class="nonEditable" disabled="disabled" maxlength="100">
				</td>
			</tr>
			</table>
			<table>	
			<tr id="rowView_Threshold_Names" hidden="true">
			<td width=150px;>
				<b>Threshold Values</b>
			</td>
		</tr>
		<tr id="rowView_Column_Names" hidden="true">	
			 <td></td>
			<td rowspan=1 width="60px;">
				WARNING
			</td>
			<td rowspan=1>ALERT</td>
			<td rowspan=1>MAX</td>
			 
		</tr>
			<tr id="rowView_componentType_VRF" >
				<td><p>VRF</p></td>
				<td><input type="text" id="view_componentType_VRF_Start" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;" disabled="disabled"></td>
				<td><input type="text" id="view_componentType_VRF_End" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"  disabled="disabled"></td>
				<td><input type="text" id="view_componentType_VRF_Max" class="prefix_input" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"  disabled="disabled"></td>
			</tr>
			
			<tr id="rowView_componentType_BGP">
				<td><p>BGP peers</p></td>
				<td><input type="text" id="view_componentType_BGP_Start" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;" ></td>
				<td><input type="text" id="view_componentType_BGP_End" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;" ></td>
				<td><input type="text" id="view_componentType_BGP_Max" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;" ></td>
			</tr>
			
			<tr id="rowView_componentType_VLAN">
				<td><p>VLAN</p></td>
				<td><input type="text" id="view_componentType_VLAN_Start" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
				<td><input type="text" id="view_componentType_VLAN_End" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
				<td><input type="text" id="view_componentType_VLAN_Max" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
			</tr>
			
			<tr id="rowView_componentType_HSRP">
				<td><p>HSRP</p></td>
				<td><input type="text" id="view_componentType_HSRP_Start" class="prefix_input"  disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
				<td><input type="text" id="view_componentType_HSRP_End" class="prefix_input"  disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
				<td><input type="text" id="view_componentType_HSRP_Max" class="prefix_input"  disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
			</tr>
			
			<tr id="rowView_componentType_StaticRoutes">
				<td><p>Static routes</p></td>
				<td><input type="text" id="view_componentType_StaticRoutes_Start" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
				<td><input type="text" id="view_componentType_StaticRoutes_End" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
				<td><input type="text" id="view_componentType_StaticRoutes_Max" class="prefix_input" disabled="disabled" style="border:1px solid #7694b7; width: 50px;height:25px; background-color: #D5DEE9 !important;"></td>
			</tr>
			</table>
			 
		<table>	
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px;  width: 80px;height: 35px;" type="reset" class="edit_cancel_button" data-dismiss="modal"></button>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$(".componentType_view").click(function(){
		 
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(0).text();
		var type = tr.find('td').eq(1).text();
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
		 
		 
		if($.trim(type)=="NEXUS"){
			document.getElementById('viewComponent_intro').style.height  = '670px';
			$("#view_componentTypeId").val($.trim(id));
			//$("#edit_componentName").val($.trim(name));
			$("#view_componentType").val($.trim(type));
			$("#view_componentType_Version").val($.trim(version));
			$("#view_componentType_SubVersion").val($.trim(subVersion));
			
			$("#view_componentType_VRF_Start").val($.trim(vrfstart));
			$("#view_componentType_VRF_End").val($.trim(vrfend));
			$("#view_componentType_VRF_Max").val($.trim(vrfmax));
			
			$("#view_componentType_BGP_Start").val($.trim(bgpPeersstart));
			$("#view_componentType_BGP_End").val($.trim(bgpPeersend));
			$("#view_componentType_BGP_Max").val($.trim(bgpPeersmax));
			
			$("#view_componentType_VLAN_Start").val($.trim(vlanstart));
			$("#view_componentType_VLAN_End").val($.trim(vlanend));
			$("#view_componentType_VLAN_Max").val($.trim(vlanmax));
			
			$("#view_componentType_HSRP_Start").val($.trim(hsrpstart));
			$("#view_componentType_HSRP_End").val($.trim(hsrpend));
			$("#view_componentType_HSRP_Max").val($.trim(hsrpmax));
			
			$("#view_componentType_StaticRoutes_Start").val($.trim(staticRoutesstart));
			$("#view_componentType_StaticRoutes_End").val($.trim(staticRoutesend));
			$("#view_componentType_StaticRoutes_Max").val($.trim(staticRoutesmax));
			
			$("#componentType_dataCenterId").val($.trim(dataCenterId));
			
			$("#rowView_Threshold_Names").show();
			$("#rowView_Column_Names").show();
			$("#rowView_componentType_VRF").show();
			$("#rowView_componentType_BGP").show();
			$("#rowView_componentType_VLAN").show();
			$("#rowView_componentType_HSRP").show();
			$("#rowView_componentType_StaticRoutes").show();
			
		}else if($.trim(type)=="ASA"){
			document.getElementById('viewComponent_intro').style.height  = '315px';
			$("#view_componentTypeId").val($.trim(id));
			$("#view_componentType").val($.trim(type));
			$("#view_componentType_Version").val($.trim(version));
			$("#view_componentType_SubVersion").val($.trim(subVersion));
			 
			$("#rowView_Threshold_Names").hide();
			$("#rowView_Column_Names").hide();
			$("#rowView_componentType_VRF").hide();
			$("#rowView_componentType_BGP").hide();
			$("#rowView_componentType_VLAN").hide();
			$("#rowView_componentType_HSRP").hide();
			$("#rowView_componentType_StaticRoutes").hide();
			
		}else if($.trim(type)=="VCENTER"){
			document.getElementById('viewComponent_intro').style.height  = '315px';
			$("#view_componentTypeId").val($.trim(id));
			$("#view_componentType").val($.trim(type));
			$("#view_componentType_Version").val($.trim(version));
			$("#view_componentType_SubVersion").val($.trim(subVersion));
			 
			$("#rowView_Threshold_Names").hide();
			$("#rowView_Column_Names").hide();
			$("#rowView_componentType_VRF").hide();
			$("#rowView_componentType_BGP").hide();
			$("#rowView_componentType_VLAN").hide();
			$("#rowView_componentType_HSRP").hide();
			$("#rowView_componentType_StaticRoutes").hide();
			  
		}
		
	}); 
	
	$(".view_cancel_button").click(function(){
		$('#view_componentType_form').trigger("reset");
	});
	
 
});
</script>
</html>