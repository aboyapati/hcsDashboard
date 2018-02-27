<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3 class="myprofile_heading_text" >Onboarding an onPoint Link</h3>
<div id="help_info_desc">
<p  class="help_paragraph">The Infrastructure Prep and Setup section is a very critical configuration section where the Customer Admin needs to tailor the onPOINT solution to the customer’s network and needs. In this section the Customer Admin will configure the following entities:</p>
   <ul class="help_li"> <li><p  class="help_paragraph"> Call Servers</p></li>
       <li><p class="help_paragraph"> Sites</p></li>
		<li><p  class="help_paragraph">Phones </p></li>
		<li><p class="help_paragraph">onPOINT Links</p></li></ul>
		
		<p  class="help_paragraph">It is imperative that these entities are properly configured for the onPOINT solution to function correctly. Please contact tekVizion support at onpointsupport.tekvizion.com for any additional help or clarifications.</p>
		
		
		<p  class="help_paragraph">onPOINT Solution consists of an onPOINT controller that communicates with physical hardware equipment located on the customers premises. The equipment can be visualized as Sites and consist of call servers and onPOINT links. The below picture depicts the structure of a site:</p>
			<img src="resources/images/epam/help/help_Onboarding.png" alt="Pic" />
			<br></br>	
<p  class="help_paragraph">The following sections describe the various components and how to configure them.</p>
<h3 class="myprofile_heading_text" >Call Server</h3>
<%@include file="help_callServerInfo_desc.jsp" %>
<h3 class="myprofile_heading_text" >Site</h3>
<%@include file="help_siteInfo_desc.jsp" %>
<h3 class="myprofile_heading_text" >Phones</h3>
<%@include file="help_phoneInfo_desc.jsp" %>
<h3 class="myprofile_heading_text" >onPOINT Links</h3>
<%@include file="help_onPointLinkInfo_desc.jsp" %>
</div>