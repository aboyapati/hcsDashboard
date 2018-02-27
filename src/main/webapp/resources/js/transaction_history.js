/* global angular:false */
'use strict';

var transacationtxt = [{
    event: "Monthly Backup Fee",
    date: "9/20/2015",
    amount: "$ -25.00"
  }, {
      event: "Lab Reservation 13325",
      date: "9/18/2015",
      amount: "$-300.00"
  }, {
	  event: "Monthly Backup Fee",
      date: "8/20/2015",
      amount: "$-25.00"
  }, {
	  event: "Funds Deposited",
      date: "8/15/2015",
      amount: "$ +500.00"
  }, {
	  event: "Lab Reservation 13321",
      date: "8/12/2015",
      amount: "$-200.00"
    
  }]

var transacationApp = angular.module('transacationApp',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
        return [{
        	  event: "Monthly Backup Fee",
        	    date: "9/20/2015",
        	    amount: "$ -25.00"
        	  }, {
        	      event: "Lab Reservation 13325",
        	      date: "9/18/2015",
        	      amount: "$-300.00"
        	  }, {
        		  event: "Monthly Backup Fee",
        	      date: "8/20/2015",
        	      amount: "$-25.00"
        	  }, {
        		  event: "Funds Deposited",
        	      date: "8/15/2015",
        	      amount: "$ +500.00"
        	  }, {
        		  event: "Lab Reservation 13321",
        	      date: "8/12/2015",
        	      amount: "$-200.00"   
        }];
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
.controller('TransactionMyCtrl', function($scope, $timeout, $window, Data, Comparators) {
    //$scope.visibleProjects = Data.get();
		
	$scope.addEntry = function() {
		transacationtxt.push({        //add the employee
			event: "Monthly Backup Fee",
			 date: "12/30/2015",
			 amount: "$-25.00"
    	});
    };
    
    $scope.deleteEntry = function(){
    	transacationtxt.splice(-1, 1);
    };
    
	$scope.visibleProjects = transacationtxt;
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        //$scope.visibleProjects = Data.get();
    	$scope.visibleProjects = transacationtxt;
    };
    
})
;

transacationApp.controller('ButtonController', ['$scope', function($scope) {
    $scope.spice = 'very';

    $scope.addEntry = function() {
    	transacationtxt.push({        //add the employee
    		event: "Monthly Backup Fee",
			 date: "12/30/2015",
			 amount: "$-25.00"
    	});
    };

    $scope.jalapenoSpicy = function() {
        $scope.spice = 'jalapeño';
    };
}]);