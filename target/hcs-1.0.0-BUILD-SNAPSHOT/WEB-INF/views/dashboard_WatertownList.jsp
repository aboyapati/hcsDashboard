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
  #chartdivNexus{
  width: 100%;
  height: 365px;
  margin-left: 0px;
  width: 336px;
}
#chartdivASA {
  width: 100%;
  height: 365px;
  margin-left: 347px;
  width: 336px;
  margin-top: -365px;
}
#chartdivSBC {
  width: 100%;
  height: 365px;
  margin-left: 689px;
  width: 336px;
  margin-top: -365px;
}
#chartdivUCS {
  width: 100%;
  height: 365px;
  margin-left: 1px;
  width: 336px;
  margin-top: -100px;
}
#chartdivvCenter {
  width: 100%;
  height: 365px;
  margin-left: 347px;
  width: 336px;
  margin-top: -356px;
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
</style>
<div  id ="displayVirtualLab" class ="displayVirtualLab">
  <div id="appId" ng-app="lablist_App" ng-cloak> 
	<div class="vlab_inner_table">
			
	  <div ng-controller="MyReservationCtrl" class="lablist_container">	
		<div id ="myReservations">	
	 		
		  <!--   <scrollable-table watch="visibleProjects"> -->
		  <c:if test="${empty dashboardchartGraph}">
				<div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
					No Provisioning 
				</div>
			</c:if>
		    <c:if test="${not empty dashboardchartGraph}">
		    <!-- <div class="bs-example">
    <ul class="breadcrumb">
        <li><a href="dashboard">Dashboard</a></li>
        <li><a href="#">Products</a></li>
        <li class="active">Accessories</li>
    </ul>
</div> -->
 			<!-- <div class="breadcrumb">
    				<div class="item"><a href="dashboard">Dashboard >Watertown> </a></div>
			 </div> -->
			 <div id="breadcrumb" class="breadcrumb">
    		<c:forEach items="${breadcrumbs}" var="breadcrumb" varStatus="status">
		<!--         <li class="separator">&gt;</li> -->
        	<li><c:choose>
                <c:when test="${breadcrumb.url eq '#'}">
                    <a href="#" onclick="return false;"
                        <c:if test="${status.last}">class="last"</c:if>>${breadcrumb.name}</a>
                </c:when>

                <c:otherwise>
                    <a href="${baseURL2}${breadcrumb.url}"
                        <c:if test="${status.last}">class="last"</c:if>>${breadcrumb.name}</a>
                </c:otherwise>

            </c:choose></li>
    	</c:forEach> 	
	 	</div>	
			 <c:forEach var="graphObj" items="${dashboardchartGraph}">
			 	<a href="getsubdashboard?dataCenters=${graphObj.graphkey}" id="items">
		      		<div id="chartdiv${graphObj.graphkey}"></div> 
		      	</a>
	      	 </c:forEach>	
	      	   
      	  </c:if> 
      </div>
	  </div>
	</div>
  </div>
 </div> 
 <script type="text/javascript">
$(document).ready(function() {
	//alert('test');
	var graphObj =${chartGraph};
	// alert(graphObj)
	for(var i=0; i<graphObj.length;i++){
		var graphName =graphObj[i].graphkey;
		var dataVal = graphObj[i].plotingPointData;
		//alert(graphName);
		speedMeterChart(graphName,dataVal,graphName);
	}
}); 

function speedMeterChart(graphName,dataVal) {
	var chart = AmCharts.makeChart("chartdiv"+graphName, {"theme": "light",
		"type": "gauge",
		"axes": [{
		    "topTextFontSize": 20,
		    "topTextYOffset": 70,
		    "axisColor": "#ccccb3",
		    "axisThickness": 10,
		    "endValue": 100,
		    "gridInside": true,
		    "inside": true,
		    "radius": "80%",
		    "valueInterval": 10,
		    "tickColor": "#67b7dc",
		    "startAngle": -90,
		    "endAngle": 90,
		    "unit": "%",
		    "bandOutlineAlpha": 1,
		    "bands": [{
		      "color": "#00cc00",
		      "endValue": 100,
		      "innerRadius": "103%",
		      "radius": "120%",
		      "gradientRatio": [0.5, 0, -0.5],
		      "startValue": 0
		    }, {
		      "color": "#ccccb3",
		      "endValue": 0,
		      "innerRadius": "100%",
		      "radius": "99%",
		      "gradientRatio": [0.5, 0, -0.5],
		      "startValue": 0
		    },{
		      "color": "#e62e00",
		      "endValue": 100,
		      "innerRadius": "103%",
		      "radius": "120%",
		      "gradientRatio": [0.5, 0, -0.5],
		      "startValue": 60
		    }]
		  }],
		  "arrows": [{
		    "alpha": 5,
		    "innerRadius": "35%",
		    "nailRadius": 0,
		    "radius": "100%",
			"color": "#e62e00",
		  }],
		  "titles": [
		     		{
		     			"text": graphName,
		     			"size": 18,
		     			"display": "true",
			            "position": 'bottom',  
			            "position": "absolute",
			            "fontColor": "#203c66",
			            "fontFamily":"Source Sans Pro" ,
			            
			           
		     		}
		     	] 
		 });
		setInterval(randomValue, 2000);
		function randomValue() {
		  //var value = dataVal;
		  chart.arrows[0].setValue(dataVal);
		  chart.axes[0].setTopText(dataVal + " %");
		  chart.axes[0].bands[1].setEndValue(dataVal);
		} 
}
/* function displaySummary(graphName){
	alert(graphName);
	
	$.ajax({
		url : "getsubdashboard",
		type : "GET",
		data : {
			dataCenters  : graphName, 
			 
		},
		dataType: "json",
		success : function(response) {
			 alert('success');					
		},
		error : function(xhr, status, error) {
			if(xhr.status==200){	
				bootbox.alert("Session Expired..Please Login again..",function(){window.location = "login";
				}).find("div.modal-content").addClass("modalfailure");
			}else{
				bootbox.alert("Unknown Error occurred. Try again later").find("div.modal-content").addClass("modalfailure");
			}
			$.unblockUI();	
		}
	});	
} */  
</script> 