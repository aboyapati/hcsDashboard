<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<style type="text/css">
	#help_modal .Left_sub_heading {
		margin-left: 25px;
	}

	#help_modal .left_links {
		margin-bottom:5px;
		margin-left: 15px; 
	}
	#help_modal .left_links_selected {
		margin-bottom:5px;
		margin-left: 15px;
		margin-right: 35px;
	}
	#help_modal .account_heading{
		margin-bottom: 20px;
	}
	#help_modal .myprofile_heading_text{
		margin-left: 0px;
		font-size: 25px;
	}
	
	.startUpGuideLi span {
		color: #ff0000;
 	}
	
	.startUpGuideLi a{
		text-decoration: none;
		color: rgb(162,162,162);
		cursor: pointer;
	} 
	.startUpGuideLi {
		display: block;
	    font-family: 'Source Sans Pro';
	    font-weight: 600;
	    font-size: 18px;
	    margin-left: 0px;
	    margin-bottom: 15px;
	    padding-left: 0px;
	    padding-top: 5px;
 	}
 	#help_modal .Left_sub_heading{
 		margin-bottom: 10px;
 	} 
 	.help_paragraph {
	 	font-size: 16px;
		font-family:'Source Sans Pro';
		line-height: 35px;
    	text-align: justify;
    	padding-right: 10px;
    	color : #7694b7
 	}
 	.help_bold{
 		font-weight: 800;
 		font-size: 18px;
	}
	#help_info_desc {
   		width:690px; 
   		height: 550px; 
   		overflow: auto;
   		padding-right: 5px;
   		color: rgb(81,81,81);
   		line-height: 25px;
    }
 	ul.help_li {
        list-style-type: disc;
        line-height: 20px;
    }
    ol.help_decimal {
        list-style-type: decimal;
    }
    #help_modal .myaccount_left_panel{
   		 width:225px;
    }
    #help_modal .myaccount_right_panel{
   		 width:796px;
    }
    #help_modal img{
   		margin-left: 55px;
   	}
   	.help_modal_img{
   		border: 5px solid #000000;
   	}
   	#help_modal .myprofile_popup{
   		padding-left: 25px;
   	}
   	
</style>
	

<div class="modal fade" id="help_modal" role="dialog">
  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 960px;height: 725px;margin-bottom: 0px;">
	<!-- Modal content-->
	<div class="modal-content" style="height: inherit;">
	  <div class="modal-body" style="padding:0px;">
 		<div class="myaccount_left_panel">
		  		<h3 class="account_heading" style="font-size: 25px;margin-left: 25px">Help</h3>
		  		<input type="hidden" id="totalTabs" value = "12"/>
		  		<div style="height: 550px; overflow: auto;">
		  			<div onclick="display_Introduction()" class="Left_sub_heading" style="cursor: pointer; margin-bottom: 20px;">Introduction</div>
		  			<div onclick="display_accountManagementInfo()" style="cursor: pointer;" class="Left_sub_heading">Account Management</div>
		  				 <div id="help_addUser_link" class="left_links" onclick="display_addUser_info()">Add User
						  </div>
			  		<div onclick="display_Infrastructure_Prep_and_Setup()"  style="cursor: pointer;" class="Left_sub_heading">Onboarding an onPoint Link</div>
				  	<div class="Left_sub_division">
				  	 <div id="help_callServer_link" class="left_links" onclick="display_call_server()">Call Servers
						  </div>
						  <div id="help_site_link" class="left_links" onclick="display_site_info()">Sites
						  </div>
						  <div id="help_phone_link" class="left_links" onclick="display_phone()">Phones
						  </div>
						  <div id="help_onPointLink_link" class="left_links" onclick="display_onPointLink()">onPOINT Links
						  </div>
						 
				   	</div>
				  	<div onclick="display_Usage()"  style="cursor: pointer;" class="Left_sub_heading">Project Creation, Execution & Reporting</div>
				  	<div class="Left_sub_division">
						 
						  <!-- <div id="help_phoneList_link" class="left_links" onclick="display_phoneList()">Phone list creation
						  </div> -->
						 <div id="help_dhcpScan_link" class="left_links" onclick="display_dhcpScan()">Dhcp Scan
						  </div>
						  <div id="help_createProject_link" class="left_links" onclick="display_createProject()">Project creation
						  </div>
						  <div id="help_scheduleRun_link" class="left_links" onclick="display_scheduleRun()">Project Scheduling
						  </div>
						 <div id="help_onDemand_link" class="left_links" onclick="display_onDemandRun()">On Demand
						  </div>
					</div>
					
				</div>
		  		 <div class="myaccount_exit_button"  data-dismiss="modal" style="bottom: 30px !important;"></div>
		 </div>
		 <div class="myaccount_right_panel">
		   <div id="help_introduction_Info" class="myprofile_popup" style="margin: 0px; display: none">
			  	 <%@include file="help_startUpGuide.jsp" %>
		  </div>
		  <div id="help_accountManagement_Info" class="myprofile_popup" style="margin: 0px; display: none">
			  	 <%@include file="help_accountManagementInfo.jsp" %>
		  </div>
		  <div id="help_addUser_Info" class="myprofile_popup" style="margin: 0px; display: none">
			  	 <%@include file="help_addUserInfo.jsp" %>
		  </div>
		  
		  <div id="help_callServer_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	 <%@include file="help_callServerInfo.jsp" %>
		  </div>
		  <div id="help_Infrastructure_Prep_and_Setup" class="myprofile_popup" style="margin: 0px; display: none">
			  	 <%@include file="help_onboarding_Info.jsp" %>
		  </div>
		   <div id="help_site_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	
			  	  <%@include file="help_siteInfo.jsp" %>
		  </div>
		  <div id="help_phone_info" class="myprofile_popup" style="margin: 0px; display: none">
			  
			  	 <%@include file="help_phoneInfo.jsp" %>
		  </div>
		  <div id="help_onPointLink_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	
			  	 <%@include file="help_onPointLinkInfo.jsp" %> 
		  </div>
		  
		  <div id="help_Usage" class="myprofile_popup" style="margin: 0px; display: none">
			  	 <%@include file="help_usageInfo.jsp" %>
			  	
		  </div>
		  
		 <%--  <div id="help_phoneList_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	
			  	  <%@include file="help_phoneListCreationInfo.jsp" %> 
		  </div> --%>
		  <div id="help_dhcpScan_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	
			  	 <%@ include file="help_dhcpScanInfo.jsp" %>
		  </div>
		  <div id="help_createProject_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	
			  	  <%@include file="help_projectCreationInfo.jsp" %> 
		  </div>
		  <div id="help_scheduleRun_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	 
			  	  <%@include file="help_scheduleInfo.jsp" %> 
		  </div>
		  <div id="help_onDemand_info" class="myprofile_popup" style="margin: 0px; display: none">
			  	
			  	  <%@include file="help_onDemandInfo.jsp" %> 
		  </div>
		   
		</div>	
	  </div>
	</div>
  </div>
</div> 
<script type="text/javascript">

function showHelp(){
	display_Introduction();
	$('#help_modal').modal('show');
}

function display_Introduction(){
	$('#help_introduction_Info').css('display', 'block');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links"; 
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
	
}


function display_accountManagementInfo(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'block');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	
}

function display_addUser_info(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'block');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links"; 
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	 document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links_selected";
}



function display_Infrastructure_Prep_and_Setup(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'block');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_site_info(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'block');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links_selected";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_call_server(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'block');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links_selected";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
 	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_phone(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'block');
	$('#help_onPointLink_info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links_selected";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_onPointLink(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'block');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links_selected";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}
function display_Usage(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_Usage').css('display', 'block');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	 document.getElementById("help_onPointLink_link").className = "left_links";
	 /* document.getElementById("help_phoneList_link").className = "left_links"; */
	 document.getElementById("help_dhcpScan_link").className = "left_links";
	 document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}
function display_captureServer(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	$('#help_captureServer_info').css('display', 'block');
	$('#help_service_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_addPhones_info').css('display', 'none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_report_info').css('display', 'none');
	$('#help_graph_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	document.getElementById("help_captureServer_link").className = "left_links_selected";
	document.getElementById("help_service_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_addPhones_link").className = "left_links";
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_report_link").className = "left_links";
	document.getElementById("help_graph_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_service(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	$('#help_captureServer_info').css('display', 'none');
	$('#help_service_info').css('display', 'block');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_addPhones_info').css('display', 'none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_report_info').css('display', 'none');
	$('#help_graph_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	document.getElementById("help_captureServer_link").className = "left_links";
	document.getElementById("help_service_link").className = "left_links_selected";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_addPhones_link").className = "left_links";
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_report_link").className = "left_links";
	document.getElementById("help_graph_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_phoneList(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'block'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');

	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links_selected"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_addPhones(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	$('#help_captureServer_info').css('display', 'none');
	$('#help_service_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_addPhones_info').css('display', 'block');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_report_info').css('display', 'none');
	$('#help_graph_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	document.getElementById("help_captureServer_link").className = "left_links";
	document.getElementById("help_service_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_addPhones_link").className = "left_links_selected";
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_report_link").className = "left_links";
	document.getElementById("help_graph_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_dhcpScan(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','block');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links_selected";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
	
}


function display_createProject(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'block');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links_selected";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
	
}

function display_scheduleRun(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'block');
	$('#help_onDemand_info').css('display', 'none');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links_selected";
	document.getElementById("help_onDemand_link").className = "left_links";
	document.getElementById("help_addUser_link").className = "left_links";
}

function display_onDemandRun(){
	$('#help_introduction_Info').css('display', 'none');
	$('#help_accountManagement_Info').css('display', 'none');
	$('#help_Infrastructure_Prep_and_Setup').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	$('#help_license_info').css('display', 'none');
	$('#help_callServer_info').css('display', 'none');
	$('#help_site_info').css('display', 'none');
	$('#help_phone_info').css('display', 'none');
	$('#help_onPointLink_info').css('display', 'none');
	/* $('#help_phoneList_info').css('display', 'none'); */
	$('#help_dhcpScan_info').css('display','none');
	$('#help_createProject_info').css('display', 'none');
	$('#help_scheduleRun_info').css('display', 'none');
	$('#help_onDemand_info').css('display', 'block');
	$('#help_Usage').css('display', 'none');
	$('#help_addUser_Info').css('display', 'none');
	
	document.getElementById("help_callServer_link").className = "left_links";
	document.getElementById("help_site_link").className = "left_links";
	document.getElementById("help_phone_link").className = "left_links";
	document.getElementById("help_onPointLink_link").className = "left_links";
	/* document.getElementById("help_phoneList_link").className = "left_links"; */
	document.getElementById("help_dhcpScan_link").className = "left_links";
	document.getElementById("help_createProject_link").className = "left_links";
	document.getElementById("help_scheduleRun_link").className = "left_links";
	document.getElementById("help_onDemand_link").className = "left_links_selected";
	document.getElementById("help_addUser_link").className = "left_links";
}






</script>