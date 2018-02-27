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

	<title>HCS Project</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/reserveLab.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/lablist.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/labs.css"/>"/>
	<script src="<c:url value='/resources/js/metro/jquery.multi-open-accordion-1.5.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>
	
		<!-- For Generating Graphs -->
	<%-- <script src="<c:url value='/resources/js/Chart.min.js'/>"></script>
    <script src="<c:url value='/resources/js/Chart-new.min.js'/>"></script>
    <script src="<c:url value='/resources/js/legend.js'/>"></script>
    <script src="<c:url value='/resources/js/legend.js'/>"></script> --%>
    
    <%-- <script src="<c:url value='/resources/js/jquery-1.9.1.js'/>"></script> --%>
	<%-- <script src="<c:url value='/resources/js/Chart.js'/>"></script> --%>
	
	<%-- <script src="<c:url value='/resources/js/legend.js'/>"></script> --%>
	<%-- <script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script> --%>
	
	
	<link rel="stylesheet" href="<c:url value="/resources/css/export.css"/>" type="text/css" media="all"/>
	<script src="<c:url value='/resources/js/amcharts.js'/>"></script>
	<script src="<c:url value='/resources/js/gauge.js'/>"></script>
	<script src="<c:url value='/resources/js/export.min.js'/>"></script>
	<script src="<c:url value='/resources/js/light.js'/>"></script>
 

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
		
		.displayVirtualLab .scrollableContainer {
			height: 580px !important;
		}
		
		.displayVirtualLab .scrollArea {
		 	height: 540px !important;
		}
		
		#myReservations {
			padding-top: 25px;
		}
		
		a .glyphicon{
			margin-left: 2px;
			margin-right: 2px;
			text-align: center;
			color: #7694b7 !important;
		}
		.glyphicon {
	 		font-size: large;
		}
		
		.projectName{
			color: #337ab7 !important;
			text-decoration: none; 
			font-size: 14px; 
			font-weight: bold;
			text-decoration: none !important;
		}
		.graph_select{
		    background-image: url(resources/images/epam/testplan_dropdown.png);
		    background-repeat: no-repeat;
		    width: 286px;
		    height: 36px;
		    border: 0;
		    outline: 0;
		    color: #7694b7;
		    padding: 1px 40px 1px 5px;
		    line-height: normal;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    -o-appearance: none;
		    appearance: none;
		    cursor: pointer;
		    margin-right: 10px;
		    margin-top: -11px;
		    float: right;
    	}
		
	</style>
<script type="text/javascript">
	$(document).ready(function() {
		angular.bootstrap(document.getElementById("appId"), ['lablist_App']);
	//});
	      //alert('sfsfsdfds');
	       $.ajax({
	              type: "GET",
	              url: "getReportData",
	              cache: false,                    
	              contentType: "application/json; charset=utf-8",
	              success: function(response){
	            	 // alert('1');
	            	 speedMeterChart();
	            	 $('#div_hcsStatus').show();	
	            	 speedMeterChart1();
	            	 $('#div_hcsStatus1').show();	
	            	 speedMeterChart2();
		             $('#div_hcsStatus2').show();	
	            	 //alert('3');
	              },
	              error: function(response){              
	                     alert('Error while request..');
	                    
	              }
	       });
	      
     }); 
	 
     /* function speedMeterChart() {
   	  var chart = AmCharts.makeChart("chartdiv1", data1);
   		chart.arrows[0].setValue(60);
   	 	 chart.axes[0].setTopText(value + " %");
		  // adjust darker band to new value
		  chart.axes[0].bands[1].setEndValue(value);
   		//setInterval(randomValue, 2000);
   		//alert(chart);
   		// set random value
   		function randomValue() {
   		  //var mathval=Math.round(Math.random());
   		  //alert(mathval);
   		  var value = (0.6 * 100);
   		  chart.arrows[0].setValue(value);
   		  chart.axes[0].setTopText(value + " %");
   		  // adjust darker band to new value
   		  chart.axes[0].bands[1].setEndValue(value);
   		}
     }	 */
   	 function speedMeterChart() {
      	  var chart = AmCharts.makeChart("chartdiv", data);
   		
      		setInterval(randomValue, 2000);
      		alert(chart);
      		// set random value
      		function randomValue() {
      		  //var mathval=Math.round(Math.random());
      		  //alert(mathval);
      		  var value = (0.6 * 100);
      		  chart.arrows[0].setValue(value);
      		  chart.axes[0].setTopText(value + " %");
      		  // adjust darker band to new value
      		  chart.axes[0].bands[1].setEndValue(value);
      		} 
     }
   	 //var chart1 = AmCharts.makeChart("chartdiv1", data);
		
		/* setInterval(randomValue1, 2200);
		alert(chart1);
		// set random value
		function randomValue1() {
		  //var mathval=Math.round(Math.random());
		  //alert(mathval);
		  var value = (0.7 * 100);
		  chart1.arrows[1].setValue(value);
		  chart1.axes[1].setTopText(value + " %");
		  // adjust darker band to new value
		  chart1.axes[1].bands[1].setEndValue(value);
		} */
	
    /*  } */
      function speedMeterChart1() {
      	  var chart = AmCharts.makeChart("chartdiv1", data1);
   		
      		setInterval(randomValue1, 2000);
      		alert(chart);
      		// set random value
      		function randomValue1() {
      		  //var mathval=Math.round(Math.random());
      		  //alert(mathval);
      		  var value = (0.4 * 100);
      		  chart.arrows[0].setValue(value);
      		  chart.axes[0].setTopText(value + " %");
      		  // adjust darker band to new value
      		  chart.axes[0].bands[1].setEndValue(value);
      		}
      	 
   	
        }
      function speedMeterChart2() {
      	  var chart = AmCharts.makeChart("chartdiv2", data2);
   		
      		setInterval(randomValue, 2000);
      		alert(chart);
      		// set random value
      		function randomValue() {
      		  //var mathval=Math.round(Math.random());
      		  //alert(mathval);
      		  var value = (0.3 * 100);
      		  chart.arrows[0].setValue(value);
      		  chart.axes[0].setTopText(value + " %");
      		  // adjust darker band to new value
      		  chart.axes[0].bands[1].setEndValue(value);
      		} 
     }
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
    		    "radius": "60%",
    		    "valueInterval": 10,
    		    "tickColor": "#67b7dc",
    		    "startAngle": -90,
    		    "endAngle": 90,
    		    "unit": "%",
    		    "bandOutlineAlpha": 1,
    		    "bands": [{
    		      "color": "#0080ff",
    		      "endValue": 100,
    		      "innerRadius": "105%",
    		      "radius": "120%",
    		      "gradientRatio": [0.5, 0, -0.5],
    		      "startValue": 0
    		    }, {
    		      "color": "#3cd3a3",
    		      "endValue": 0,
    		      "innerRadius": "105%",
    		      "radius": "120%",
    		      "gradientRatio": [0.5, 0, -0.5],
    		      "startValue": 0
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
     var data2 ={"theme": "light",
      		  "type": "gauge",
      		  "axes": [{
      		    "topTextFontSize": 20,
      		    "topTextYOffset": 70,
      		    "axisColor": "#31d6ea",
      		    "axisThickness": 10,
      		    "endValue": 100,
      		    "gridInside": true,
      		    "inside": true,
      		    "radius": "60%",
      		    "valueInterval": 10,
      		    "tickColor": "#67b7dc",
      		    "startAngle": -90,
      		    "endAngle": 90,
      		    "unit": "%",
      		    "bandOutlineAlpha": 1,
      		    "bands": [{
      		      "color": "#0080ff",
      		      "endValue": 100,
      		      "innerRadius": "105%",
      		      "radius": "120%",
      		      "gradientRatio": [0.5, 0, -0.5],
      		      "startValue": 0
      		    }, {
      		      "color": "#3cd3a3",
      		      "endValue": 0,
      		      "innerRadius": "105%",
      		      "radius": "120%",
      		      "gradientRatio": [0.5, 0, -0.5],
      		      "startValue": 0
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
	
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	<%@include file="header.jsp" %>
	<div id="content" style="margin-top: 10px;">
	 
	 	<%-- 	<div class="customerName">${proxyName}</div>
			<br/>
		  	<ul class="table_tabs" style="margin-left: -7px; margin-top: 10px;">		
		 
  			<li class="table_tab_unselected">
					<a style="text-decoration: none; font-weight: normal; color:#203c66;" class="table_tab_data" href="dashboard">
			  			<b>Links</b>
					</a>
				</li>
				<li class="table_tab_unselected">
					<a style="text-decoration: none; font-weight: normal; color:#203c66;" class="table_tab_data" href="allProjects">
			  			<b>All Projects</b>
					</a>
				</li>
				<li class="table_tab_unselected">
					<a style="text-decoration: none; font-weight: normal; color:#203c66;" class="table_tab_data" href="dynamicReports">
			  			<b>Reports</b>
					</a>
				</li>
				<li class="table_tab_selected">
					<a style="text-decoration: none; font-weight: normal; color:#203c66;" class="table_tab_data" href="hcsRunReports">
			  			<b>HCS Dashboard</b>
					</a>
				</li>	
		</ul> --%>
  		<!-- <div class="outline_border outline_border_fourTabs" style=" margin-top:-1px;"> -->
				 <!-- <div style=" font-size: 15px; width: 1099px; padding-left: 590px;" class="customerName" ></div> -->
				 	<%-- <table>
						<tbody>
							<tr>
								<td>
							  		<label class="label_text" style="margin-top: 7px; padding: 0 7px; ">VCenters: </label>
									<select id="vCenter_filter_link" class="graph_select" name="vcenters" style="margin-right:38px;">
										<option value="">All</option>
										<c:forEach var="vcenter" items="${vCenterList}">
										  		<option value="${vcenter}">${vcenter}</option> 
										</c:forEach>
									</select>
							  	</td>
							  	<td>
							  		<label class="label_text" style="margin-top: 7px; padding: 0 7px; ">VResources: </label>
									<select id="vResource_filter_link" class="graph_select" name="vresources" style="margin-right:38px;" onchange="showReportGraph()">
										<option value="">All</option>
										<c:forEach var="vresource" items="${vResourceList}">
										  		<option value="${vresource}">${vresource}</option> 
										</c:forEach>
									</select>
							  	</td>
							   
							</tr>
						</tbody>
					</table> --%>		
				 <%@include file="hcsRunReports.jsp" %> 
				 
		  <!-- </div> -->
  		
  		<div class="lab_info_hover id-left" style="width:500px; height: auto;"><p type="text" class="vendor_hover" style="white-space: normal; text-overflow: clip;"></p></div>
	</div>
	
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>