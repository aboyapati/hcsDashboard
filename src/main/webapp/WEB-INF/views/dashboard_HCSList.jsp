<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<script src="<c:url value='/resources/js/metro/jquery.multi-open-accordion-1.5.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>
<!--  AmChart js files-->
	<link rel="stylesheet" href="<c:url value="/resources/css/export.css"/>" type="text/css" media="all"/>
	<script src="<c:url value='/resources/js/amchart/amcharts.js'/>"></script>
	<script src="<c:url value='/resources/js/amchart/gauge.js'/>"></script>
	<script src="<c:url value='/resources/js/amchart/export.min.js'/>"></script>
	<script src="<c:url value='/resources/js/amchart/light.js'/>"></script>

<style>
  #chartdivWatertown {
	  width: 100%;
	  height: 365px;
	  margin-left: 0px;
	  width: 336px;
}
#chartdiv {
	  width: 100%;
	  height: 365px;
	  margin-left: 0px;
	  width: 336px;
}
#chartdivAllen {
	  width: 100%;
	  height: 365px;
	  margin-left: 332px;
	  width: 336px;
	  margin-top: -365px;
}
#chartdivPlano {
	  width: 100%;
	  height: 365px;
	  margin-left: 681px;
	  width: 336px;
	  margin-top: -365px;
}
ul.breadcrumb {
    padding: 10px 16px;
    list-style: none;
    background-color: #eee;
}
ul.breadcrumb li {
    display: inline;
    font-size: 18px;
}
ul.breadcrumb li+li:before {
    padding: 8px;
    color: black;
    content: ">";
}
ul.breadcrumb li a {
    color: #0275d8;
    text-decoration: none;
}
ul.breadcrumb li a:hover {
    color: #01447e;
    text-decoration: underline;
}
.dataCenterName_display{
	display:block;
	width:100px; 
	max-width:100px;
	padding-left:5px;
	overflow: hidden; 
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
<div  id ="displayVirtualLab" class ="displayVirtualLab">
  <div id="appId" ng-app="lablist_App" ng-cloak> 
	<div class="vlab_inner_table">
			
	  <div ng-controller="MyReservationCtrl" class="lablist_container">	
		<div id ="myReservations">	
	 		
	 	<div id="breadcrumb" class="breadcrumb">
	 		<a href="dashboard" >Dashboard</a>
    	</div>		
		  <c:if test="${empty dataCenterList}">
				<div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
					No Data Centers 
				</div>
			</c:if>
		    <c:if test="${not empty dataCenterList}">
		  
			 <div style="height: 540px;width: 939px;overflow: auto;margin-left: 30px;">
			 <table >
			  	<c:forEach items="${dataCenterList}" var="dataCenterObj" varStatus="rowCounter">
			    <c:if test="${rowCounter.count % 4 == 1}">
			      <tr>
			    </c:if>
			    <c:if test="${ dataCenterObj.status == 'GOOD'}">
			    <td style="padding: 50px;"><a href="dataCenterDashboard?dataCenterId=${dataCenterObj.id}""><img src="resources/images/Green-1.png" alt="Pic" /></a><h4 class="dataCenterName_display" style="text-align: center">${dataCenterObj.name}</h4></td>
			    </c:if>
			     <c:if test="${ dataCenterObj.status == 'NORMAL'}">
			    <td style="padding: 50px;"><a href="dataCenterDashboard?dataCenterId=${dataCenterObj.id}""><img src="resources/images/yellow-1.png" alt="Pic" /></a><h4 class="dataCenterName_display" style="text-align: center">${dataCenterObj.name}</h4></td>
			    </c:if>
			     <c:if test="${ dataCenterObj.status == 'BAD'}">
			    <td style="padding: 50px;"><a href="dataCenterDashboard?dataCenterId=${dataCenterObj.id}""><img src="resources/images/Red-1.png" alt="Pic" /></a><h4 class="dataCenterName_display" style="text-align: center">${dataCenterObj.name}</h4></td>
			    </c:if>
			    <c:if test="${rowCounter.count % 4 == 0||rowCounter.count == fn:length(values)}">
			      </tr>
			      
			    </c:if>
			  </c:forEach >
			</table></div>
		  </c:if> 
      </div>
	  </div>
	</div>
  </div>
 </div> 
 <script type="text/javascript">
</script> 