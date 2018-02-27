<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="icon" type="image/png" href="resources/images/favicon.png">

<!-- Load all external java script files -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script> -->

<script type="text/javascript" src="<c:url value="/resources/js/epam/jquery-1.11.3.js"/>"></script>
<!--  
	//Ticket: 35454
	//Desc: angular.js library is available at https instead of http
	//Fix: Change the refence url to https
	//Author: Lei Song	
-->
<!-- <script type="text/javascript" src="https://code.angularjs.org/1.3.9/angular.js"></script> -->

<script type="text/javascript" src="<c:url value="/resources/js/epam/angular.js"/>"></script>

<script type="text/javascript" src="./resources/js/angular-scrollable-table.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  --> 

<script type="text/javascript" src="<c:url value="/resources/js/epam/bootstrap.min.js"/>"> </script> 	
<!-- <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<script type="text/javascript" src="<c:url value="/resources/js/epam/jquery-ui.js"/>"> </script>
<!-- <script type="text/javascript" src="https://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script> -->
<script type="text/javascript" src="<c:url value="/resources/js/epam/json2.js"/>"> </script>
<!-- Load all external and internal css files -->
<link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>"/>
 <%-- <link  rel='stylesheet' type='text/css' href="<c:url value="/resources/css/fonts.css"/>"/>  --%> 
<%--  <link  rel='stylesheet' type='text/css' href="<c:url value="/resources/css/family.css"/>"/> --%>    
 <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>  
 <link href='https://fonts.googleapis.com/css?family=Exo+2:400,300,200' rel='stylesheet' type='text/css'>  
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  -->

<link rel="stylesheet" href="<c:url value="/resources/css/epam/bootstrap.min.css"/>"/> 
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->

<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>"/>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.66.0-2013.10.09/jquery.blockUI.min.js"></script> -->


<script type="text/javascript" src="<c:url value="/resources/js/jquery.blockUI.js"/>"></script>
	 
 	<script src="<c:url value="/resources/js/lab_lists.js" />"></script>
	<script src="<c:url value="/resources/js/reserve.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/labdetail.js"/>"> </script> 	
	<script type="text/javascript" src="<c:url value="/resources/js/users.js"/>"> </script> 
	<script type="text/javascript" src="<c:url value="/resources/js/transaction_history.js"/>"> </script> 
	<script type="text/javascript" src="<c:url value="/resources/js/mybackups.js"/>"> </script> 
	<script type="text/javascript" src="<c:url value="/resources/js/reservelab_backup.js"/>"></script>
	
		<script type="text/javascript" src="<c:url value="/resources/js/bootbox.min.js"/>"></script>
		
		<script src="<c:url value="/resources/js/sorttable.js" />"></script>
		<script src="./resources/js/jquery.tablesorter.js"></script>
		
<!--
	Ticket No: 35443 
	Desc : Customer Admin - Users list page renders differently in IE 
	Fix  : Set ajax call cache as false
	Author : Amulya Boyapati
-->		
<script type="text/javascript">
$.ajaxSetup({ cache: false });

//Close Opened Datepickers on window resize or scroll. Since the Datepickers won't move together with the other elements on the page.
$(document).ready(function(){

	var dtPckr = $('.datepicker');
	
	$("*").scroll(function() {
	      dtPckr.datepicker('hide');
	});
	$(window).scroll(function() {
	      dtPckr.datepicker('hide');
	});
	$(window).resize(function() {
	  dtPckr.datepicker('hide');
	});
});
</script>