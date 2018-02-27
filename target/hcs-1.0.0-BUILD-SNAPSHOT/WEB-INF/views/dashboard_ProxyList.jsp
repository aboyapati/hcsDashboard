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
/* #chartdivWatertown {
  width: 100%;
  height: 365px;
} */
#chartdiv {
  width: 100%;
  height: 365px;
}
#chartdiv1 {
  width: 100%;
  height: 365px;
}
#chartdiv2 {
  width: 100%;
  height: 365px;
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
		   <%--  <c:if test="${not empty dashboardchartGraph}">
			 <c:forEach var="graphObj" items="${dashboardchartGraph}">
					 <!-- <div id="div_hcsStatus" style="max-height: 150px; max-width: 360px; margin-left: 20px; margin-top: -152px;" > 	 -->
		      		 	<div id="chartdiv${graphObj.graphkey}"></div> 
		      		 	<!--  <div id="chartdiv"></div> -->
		      		<!--  </div>  -->
	      	  </c:forEach>	
      	  </c:if>  --%>
      	 <div id="div_hcsStatus" style="max-height: 150px; max-width: 360px; margin-left: 20px; margin-top: 15px;" > 	
      		 	 <div id="chartdiv"></div>
      		</div>
      		 <div id="div_hcsStatus1" style="max-height: 150px; max-width: 360px; margin-left: 420px; margin-top: 15px;" > 	
      		 	 <div id="chartdiv1"></div>
      		</div>	
      		<div id="div_hcsStatus2" style="max-height: 150px; max-width: 360px; margin-left: 655px; margin-top: 15px;"  > 	
      		 	 <div id="chartdiv2"></div>
      		</div>
      </div>
	  </div>
	</div>
  </div>
 </div> 
 <script type="text/javascript">
$(document).ready(function() {
	// alert('HI');
	
	 var data ={"theme": "light",
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
	  		  }]	
	  		 }
	 var data1 ={"theme": "light",
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
	  		  }]	
	  		 }
	 
	  var chart = AmCharts.makeChart("chartdiv", data);
  	alert(chart);
  	setInterval(randomValue, 2000);
		// set random value
		function randomValue() {
		  //alert(mathval);
		  var value = (0.6 * 100);
		  chart.arrows[0].setValue(value);
		  chart.axes[0].setTopText(value + " %");
		  // adjust darker band to new value
		  chart.axes[0].bands[1].setEndValue(value);
		} 
	 
		 var chart = AmCharts.makeChart("chartdiv1", data1);
		  	alert(chart);
		  	setInterval(randomValue, 1000);
				// set random value
				function randomValue() {
				  //alert(mathval);
				  var value = (0.3 * 100);
				  chart.arrows[0].setValue(value);
				  chart.axes[0].setTopText(value + " %");
				  // adjust darker band to new value
				  chart.axes[0].bands[1].setEndValue(value);
				}
				/*
				var data2=data;
				 var chart = AmCharts.makeChart("chartdiv2", data2);
				  	alert(chart);
				  	setInterval(randomValue, 2000);
						// set random value
						function randomValue() {
						  //alert(mathval);
						  var value = (0.8 * 100);
						  chart.arrows[0].setValue(value);
						  chart.axes[0].setTopText(value + " %");
						  // adjust darker band to new value
						  chart.axes[0].bands[1].setEndValue(value);
						} */
		
	 
	 
	// alert('ss');
    /*  var graphObj =${chartGraph};
	// alert(graphObj)
    for(var i=0; i<graphObj.length;i++){
   	 var graphName =graphObj[i].graphkey;
   	// alert(graphName)
		//get canvas id of Line charts
     	//var chart = $("#chartdiv"+"_"+graphName);
   		//var ss=("chartdiv")+graphName;
   		//alert(ss);
   		// var xx1=document.getElementById("div_hcsStatus");
   		//alert(xx1);
   	 
   		var xx=document.getElementById("chartdiv"+graphName);
   		alert(xx);
   		xx.setAttribute("style", "width: 100%; height:365px;");
     	var chart = AmCharts.makeChart(xx, data);
     	setInterval(randomValue, 2000);
  		// set random value
  		function randomValue() {
  		  //alert(mathval);
  		  var value = (0.6 * 100);
  		  chart.arrows[0].setValue(value);
  		  chart.axes[0].setTopText(value + " %");
  		  // adjust darker band to new value
  		  chart.axes[0].bands[1].setEndValue(value);
  		}  */
    //}     

	 
	 
	 	
}); 
</script> 