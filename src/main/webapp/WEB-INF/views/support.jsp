<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="link.jsp" %>

	<title>SUPPORT</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/support.css"/>"/>
    <script src="./resources/js/support.js"></script>
	
	<script>
	$(document).ready(function() {
		$("#document_table_id").tablesorter();
		$("#release_notes_table_id").tablesorter();
	});
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	
	<%@include file="header.jsp" %>
	
	<div id="content">
	
	<div class="support_left">

	<div class="support_head">Support</div>
	<div class="support_list">
		<ul>
   			<li id="documentation" class="documentation_selected" onclick="ShowDocumentation()"></li>
  			<li id="releaseNotes" class ="releaseNotes" onclick="ShowReleaseNotes()" ></li>
  			<li id="contactUs" class ="contactUs" onclick="ShowContactUs()" ></li>
		</ul>
	</div>
	 
	 
	<div class="related_links">
	 	 <table>
			<thead>
				<tr>
					<th style="cursor: default;">Related Links</th>
				</tr>				
			</thead>
 
			<tbody>
	 			<tr>
	 				<td style="cursor: pointer;" onclick="ShowOnPoint()">What is onPOINT?</td>
	 			</tr>	
	 		</tbody>
	 	</table>
	</div>
</div>

<div id="support_doc_id" class="support_right" ng-app="support_docApp" ng-cloak >
	<div id="support_documentation" >
    	<div ng-controller="SupportMyCtrl">
     
     		<scrollable-table watch="visibleProjects" resizable>
				<table id="document_table_id" class="table tablesorter">
          			<thead>
          				<tr>
            				<th col="document" style="width:450px;"> Document Name</th>
            				<th col="download" style="width:82px;">Download</th>
          				</tr>
          			</thead>
          			
          			<tbody>
          			
       					<c:if test="${not empty docList}">
							<c:forEach var="doc" items="${docList}">
								<tr>
									<td style="width:450px; max-width:450px;">${doc.name}</td>
									<td style="width:82px; max-width:82px;"><a title="Download" href="<c:url value="/support/download?docid=${doc.id}"/>"><div class="support_download_button"></div></a></td>
								</tr>	
							</c:forEach>
						</c:if>		
						
            				
          			</tbody>
        		</table>
      		</scrollable-table>
     		<div class="support_divider"></div>    
    	</div>
    </div>
    
	<div id="support_release" class="support_release">
    	<div ng-controller="ReleaseCtrl" >
     		<scrollable-table watch="visibleProjects" resizable>
        		<table id="release_notes_table_id" class="table tablesorter">
        		<col width="120px"/>
        		<col width="90px"/>
        		<col width="420px"/>
          			<thead>
          				<tr>
            				<th sortable-header col="releasedate">Release Date</th>
            				<th sortable-header col="version">Version</th>
            				<th col="changes">Changes</th>
          				</tr>
          			</thead>
          			<tbody>
          			<tr>
                         <td>09/18/17</td>
                         <td>5.1</td>
                         <td>
                             <ul style="margin-top: 0px;">
                                		<li>E164 Support</li>
 										<li>Park and Retrieve integration</li>
										<li>IPC Unity Voice Mail Credentials</li>  
                                		<li>Bug Fixes</li>
                             </ul>
                          </td>
                     </tr>
	                 <tr>
                            <td>09/01/17</td>
                            <td>5.0</td>
                            <td>
                                <ul style="margin-top: 0px;">
                                   <li>Project Creation Wizard</li>
                                   <li>Import/Export phones via spreadsheet</li>
                                   <li>Twilio PSTN phones integration</li>
                                   <li>Voice Mail MWI checking</li>
									<li>Bug Fixes</li>
                                </ul>
                             </td>
                     </tr>
      			     <tr>
   			          <td>07/10/17</td>
                      <td>4.2</td>
                      <td>
                      <ul style="margin-top: 0px;">
                              <li>Dynamic Reporting</li>
                              <li>IPC API additions of login/logout</li>
                              <li>Email Notification</li>
                              <li>Bug Fixes</li>
                      </ul>
                      </td>
   			
   					</tr>
       				<tr>
                      <td>05/30/17</td>
                      <td>4.1</td>
                      <td>
                      <ul style="margin-top: 0px;">
                              <li>onPOINT Bulk Test Case Execution</li>
                              <li>Grandstream API support</li>
                              <li>Multi Line Call Enhancement</li>
                              <li>Bug Fixes</li>
                      </ul>
                      </td>
                     </tr>
       				 <tr>
                        <td>04/28/17</td>
                        <td>4.0</td>
                        <td>
                        <ul style="margin-top: 0px;">
                                <li>onPOINT Link Enhancements for IPC</li>
                                <li>Recursive Test Case Execution</li>
                                <li>SIP Validation Enhancements</li>
                                <li>Bug Fixes</li>
                        </ul>
                        </td>
                     </tr>
       				 <tr>
                       <td>03/10/17</td>
                       <td>3.1</td>
                       <td>
                       <ul style="margin-top: 0px;">
                               <li>onPOINT Link Communication Enhancement</li>
                               <li>Bug Fixes</li>
                       </ul>
                       </td>
                     </tr>
       				 <tr>
                       <td>01/30/17</td>
                       <td>3.0</td>
                       <td>
                       <ul style="margin-top: 0px;">
                               <li>onPOINT Link Introduction</li>
                               <li>UI Enhancements</li>
                               <li>Bug Fixes</li>
                       </ul>
                       </td>
                     </tr>
                     <tr>
                        <td>09/16/16</td>
                        <td>2.0</td>
                        <td>
                        <ul style="margin-top: 0px;">
                                <li>Report Enhancements</li>
                                <li>Bug Fixes</li>
                        </ul>
                        </td>
                    </tr>
       				<tr>
						<td>07/10/16</td>
						<td>1.1</td>
						<td>
						     <ul style="margin-top: 0px;">
						   	<li>Adding multiple providers</li>
						   	<li>Creation of users for resellers</li>
						   	<li>Bug Fixes</li>
						</ul>
						</td>
                    </tr>     
       				<tr>
	                   	<td>04/24/16</td>
	                   	<td>1.0</td>
	                  	<td>
	                        <ul style="margin-top: 0px;">
	                        	<li>New onPOINT Release </li>
	                    	</ul>
	                	</td>
             	    </tr>         			
          			</tbody>
       			 </table>
      		</scrollable-table>
    	</div> 
    </div>

	<div id="support_contact" class="support_contact">
		<h3 style="color: #203c66">Contact Us</h3>
		<p>For any onPOINT technical issues, support, or consultation please email us at <a href="mailto:onpointsupport@tekvizion.com">onpointsupport@tekvizion.com</a></p>
		</br>
		<p>In your email, please describe the reason for the request and provide a day time telephone number where</p>
		<p> you  can be reached as well as an email address.</p>
		</br>
		<p>We will make every effort to contact you back as quickly as possible.</p>
		</br>
		<p>Thank you for using onPOINT</p> 
				
		<div class="contact_info">
			<p style="font-weight:600">tekVizion USA</p>
			<p>3701 W. Plano Parkway</p>
			<p>Suite 300</p>
			<p>Plano, TX 75075</p>
			<p>Phone: +1 214-242-5900</p>
			<p>Fax: +1 214-242-5999</p>
		</div>
		
		<div class="contact_info">
			<p style="font-weight:600">tekVizion India</p>
			<p>6th Floor, Beta Block</p>
			<p>SSPDL - Alpha City Teck Park</p>
			<p>Old Mahabalipuram Road </p>
			<p>Navallur</p>
			<p>Chennai, Tamil Nadu 603103 IN</p>
		</div>
		<p>For Sales: +1 214-242-5900</p>		
	</div>
	
	<div id="support_onpoint" class="support_onpoint">
		<h2 style="color:#a20025 !important">What is onPOINT</h2>
		<div style="overflow-x:hidden;overflow-y:auto; width:700px;height: 400px;">
		<div style="width:650px;text-align: justify;line-height: 30px">
			Today’s UCaaS (Unified Communications as a Service) players are offering over the top (OTT) services where the quality of voice can have a significant impact based on the quality of the network. It also is harder to manager the phones remotely to diagnose and debug the problems. This solution should help solve the problem.
			<br></br>
			onPOINT™ is a cloud based application that offers end point monitoring and assurance management. The solution will offer the service provider the ability to monitor and manage their end points and ensure that trouble sites and devices are easily identified for quick and efficient issue resolution.
			<br></br>
			<img src="resources/images/epam/epamArchitecture.png" alt="Pic" />
			<br></br>
			As demonstrated in the picture, the onPOINT solution is the central management component, which will allow the development, scheduling execution and reporting of the phones status. The phones are residing in the client sites. onPOINT will have to discover the phones by talking to the provisioning platform and be able to connect with the phones automatically. Once the phones are contacted, onPOINT will track the phones based on the data the phones are providing and making live calls from the phones to other phones within the customer site or making phones to a phone in the provider’s data center.  
			The two main objectives of this application are, to verify the phones can make and receive calls and to collect statistics the phones are reporting and present them to make diagnosis and debugging when required.
			 </p>
		</div>
		</div>
	</div>
	
</div>

</div>
	 
	
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

<script> angular.bootstrap(document.getElementById("support_doc_id"),['support_docApp']);</script>
<script>

window.onload = ShowDocumentation;

function ShowDocumentation(){

	documentation.className = "documentation_selected";
	releaseNotes.className = "releaseNotes";
	contactUs.className="contactUs";
	
	support_release.style.display = "none";
	support_contact.style.display = "none";
	support_documentation.style.display = "block";
	support_onpoint.style.display="none";
	}

function ShowReleaseNotes(){

	documentation.className = "documentation";
	releaseNotes.className = "releaseNotes_selected";
	contactUs.className="contactUs";
	
	support_release.style.display = "block";
	support_contact.style.display = "none";
	support_documentation.style.display = "none";
	support_onpoint.style.display="none";
	}

function ShowContactUs(){

	documentation.className = "documentation";
	releaseNotes.className = "releaseNotes";
	contactUs.className="contactUs_selected";
	
	support_release.style.display = "none";
	support_contact.style.display = "block";
	support_documentation.style.display = "none";
	support_onpoint.style.display="none";
	}

function ShowOnPoint(){

	documentation.className = "documentation";
	releaseNotes.className = "releaseNotes";
	contactUs.className="contactUs";
	
	support_release.style.display = "none";
	support_contact.style.display = "none";
	support_documentation.style.display = "none";
	support_onpoint.style.display="block";
	}

</script>
</body>
</html>
