/* global angular:false */
'use strict';

var catalog =  [{
          brand: "Cisco",
          brand_logo:"Cisco Logo",
          credit:50,
          products: [{
        	  product_name: "Cisco CUCM - 105",
        	  logo:"logo loc 1",
        	  product_detail: "A standard tekVizion CUCUM lab includes a VM server Lorem Ipsum is simply dummy text  of the printing and typesetting industry.",
        	  status:"reserve",
          			},
          			{
        	  product_name: "Cisco CUCM - 106",
        	  logo:"logo loc 2",
        	  product_detail: "A standard tekVizion CUCUM lab includes a VM server Lorem Ipsum is simply dummy text  of the printing and typesetting industry.",
        	  status:"coming_soon",
          			},  
          			{
        	  product_name: "Cisco CUCM - 106",
        	  logo:"logo loc 2",
        	  product_detail: "A standard tekVizion CUCUM lab includes a VM server Lorem Ipsum is simply dummy text  of the printing and typesetting industry.",        	  
        	  status:"coming_soon",
          			}]
		}, {
        brand: "Shoretel",
        brand_logo:"Shoretel Logo",
        credit:150,
        products: [{
      	  product_name: "Shoretel CUCM - 105",
      	  logo:"logo loc 1",
      	  product_detail: "A standard tekVizion CUCUM",
      	  status:"coming_soon",
        			},
        			{
      	  product_name: "Shoretel CUCM - 106",
      	  logo:"logo loc 2",
      	  product_detail: "A standard tekVizion CUCUM",
      	  status:"coming_soon",
        			},  
        			{
	    	  product_name: "Shoretel CUCM - 107",
	    	  logo:"logo loc3",
	    	  product_detail: "A standard tekVizion CUCUM",
	    	  status:"coming_soon",
        			}]
		}, {
	        brand: "Mitel",
	        brand_logo:"Mitel Logo",
	         credit:70,	        
	        products: [{
	      	  product_name: "Mitel CUCM - 105",
	      	  logo:"logo loc 1",
	      	  product_detail: "A standard tekVizion CUCUM",
	      	  status:"coming_soon",
	        			},
	        			{
	      	  product_name: "Mitel CUCM - 106",
	      	  logo:"logo loc 2",
	      	  product_detail: "A standard tekVizion CUCUM",
	      	  status:"coming_soon",
	        			}]
		}, {
	        brand: "Microsoft",
	        products: [{
		      	  product_name: "Mitel CUCM - 105",
		      	  logo:"logo loc 1",
		      	  product_detail: "A standard tekVizion CUCUM",
		      	  status:"coming_soon",
		        			}]
		}, {
	        brand: "NEC",	
	        products: [{
		      	  product_name: "Mitel CUCM - 105",
		      	  logo:"logo loc 1",
		      	  product_detail: "A standard tekVizion CUCUM",
		      	  status:"coming_soon",
		        			}]
        }]



var reserveApp = angular.module('reserveApp',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
    };
})
// when sorting by year, sort by year and then replace %
.service("Comparators", function() { 
  this.year = function(r1, r2) {
    if(r1.planYear === r2.planYear) {
      if (r1.extent === r2.extent) return 0;
      return r1.extent > r2.extent ? 1 : -1;
    } else if(!r1.planYear || !r2.planYear) {
      return !r1.planYear && !r2.planYear ? 0 : (!r1.planYear ? 1 : -1);
    }
    return r1.planYear > r2.planYear ? 1 : -1;
  };
})
.controller('ReserveCtrl', function($scope, $timeout, $window, Data, Comparators) {
    $scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };

    $scope.visibleProjects = catalog;
    $scope.ncol = 2; 

})

.filter('array', function() {
        return function(arrayLength) {
            arrayLength = Math.ceil(arrayLength);
            try{
            var arr = new Array(arrayLength);
            for (var i = 0; i < arrayLength; i++) {
                arr[i] = i;
                }
            return arr;
            } catch(err){}
            
        };
});


