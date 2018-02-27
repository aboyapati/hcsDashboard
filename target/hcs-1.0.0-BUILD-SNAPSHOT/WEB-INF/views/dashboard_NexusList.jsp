<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<script src="<c:url value='/resources/js/metro/jquery.multi-open-accordion-1.5.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/export.css"/>" type="text/css" media="all"/>
	<script src="<c:url value='/resources/js/amchart/amcharts.js'/>"></script>
	<script src="<c:url value='/resources/js/amchart/gauge.js'/>"></script>
	<script src="<c:url value='/resources/js/amchart/export.min.js'/>"></script>
	<script src="<c:url value='/resources/js/amchart/light.js'/>"></script>

<style>
 .chartDiv {
  width: 300px;
  height: 265px;
  margin-left: 5px;
  margin-bottom: 5px;
  /* border: 1px solid #ccc; */
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
		
		  <div id="breadcrumb" class="breadcrumb">
		  	<li>
		  	<a href="dashboard" >Dashboard</a>
		  	</li>
		  	<li>
		  	<a href="dataCenterDashboard?dataCenterId=${dataCenterId}">${dataCenterName}</a>
		  	</li>
		  	<li>
		  	<a href="componentDashboard?componentId=${componentId}" >${componentName}</a>
		  	</li>
		  	
			
   		</div>
	 	 <div style="height: 545px;width: 939px;overflow: auto;margin-left: 30px;">		
			  <c:if test="${empty dashboardchartGraph}">
					<div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
						No details found 
					</div>
			  </c:if>
			  <c:if test="${not empty dashboardchartGraph}">
		 		  
		 		<table>
				 <c:forEach var="graphObj" items="${dashboardchartGraph}" varStatus="rowCounter">
				  	<c:if test="${rowCounter.count % 3 == 1}">
				    	<tr>
				   	</c:if>
				   	<td>
				   
					 	<a href="componentDetailDashboard?componentId=${componentId}&&property=${graphObj.name}&&lastXDays=Last 3 Months"  id="items">
				      		<div id="chartdiv${graphObj.name}" class="chartDiv"></div> 
				      	</a>
			      	</td>
			      	<c:if test="${rowCounter.count % 3 == 0||rowCounter.count == fn:length(values)}">
	      				</tr>
	    		 	</c:if>
		      	 </c:forEach>	
		      	  </table>
		      	 
	      	  </c:if> 
      	  </div>
      </div>
	  </div>
	</div>
  </div>
 </div> 
 <script type="text/javascript">
$(document).ready(function() {
	var graphObj =${chartGraph};
	for(var i=0; i<graphObj.length;i++){
		var graphName =graphObj[i].name;
		var warn_start = graphObj[i].WARN_START;
		var warn_end = graphObj[i].WARN_END;
		var warn_end_max = graphObj[i].MAX;
		var step_value = graphObj[i].STEP_VALUE;
		var dataVal = graphObj[i].value;
		speedMeterChart(graphName,warn_start,warn_end,warn_end_max,step_value,dataVal);
	}
}); 

function speedMeterChart(graphName,warn_start,warn_end,warn_end_max,step_value,dataVal) {
	var chart = AmCharts.makeChart("chartdiv"+graphName, {"theme": "light",
		"type": "gauge",
		"axes": [{
		    "topTextFontSize": 20,
		    "topTextYOffset": 70,
		    "axisColor": "#ccccb3",
		    "axisThickness": 10,
		    "endValue": warn_end_max,
		    "gridInside": true,
		    "inside": true,
		    "radius": "80%",
		    "valueInterval": warn_end_max,
		    "tickColor": "#67b7dc",
		    "startAngle": -90,
		    "endAngle": 90,
		   // "unit": "%",
		    "bandOutlineAlpha": 1,
		    "bands": [{
		      "color": "#00cc00",
		      "endValue": warn_start,
		      "innerRadius": "103%",
		      "radius": "120%",
		      "gradientRatio": [0.5, 0, -0.5],
		      "startValue": 0
		    }, {
		    	"color": "#ff661a",
			      "endValue": warn_end,
			      "innerRadius": "103%",
			      "radius": "120%",
			      //"gradientRatio": [0.5, 0, -0.5],
			      "startValue": warn_start
		    },{
		      "color": "#cc0000",
		      "endValue": warn_end_max,
		      "innerRadius": "103%",
		      "radius": "120%",
		      //"gradientRatio": [0.5, 0, -0.5],
		      "startValue": warn_end
		    }]
		  }],
		  "arrows": [{
		    "alpha": 5,
		    "innerRadius": "35%",
		    "nailRadius": 0,
		    "radius": "100%",
			"color": "#e62e00",
		  }],
		  "titles": [{
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
		  chart.arrows[0].setValue(dataVal);
		  chart.axes[0].setTopText(dataVal);
		} 
}
 
</script> 