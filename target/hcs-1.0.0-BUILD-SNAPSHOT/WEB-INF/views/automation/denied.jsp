<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../link.jsp" %>
<link rel="stylesheet" href="<c:url value="/resources/css/reserveLab.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/lablist.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/labs.css"/>"/>
	<script src="<c:url value='/resources/js/metro/jquery.multi-open-accordion-1.5.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>
<title>Denied</title>
<style type="text/css">
		
	 	select option{
	 		width :150px
	 	}
 		.displayVirtualLab td{
 			line-height: 36px;
 		}
 		.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
			 background-color: #E3E9F0;
		}
	</style>
</head>
<body  class="baseContainer" id="customers"  style="min-height: 500px !important">
  <div id="wrapper">
	
 	<%@include file="../header.jsp" %> 
	<div id="content" style="min-height: 500px !important">
	 <div style="height: 70px"></div>
		<h3 style="color: red" >Access Error!!</h3> 
		<c:choose>
			<c:when test="${ empty sessionOut }">
   				 	<div class="alert alert-danger"> ${errorMsg} </div>.
					<%-- <a href="<c:url value="http://172.16.31.231:8080/standalone/logout"/>"><input type="button" id="logout" value="Logout"/>  </a> --%>
					<a href="<c:url value="automationLogout?from=${from}"/>"><input type="button" id="logout" value="Logout"/>  </a>
   				 
  			</c:when>
  			<c:otherwise>
  				 <div class="alert alert-danger"> ${sessionOut} </div>
				<%-- <a href="<c:url value="logout1?from=${from}"/>"><input type="button" id="logout" value="Logout"/>  </a> --%>
  			</c:otherwise>
		</c:choose>
		</div>
		<%-- <c:if test="${errorMsg != ''}">
   			<div class="alert alert-danger"> ${errorMsg} </div>.
		<a href="<c:url value="http://172.16.31.231:8080/standalone/logout"/>"><input type="button" id="logout" value="Logout"/>  </a>
		<a href="<c:url value="logout1?from=${from}"/>"><input type="button" id="logout" value="Logout"/>  </a></div>
		</c:if> --%>
		
	</div>
	
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>
	
</body>
</html>
