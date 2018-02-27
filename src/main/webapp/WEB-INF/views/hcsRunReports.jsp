<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
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
 <!--  <div id="appId" ng-app="lablist_App" ng-cloak> -->
	<div class="vlab_inner_table">
			
	  <div ng-controller="MyReservationCtrl" class="lablist_container">	
		<div id ="myReservations">			
		<!--   <scrollable-table watch="visibleProjects"> -->
		 
			<div id="div_hcsStatus" style="max-height: 150px; max-width: 350px; margin-left: 0px;" hidden="true"> 	
      		 	<%-- <canvas id="consumedPieChart"></canvas>
      		 	<div id="canvasLegend"></div> --%>
      		 	 <div id="chartdiv"></div>
      		 	 
      		</div>	
      		<div id="div_hcsStatus1" style="max-height: 150px; max-width: 360px; margin-left: 290px; margin-top: -152px;" hidden="true"> 	
      		 	 <div id="chartdiv1"></div>
      		</div>	
      		<div id="div_hcsStatus2" style="max-height: 150px; max-width: 360px; margin-left: 591px; margin-top: -147px;"  hidden="true"> 	
      		 	 <div id="chartdiv2"></div>
      		</div>			 	
		</div>
	  </div>
	</div>
 <!--  </div> -->
</div>

<script>
$(document).ready(function() {
	
	 $('#div_hcsStatus').show(); 
	 $('#div_hcsStatus1').show(); 
	 $('#div_hcsStatus2').show(); 
	 	
}); 
</script> 