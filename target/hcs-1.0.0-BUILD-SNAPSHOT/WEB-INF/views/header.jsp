<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  --%>

<% String local_mb = (String)request.getAttribute("javax.servlet.forward.servlet_path");%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="<c:url value="/resources/css/myaccount.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/addfunds.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/users.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/myprofile.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/adduser.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/transaction_history.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/epam/epam.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/epam/epam_admin.css"/>"/>

 

<%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
%>
<!--  Ticket 35938 Fixed -->

<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>

<script type="text/javascript">
 
function showWelcome(){
	$("#licenseDiv").hide();
	$("#welcomeDiv").show();
	$("#license_modal").modal("show");
}

var userRole = "${userRole}";
var callStateKPI = "${callStateKPI}";
	 function display_myprofile(){
		$.ajax({
			url : "myprofileGet",
			type : "GET",
	
			success : function(myprofile_response) {
					$("#myprofile").html( myprofile_response );
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
		$('#myprofile').css('display', 'block');
		$('#users').css('display', 'none');
		$('#edit_user').css('display', 'none');
		$('#add_user').css('display', 'none');
		$('#myLincese').css('display', 'none');
		$('#app_settings').css('display', 'none');
		
		if(callStateKPI=="on"){
			$('#notification_settings').css('display', 'none');
		}
		
		//$('#app_controls').css('display', 'none');
		$('#app_analytics').css('display', 'none');
		$('#app_settings').css('display', 'none');
		document.getElementById("profile_link").className = "left_links_selected";
		document.getElementById("users_link").className = "left_links";
		if(userRole!="ROLE_ADMIN"){
			document.getElementById("myLincese_link").className = "left_links";
		}
		if(callStateKPI=="on"){
			document.getElementById("notification_settings_link").className = "left_links";
		}
		if(userRole=="ROLE_ADMIN"){
			document.getElementById("app_settings_link").className = "left_links";
			//document.getElementById("app_controls_link").className = "left_links";
			//document.getElementById("app_analytics_link").className = "left_links";
		}
	    $('#payment_form #payment_id_form').trigger("reset");
	} 

	function display_users(){
		$.ajax({
			url : "users",
			type : "GET",
	
			success : function(users_response) {
				 $("#users").html( users_response );
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

		$('#myprofile').css('display', 'none');
		$('#users').css('display', 'block');
		$('#edit_user').css('display', 'none');
		$('#add_user').css('display', 'none');
		$('#myLincese').css('display', 'none');
		if(callStateKPI=="on"){
			$('#notification_settings').css('display', 'none');
		}
		$('#app_settings').css('display', 'none');
		//$('#app_controls').css('display', 'none');
		$('#app_analytics').css('display', 'none');
		$('#app_settings').css('display', 'none');
		document.getElementById("profile_link").className = "left_links";
		document.getElementById("users_link").className = "left_links_selected";
		if(userRole!="ROLE_ADMIN"){
			document.getElementById("myLincese_link").className = "left_links";
		}
		if(callStateKPI=="on"){
			document.getElementById("notification_settings_link").className = "left_links";
		}
		if(userRole=="ROLE_ADMIN"){
			document.getElementById("app_settings_link").className = "left_links";
			//document.getElementById("app_controls_link").className = "left_links";
			//document.getElementById("app_analytics_link").className = "left_links";
		}

		$('#edit_user_form_id').trigger("reset");
	    $('#adduserform_id').trigger("reset");
	}

	function display_edituser(data){
		$.ajax({
			url : "edituser_get",
			data : data,
			type : "POST",
	
			success : function(users_response) {
				 $("#edit_user").html( users_response );
			},
			error : function(xhr, status, error) {
				bootbox.alert("Unknown Error occurred Try again later").find("div.modal-content").addClass("modalfailure");
			}
		});

		$('#myprofile').css('display', 'none');
		$('#users').css('display', 'none');
		$('#edit_user').css('display', 'block');
		$('#add_user').css('display', 'none');
		$('#myLincese').css('display', 'none');
		if(callStateKPI=="on"){
			$('#notification_settings').css('display', 'none');
		}
		$('#app_settings').css('display', 'none');
		//$('#app_controls').css('display', 'none');
		$('#app_analytics').css('display', 'none');

		document.getElementById("profile_link").className = "left_links";
		document.getElementById("users_link").className = "left_links_selected";
		if(userRole!="ROLE_ADMIN"){
			document.getElementById("myLincese_link").className = "left_links";
		}
		if(callStateKPI=="on"){
			document.getElementById("notification_settings_link").className = "left_links";
		}
		if(userRole=="ROLE_ADMIN"){
			document.getElementById("app_settings_link").className = "left_links";
			//document.getElementById("app_controls_link").className = "left_links";
			//document.getElementById("app_analytics_link").className = "left_links";
		}
	}

	function display_adduser(){
		$.ajax({
			url : "addUserGet",
			type : "GET",

			success : function(adduser_response) {
				 $("#add_user").html( adduser_response );
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

		$('#myprofile').css('display', 'none');
		$('#users').css('display', 'none');
		$('#edit_user').css('display', 'none');
		$('#add_user').css('display', 'block');
		$('#myLincese').css('display', 'none');
		if(callStateKPI=="on"){
			$('#notification_settings').css('display', 'none');
		}
		$('#app_settings').css('display', 'none');
		//$('#app_controls').css('display', 'none');
		$('#app_analytics').css('display', 'none');

		document.getElementById("profile_link").className = "left_links";
		document.getElementById("users_link").className = "left_links_selected";
		if(userRole!="ROLE_ADMIN"){
			document.getElementById("myLincese_link").className = "left_links";
		}
		if(callStateKPI=="on"){
			document.getElementById("notification_settings_link").className = "left_links";
		}
		if(userRole=="ROLE_ADMIN"){
			document.getElementById("app_settings_link").className = "left_links";
			//document.getElementById("app_controls_link").className = "left_links";
			//document.getElementById("app_analytics_link").className = "left_links";
		}

	    $('#payment_form #payment_id_form').trigger("reset");
		$('#edit_user_form_id').trigger("reset");
	    $('#adduserform_id').trigger("reset");
	    $('#payment_form #payment_id_form').trigger("reset");
	}
	
	 function display_app_settings(){
		$.ajax({
			url : "appSettings",
			type : "GET",
	
			success : function(myprofile_response) {
					$('#app_settings').unbind("submit");
					$("#app_settings").html( appSettings_response );
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
		$('#myprofile').css('display', 'none');
		$('#users').css('display', 'none');
		$('#edit_user').css('display', 'none');
		$('#add_user').css('display', 'none');
		$('#myLincese').css('display', 'none');
		if(callStateKPI=="on"){
			$('#notification_settings').css('display', 'none');
		}
		$('#app_settings').css('display', 'block');
		//$('#app_controls').css('display', 'none');
		$('#app_analytics').css('display', 'none');

		document.getElementById("profile_link").className = "left_links";
		document.getElementById("users_link").className = "left_links";
		if(userRole!="ROLE_ADMIN"){
			document.getElementById("myLincese_link").className = "left_links";
		}
		if(callStateKPI=="on"){
			document.getElementById("notification_settings_link").className = "left_links";
		}
		if(userRole=="ROLE_ADMIN"){
			
			document.getElementById("app_settings_link").className = "left_links";
			//document.getElementById("app_controls_link").className = "left_links";
			//document.getElementById("app_analytics_link").className = "left_links";
		}

	    $('#payment_form #payment_id_form').trigger("reset");
	} 
	 
	
	 function display_app_Portal_settings(){
		$.ajax({
			url : "getAppPortalSettings",
			type : "GET",
	
			success : function(appSettings_response) {
					$('#app_settings').unbind("submit");
					$("#app_settings").html( appSettings_response );
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
		$('#myprofile').css('display', 'none');
		$('#users').css('display', 'none');
		$('#edit_user').css('display', 'none');
		$('#add_user').css('display', 'none');
		$('#myLincese').css('display', 'none');
		if(callStateKPI=="on"){
			$('#notification_settings').css('display', 'none');
		}
		$('#app_settings').css('display', 'block');
		//$('#app_controls').css('display', 'none');
		$('#app_analytics').css('display', 'none');
		document.getElementById("profile_link").className = "left_links";
		document.getElementById("users_link").className = "left_links";
		if(userRole!="ROLE_ADMIN"){
			document.getElementById("myLincese_link").className = "left_links";
		}
		if(callStateKPI=="on"){
			document.getElementById("notification_settings_link").className = "left_links";
		}
		if(userRole=="ROLE_ADMIN"){
			document.getElementById("app_settings_link").className = "left_links_selected";
			//document.getElementById("app_controls_link").className = "left_links";
			//document.getElementById("app_analytics_link").className = "left_links";
		}

	    $('#payment_form #payment_id_form').trigger("reset");
	} 
	 
	 function display_app_analytics(){
		 $.ajax({
			url : "getAppAnalytics",
			type : "GET",
	
			success : function(myprofile_response) {
					$('#app_analytics').unbind("submit");
					$("#app_analytics").html( myprofile_response );
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
		$('#myprofile').css('display', 'none');
		$('#users').css('display', 'none');
		$('#edit_user').css('display', 'none');
		$('#add_user').css('display', 'none');
		$('#myLincese').css('display', 'none');
		if(callStateKPI=="on"){
			$('#notification_settings').css('display', 'none');
		}
		$('#app_settings').css('display', 'none');
		//$('#app_controls').css('display', 'none');
		$('#app_analytics').css('display', 'block');

		document.getElementById("profile_link").className = "left_links";
		document.getElementById("users_link").className = "left_links";
		document.getElementById("myLincese_link").className = "left_links";
		if(callStateKPI=="on"){
			document.getElementById("notification_settings_link").className = "left_links";
		}
		if(userRole=="ROLE_ADMIN"){
			document.getElementById("app_settings_link").className = "left_links";
			//document.getElementById("app_controls_link").className = "left_links";
			//document.getElementById("app_analytics_link").className = "left_links_selected";
		}

	    $('#payment_form #payment_id_form').trigger("reset");
	}
	 
	 function display_pollingThreshold(){
			$.ajax({
				url : "pollingThreshold",
				type : "GET",
		
				success : function(myprofile_response) {
						$("#polling_settings").html( myprofile_response );
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
			$('#myprofile').css('display', 'none');
			$('#users').css('display', 'none');
			$('#edit_user').css('display', 'none');
			$('#add_user').css('display', 'none');
			$('#polling_settings').css('display', 'block');
			if(callStateKPI=="on"){
				$('#notification_settings').css('display', 'none');
			}
			$('#app_settings').css('display', 'none');
			//$('#app_controls').css('display', 'none');
			$('#app_analytics').css('display', 'none');

			document.getElementById("profile_link").className = "left_links";
			document.getElementById("users_link").className = "left_links";
			document.getElementById("polling_settings_link").className = "left_links_selected";
			if(callStateKPI=="on"){
				document.getElementById("notification_settings_link").className = "left_links";
			}
			if(userRole=="ROLE_ADMIN"){
				document.getElementById("app_settings_link").className = "left_links";
				//document.getElementById("app_controls_link").className = "left_links";
				//document.getElementById("app_analytics_link").className = "left_links";
			}
		    $('#payment_form #payment_id_form').trigger("reset");
		}
	 
	 
	 function display_CustomerLicensing(){
			$.ajax({
				url : "customerLicensing",
				type : "GET",
		
				success : function(myprofile_response) {
						$("#myLincese").html( myprofile_response );
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
			$('#myprofile').css('display', 'none');
			$('#users').css('display', 'none');
			$('#edit_user').css('display', 'none');
			$('#add_user').css('display', 'none');
			$('#myLincese').css('display', 'block');
			if(callStateKPI=="on"){
				$('#notification_settings').css('display', 'none');
			}
			$('#app_settings').css('display', 'none');
			//$('#app_controls').css('display', 'none');
			$('#app_analytics').css('display', 'none');

			document.getElementById("profile_link").className = "left_links";
			document.getElementById("users_link").className = "left_links";
			if(userRole!="ROLE_ADMIN"){
				document.getElementById("myLincese_link").className = "left_links_selected";
			}
			if(callStateKPI=="on"){
				document.getElementById("notification_settings_link").className = "left_links";
			}
			if(userRole=="ROLE_ADMIN"){
				document.getElementById("app_settings_link").className = "left_links";
				//document.getElementById("app_controls_link").className = "left_links";
				//document.getElementById("app_analytics_link").className = "left_links";
			}
		    $('#payment_form #payment_id_form').trigger("reset");
		}
	 
	 function display_notificationThreshold(){
			$.ajax({
				url : "notificationThreshold",
				type : "GET",
		
				success : function(myprofile_response) {
						$("#notification_settings").html( myprofile_response );
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
			$('#myprofile').css('display', 'none');
			$('#users').css('display', 'none');
			$('#edit_user').css('display', 'none');
			$('#add_user').css('display', 'none');
			$('#myLincese').css('display', 'none');
			$('#notification_settings').css('display', 'block');
			$('#app_settings').css('display', 'none');
			//$('#app_controls').css('display', 'none');
			$('#app_analytics').css('display', 'none');

			document.getElementById("profile_link").className = "left_links";
			document.getElementById("users_link").className = "left_links";
			if(userRole!="ROLE_ADMIN"){
				document.getElementById("myLincese_link").className = "left_links";
			}
			document.getElementById("notification_settings_link").className = "left_links_selected";
			if(userRole=="ROLE_ADMIN"){
				document.getElementById("app_settings_link").className = "left_links";
				//document.getElementById("app_controls_link").className = "left_links";
				//document.getElementById("app_analytics_link").className = "left_links";
			}
		    $('#payment_form #payment_id_form').trigger("reset");
	}
	
	function logo_click(){
		window.location="dashboard";
	}
	 
</script>
<div style="padding-left: 40px">
  <img style="width:115px;height:32px;cursor: pointer;" onclick="logo_click()" 
  	src="<c:url value="/resources/images/TekVizion Logo.png"/>">
</div>
<div class="upper_top_bar">
  <!-- <div class="epam_logo"></div> -->
  <a href="${propertiesFile['app.settings.sso.url']}">
 	<div style="color: white;height: 35px;width: 450px;margin-top: 8px;float: left;font-size: 32px;font-stretch: ultra-condensed;">onPOINT HCS.Capacity Dashboard</div>
 </a> 
  <!-- <div class="virtual_text">Virtual UC Lab</div> -->
  <%-- <span class="serverEnvironment">${serverEnvironment}</span> --%>
   <ul class="setting_icon">
	<li style="float:right;"> 
	  <div style="width:132px;">
	    <ul style="list-style: none;">
		  <div>
		  	<!-- <li class="setting_icon_settings">My Account</li> -->
		 <%--  <li class="setting_icon_settings">${userName}</li> --%>
		  </div>		 
		  <a href="<c:url value="/logout" />"><li class="setting_icon_logout">Logout</li></a>
	    </ul>
	  </div>
	</li>
	<li class="setting_icon_userinfo">
		<div class="name">${fn:substring(userName, 0, 25)}</div>
	</li>
  </ul>
</div>
<div class="lower_top_bar">
	  <ul class="menu_icon">

		<c:choose>
					 
			 <c:when test="${headerName=='provisioning'}">
		       <a href="dashboard"><li class="menu_icon_dashboard "></li></a>
			 	<a href="provisioning"><li class="menu_icon_provisioning menu_icon_provisioning_selected"></li></a>
			 	<!-- <a href="support"><li class="menu_icon_support"></li></a> -->
				<c:if test="${userRole == 'ROLE_ADMIN'}">
					<!-- <a href="provider"><li class="menu_icon_hierarchy"></li></a>-->
					 <a href="onDemandMonitoring"><li class="menu_icon_admin"></li></a>
				</c:if>  
			
			 
			</c:when> 
			
			 <c:when test="${headerName=='component'}">
		       <a href="dashboard"><li class="menu_icon_dashboard "></li></a>
			 	<a href="provisioning"><li class="menu_icon_provisioning menu_icon_provisioning_selected"></li></a>
			 	<!-- <a href="support"><li class="menu_icon_support"></li></a> -->
				<c:if test="${userRole == 'ROLE_ADMIN'}">
					<!-- <a href="provider"><li class="menu_icon_hierarchy"></li></a>-->
				<a href="onDemandMonitoring"><li class="menu_icon_admin"></li></a>
				</c:if>  
			
			 
			</c:when>
			 <c:when test="${headerName=='componentType'}">
		       <a href="dashboard"><li class="menu_icon_dashboard "></li></a>
			 	<a href="provisioning"><li class="menu_icon_provisioning menu_icon_provisioning_selected"></li></a>
			 	<!-- <a href="support"><li class="menu_icon_support"></li></a> -->
				<c:if test="${userRole == 'ROLE_ADMIN'}">
					<!-- <a href="provider"><li class="menu_icon_hierarchy"></li></a>
					 <a href="licensing"><li class="menu_icon_admin"></li></a> -->
					<a href="onDemandMonitoring"><li class="menu_icon_admin"></li></a>
				</c:if>  
			
			 
			</c:when>
		    
		    <c:when test="${headerName=='dashboard'}">
		       <a href="dashboard"><li class="menu_icon_dashboard  menu_icon_dashboard_selected"></li></a>
				<a href="provisioning"><li class="menu_icon_provisioning"></li></a>
				<!-- <a href="support"><li class="menu_icon_support"></li></a> -->
				<c:if test="${userRole == 'ROLE_ADMIN'}">
					<!-- <a href="provider"><li class="menu_icon_hierarchy"></li></a> -->
					<a href="onDemandMonitoring"><li class="menu_icon_admin"></li></a>
				</c:if>
				
				 
			</c:when>
			
			<c:when test="${headerName=='support'}">
		       <a href="dashboard"><li class="menu_icon_dashboard"></li></a>
				<a href="provisioning"><li class="menu_icon_provisioning"></li></a>
				<!-- <a href="support"><li class="menu_icon_support menu_icon_support_selected"></li></a> -->
				<c:if test="${userRole == 'ROLE_ADMIN'}">
					<!-- <a href="provider"><li class="menu_icon_hierarchy"></li></a>
					<a href="licensing"><li class="menu_icon_admin"></li></a> -->					
				</c:if>
				
				 
			</c:when>
			
			<c:when test="${headerName=='ondemandmonitoring'}">
		       <a href="dashboard"><li class="menu_icon_dashboard "></li></a>
			 	<a href="provisioning"><li class="menu_icon_provisioning"></li></a>
			 	<!-- <a href="support"><li class="menu_icon_support"></li></a> -->
				<c:if test="${userRole == 'ROLE_ADMIN'}">
					<!-- <a href="provider"><li class="menu_icon_hierarchy"></li></a>-->
					 <a href="onDemandMonitoring"><li class="menu_icon_admin menu_icon_admin_selected"></li></a>
				</c:if>  
			
			 
			</c:when> 
		     		
			<c:when test="${headerName=='denied'}">
		       		<a href="dashboard"><li class="menu_icon_dashboard "></li></a>
			 		<a href="provisioning"><li class="menu_icon_provisioning"></li></a>
			 		<!-- <a href="support"><li class="menu_icon_support"></li></a> -->
					 <a href="onDemandMonitoring"><li class="menu_icon_admin"></li></a>			 		
					 
			</c:when> 
			 
		</c:choose>
  </ul>
</div>
<%@include file="help.jsp" %>
<div class="modal fade" id="myaccount_modal" role="dialog">
  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 960px;height: 750px;margin-bottom: 0px;">
	<!-- Modal content-->
	<div class="modal-content" style="height: inherit;">
	  <div class="modal-body" style="padding:0px;">
 		<div class="myaccount_left_panel">
		  <h3 class="account_heading">My Account</h3>
		  <div class="Left_sub_heading">User Account</div>
		  <div id="profile_link" class="left_links_selected" onclick="display_myprofile()" 
		  	style="margin-right: 45px !important">My Profile
		  </div>
		  <div id="users_link" class="left_links" onclick="display_users()" 
		  	style="margin-right: 60px !important">Users
		  </div>
		   <c:choose>
			<c:when test="${userRole!='ROLE_ADMIN'}">
	     <!-- <div style="margin-top: 30px" class="Left_sub_heading">Setup</div> -->
	     
		  <div id="myLincese_link" class="left_links" onclick="display_CustomerLicensing()"
			style="margin-right: 25px !important">My License
		  </div>
		  </c:when>
		 </c:choose>
		  <c:if test="${callStateKPI == 'on'}">
			  <div id="notification_settings_link" class="left_links" onClick="display_notificationThreshold()" 
			  	style="margin-right: 5px !important">Call State KPI
			  </div>
		  </c:if>
		  <c:choose>
			<c:when test="${userRole=='ROLE_ADMIN'}">
			  <div style="margin-top: 30px" class="Left_sub_heading">Admin</div>
			  <!-- <div id="app_settings_link" class="left_links" onclick="display_app_settings()" -->
			 
			  		<div id="app_settings_link" class="left_links" onclick="display_app_Portal_settings()"
					style="margin-right: 20px !important">App Settings
			  		</div> 
			 
			</c:when>
		 </c:choose>
		  	  
		  <div class="myaccount_exit_button"  data-dismiss="modal"></div>
		</div>
		 <div class="myaccount_right_panel">
		  <div id="myprofile" class="myprofile_popup" style="margin: 0px; display: none">
			<!--  My profile page is included from the ajax Call --> 
		  </div>
		   <div id="users" class="users_popup" style="margin: 0px;display: none" ng-app="usersApp">
			<!-- Users page is included from the ajax Call -->  
		  </div>
		  <div id="edit_user" class="edit_user_popup" style="margin: 0px; display: none">
			<!-- Edit User page is included from the ajax Call --> 			
		  </div>
		   <div id="add_user" class="add_user_popup" style="margin: 0px;width:771px; display: none">
			<!-- Add User page is included from the ajax Call --> 			
		  </div>
		<div id="myLincese" class="add_user_popup" style="margin: 0px; display: none">
			<!-- Polling Settings is included from the ajax Call -->  	
		  </div> 
		 
		  <div id="app_settings" class="myprofile_popup" style="margin: 0px; display: none;">
			<!-- Add Packages page is included from the ajax Call --> 
		  </div> 
		 
		</div>	
	  </div>
	</div>
  </div>
</div> 

<div class="modal fade" id="license_modal" role="dialog" data-backdrop="static">
  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 800px;height: 675px;margin-bottom: 0px;">
	<!-- Modal content-->
	<div class="modal-content" style="height: inherit;">
	  <div class="modal-body" style="padding:0px;">
 		<div id="licenseDiv">
		 <div class="myaccount_right_panel" style="margin-left: 30px;">
		 	  	<h3 class="myprofile_heading_text" style="text-align: center; line-height: 25px; margin-left: 0px;">
		  		tekVizion - onPOINT
				<br/>
				END USER LICENSE AGREEMENT
		  	</h3>
				<%-- <%@include file="license.jsp" %> --%>
						
				<input type="submit" class="license_decline_button" value="" >
				<input type="submit" class="license_accept_button" value="" >
		</div>
		</div>
		<div id="welcomeDiv">
		  	<h3 class="myprofile_heading_text" style="text-align: center; font-size: 25px; margin-left: 0px; margin-top: 140px; margin-bottom: -40px;">
		  		Welcome to onPOINT
		  	</h3>
				<div style="height: 420px; padding: 75px; font-size: 16px; font-family: 'Source Sans Pro';  line-height: 35px; text-align: justify;
    				color: #7694b7;">
					<p>The onPOINT solution offers the user flexible set of tools that allows the execution of automated test cases on different devices. 
					But before creating and executing of any test cases, the user’s onPOINT infrastructure needs to be set up. <br> To do this we have an online help. Would you like to view it? 
					</p>
				</div>				
				<input type="submit" class="onlineHelp_decline_button" value="" >
				<input type="submit" class="onlineHelp_accept_button" value="" >
			</div>	
	  </div>
	</div>
  </div>
</div>


