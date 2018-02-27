<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>

	<style>
	  #chart { position: static; }
	.chart-text { 
	    margin-top: -165px;
	    margin-left: 110px;
	   
	 }
	.testplan_select{
		background-image: url("/hcs/resources/images/epam/smallDropDown.png");
		background-repeat: no-repeat;
		width: 186px;
		height:36px;
		border:0;
		outline:0;	
		color:#7694b7;	
		padding:1px 40px 1px 5px;
		line-height: normal;	
		-webkit-appearance: none;
	  	-moz-appearance:none;
	  	-o-appearance:none;
	   	appearance:none; 	
	   	cursor: pointer;
	}
	</style>
</head>	
<script src="<c:url value='/resources/js/metro/jquery.multi-open-accordion-1.5.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>
 
	<!-- For Generating Graphs -->
	<script src="<c:url value='/resources/js/Chart.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/js/Chart-new.min.js'/>"></script>

<div  id ="displayVirtualLab" class ="displayVirtualLab">
  <div id="appId" ng-app="lablist_App" ng-cloak> 
	<div class="vlab_inner_table">
	<input type="hidden" id="componentId" value="${componentId}" />
	<input type="hidden" id="property" value="${property}" />
	<input type="hidden" id="lastXDays" value="${lastXDays}" />		
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
			  	<li>
			  		<a href="componentDetailDashboard?componentId=${componentId}&&property=${property}&&lastXDays=Last 3 Months" >${property}</a>
			  	</li>
			  	
   			</div>
    		<div style="padding-left: 18px;font-weight:300;font-size: 14px;float:right;">   									
				<select id="select_historyDate" class="testplan_select" onchange="fetchHistoryDatesData()">
					<c:forEach var="componentsHistoryDates" items="${componentsHistoryList}">
						<option value="${componentsHistoryDates}">${componentsHistoryDates}</option>
					</c:forEach>
				</select>				
			</div>
   			 <div style="height: 545px;width: 939px;overflow: auto;margin-left: 30px; padding-top: 45px;">		
	   			<div  id="bargraph" style="width: 650px; height: 150px; float: right;">
	   					<canvas id="summary_bar_chart" class="barchart"></canvas>		
	  	      	 </div>
				  <div id="chart" >
				 	<div style="width: 250px; height: 250px;">
			      	 <canvas id="myChart"></canvas>
			      	 <div class="chart-text" id="text1"></div>
			      	 </div>
			      	 
		      	 </div>
	      	 </div>
    	  </div>
	  </div>
	</div>
  </div>
 </div> 
 <script type="text/javascript">
 var summaryBarChart ="";
$(document).ready(function() {
	var avail = ${avail};
	var consumed = ${consumed};
	var property = $("#property").val();
	var lastXDays = $("#lastXDays").val();
	var totalavailablememory = ${totalAvailableMemory};
	var totalusedvalue = ${totalUsed};
	var xAxisData = ${xAxisDataList};
	var yAxisData = ${yAxisDataList};
	$("#select_historyDate").val($.trim(lastXDays));
	doughnutPie(avail,consumed,totalavailablememory,totalusedvalue);
	barChart(avail, property,xAxisData,yAxisData);
});		 
 function doughnutPie(avail,consumed,totalavailablememory,totalusedvalue){
	 //alert('pie');
	 var data = {
		 labels: [
		 "Consumed",        
		 "Avail"
		 ],
		datasets: [{
		    data: [consumed,avail],
		    backgroundColor: [
			"#e62e00",
		    "#00cc00"
		    ],
		    /* hoverBackgroundColor: [
			"#e62e00",
		    "#00cc00"
		    ] */
		  }]
		};

	var promisedDeliveryChart = new Chart(document.getElementById('myChart'), {
	  type: 'doughnut',
	  data: data,
	  options: {
	  	responsive: true,
		cutoutPercentage:70,
		  title: {
	           	display: true,
	 			    position: 'bottom',
	 			   text: totalusedvalue+"/"+totalavailablememory,
	 			    fontColor: '#203c66',
	 			    fontFamily:'Source Sans Pro'
	            },
	            
	    legend: {
	    	display: true,
	 			position:'bottom',
	 			//text: consumed+"/"+avail,
	 			onClick:null,
	 			labels:{
	 				boxWidth:30,
	 			    fontStyle:'normal',
	 			    fontColor:'#666',
	 			    fontFamily:'Arial',
	 			 }
	    },animation:{
				animateScale:false,
				animateRotate: false,
			},
	  }
	});
	var text1 = document.getElementById('text1');
	   Chart.pluginService.register({
	   beforeDraw: function(chart) {
		var width = chart.chart.width,
	    height = chart.chart.height;
	    var fontSize = (height / 114).toFixed(2);
	    text1.font = fontSize+"em sans-serif";
	   
	    var text = consumed+"%";
	    text1.innerText = text;
	    var r = text1.getBoundingClientRect();
	    text1.style.left = ((width-r.width)/2)+"px";
	    text1.style.top = ((height-r.height)/2)+"px"; 
	  }
	});
 }
 function barChart(avail, property,xAxisData,yAxisData){
	 for (var i = 0; i < yAxisData.length; i++) {
	 	if(yAxisData[i]>0){
	 		showGreenBarGraph(avail, property,xAxisData,yAxisData);
	 	}else{
	 		yAxisData[i]=100;
	 		showRedBarGraph(avail, property,xAxisData,yAxisData);
	 	}
	 }	 
}
 function showGreenBarGraph(avail, property,xAxisData,yAxisData){
	var barCanvas = document.getElementById("summary_bar_chart");
	var ctx_chart = barCanvas.getContext('2d');
	summaryBarChart =null;
	summaryBarChart = new Chart(ctx_chart, {
		type: 'bar',
		data: {
			//labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct","Nov", "Dec"], //X-Axis
			labels:xAxisData, //X-Axis
			datasets: [{
				label: property,
				backgroundColor: "#00cc00",
				hoverBackgroundColor:"#00cc00",
				data: yAxisData, // Y-Axis
			}]
		 },
		tooltipTitleFontSize: 0,
		options: {
			legend:{
			    display: false
			}, 
			tooltips: {
				"enabled": true
			},
			title: {
			     display: false,
			     text: "",
			 },
			 "animation": {
			 	 "onComplete": function() {
			     	var chartInstance = this.chart,
			        ctx = chartInstance.ctx;
			        ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
			        ctx.textAlign = 'center';
			        ctx.textBaseline = 'bottom';
			        this.data.datasets.forEach(function(dataset, i) {
			        for (var i = 0; i < dataset.data.length; i++) {
		              	var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
		                scale_max = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._yScale.maxHeight;
		                ctx.fillStyle = '#444';
		                var y_pos = model.y - 5;
		                // Make sure data value does not get overflown and hidden
		                // when the bar's value is too close to max value of scale
		                // Note: The y value is reverse, it counts from top down
		                if ((scale_max - model.y) / scale_max >= 0.93)
		                  		y_pos = model.y + 20; 
		                        ctx.fillText(dataset.data[i], model.x, y_pos);
		              }
			        });
			      }
			  },
			  barThickness: 1,
				scales: {
					xAxes: [{
				    	scaleLabel: {
				    	  display: true  
				    	},
				    	/* gridLines: {
				    	    display: false
				    	}, */
			       stacked: true,
			       barPercentage: 0.3,
			       categoryPercentage: 0.3,
			       //     barThickness:0.5,
			  		}],
			        yAxes: [{
				        ticks: {	            
			            	min: 0,
			                callback: function(value){				                	   
			                if (Math.floor(value) === value) {
			                	if(property=="MEMORY" || property=="DATASTORE"){
				              		return value+' GB';
			              		 }  
			                	return value;   
			                }
				        	},    
				         },  
		                /* gridLines: {
		                    display: false
		                  }, */
		                scaleLabel: {
	  	        	        	display: false,
	  	        	        	labelString: property,
	  	        	         	fontSize: 18,
	  	        	        	fontColor: '#203c66',
	  			  			    fontFamily:'Source Sans Pro'
	  	        	         },
		            	stacked: true
			            }]
			        }
				}
			});	
	
	}
 function showRedBarGraph(avail, property,xAxisData,yAxisData){
	var barCanvas = document.getElementById("summary_bar_chart");
	var ctx_chart = barCanvas.getContext('2d');
	var summaryBarChart = new Chart(ctx_chart, {
		  type: 'bar',
		  data: {
		    labels:xAxisData, //X-Axis
		    datasets: [{
		      label: property,
		      //data: [1], // Y-Axis
			 }]
		  },
		  tooltipTitleFontSize: 0,
		  options: {
			  legend:{
		        	display: false
			    }, tooltips: {
			        "enabled": true
			    },
		        title: {
		            display: false,
		       		text: "",
		        },
		        
			    barThickness: 1,
			    scales: {
		            yAxes: [{
			            ticks: {	            
			                    min: 0,
			                    max: 1,
			                     callback: function(value){				                	   
			                	   if (Math.floor(value) === value) {
			                		   return value;   
			                	 	}
				               },    
			                } 
		            }]
		        }
			}
		});	
 }		
  
 function fetchHistoryDatesData(){
	var lastXDays = $("#select_historyDate").val();
	var componentId = $("#componentId").val();
	var property = $("#property").val();
	var data = 	'componentId='+ encodeURIComponent($.trim(componentId))	 
	+'&&property='+ encodeURIComponent($.trim(property))
	+'&&lastXDays='+ encodeURIComponent($.trim(lastXDays));
	summaryBarChart.destroy();
	//window.location = "componentDetailDashboard?"+data;/* "componentDetailDashboard?componentId=2c90a05560b708320160b70c33eb0002&&property=VRF"; */
   $.ajax({
	url : "componentDetailList",
	data : data,
	type : "GET",
	success : function(result) {
		var xAxisData1 =null;
		var xAxisData = result['xAxisDataList'];
		var yAxisData = result['yAxisDataList'];
		var avail = result['avail'];
		var consumed = result['consumed'];
		var totalusedvalue = result['totalUsed'];
		var totalavailablememory = result['totalAvailableMemory'];
		var property = result['property'];
		var lastXDays = result['lastXDays'];
		$("#select_historyDate").append($.trim(lastXDays));
		doughnutPie(avail,consumed,totalavailablememory,totalusedvalue);
		showGreenBarGraph(avail, property,xAxisData,yAxisData)
	},
	error : function(xhr, status, error) {
		if(error=="Not Found"){
			bootbox.alert("Session Expired..Please Login again..",function(){window.location = "login";
			}).find("div.modal-content").addClass("modalfailure");
		}
		else{
			bootbox.alert("Unknown Error occurred. Try again later").find("div.modal-content").addClass("modalfailure");
		}
	}
});  
	
	
 }
</script>
</html> 	