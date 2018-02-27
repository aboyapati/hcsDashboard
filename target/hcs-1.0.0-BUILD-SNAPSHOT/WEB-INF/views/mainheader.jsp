<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="<c:url value="/resources/css/register_login.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/base.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/epam/jquery-1.11.1.min.js"/>"></script>
<%-- <link  rel='stylesheet' type='text/css' href="<c:url value="/resources/css/fonts.css"/>"/> --%>
<!-- <link href='/resources/css/fonts?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'> 
<link href='/resources/css/fonts?family=Exo+2:400,300,200' rel='stylesheet' type='text/css'> -->
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>  
 <link href='https://fonts.googleapis.com/css?family=Exo+2:400,300,200' rel='stylesheet' type='text/css'>  
<%-- <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/family.css"/>"/>  --%>
<link rel="stylesheet" href="<c:url value="/resources/css/epam/epam.css"/>"/>

<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script> -->
<script type="text/javascript" src="<c:url value="/resources/js/epam/jquery-1.11.3.js"/>"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  --> 

<script type="text/javascript" src="<c:url value="/resources/js/epam/bootstrap.min.js"/>"></script>
<!-- <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->

<script type="text/javascript" src="<c:url value="/resources/js/epam/jquery-ui.js"/>"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> --> 

<link rel="stylesheet" href="<c:url value="/resources/css/epam/bootstrap.min.css"/>"/> 
<script type="text/javascript" src="<c:url value="/resources/js/bootbox.min.js"/>"></script>


<script>
function logo_click(){
	/* $.ajax({
		url : "logo_link",
		type : "GET",

		success : function(logo_redirect) {
			if(logo_redirect=="home"){ */
				window.location="home";
				/* }
			else{
				window.location="dashboard"
			}
		},
		error : function(xhr, status, error) {
			window.location.href='home';
		}
	}); */
}

</script>
<div style="padding-left: 40px">
<img style="width:115px;height:32px;cursor: pointer;" onclick="logo_click()" src="<c:url value="/resources/images/TekVizion Logo.png"/>">

</div>
<div class="top_bar" style="padding-left: 40px;">	
	
	<div class="epam_logo"></div>
	
	<span class="serverEnvironment">${serverEnvironment}</span>
	
	<ul class="list_buttons">
		<a href="login" class="login_disabled"><li class="login_icon">Login</li></a>
	</ul>
</div>



