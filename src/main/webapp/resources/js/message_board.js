/* global angular:false */
'use strict';

var msg_board_txt = [{
	user: "ehabib",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:55.0",
	msg:"-"
}, {
	user: "ehabib",
	msgtitle: "User Logged off",
	date: "2015-06-15 13:40:55.1",
	msg:"-"
}, {
	user: "tekVizion",
	msgtitle: "SCHEDULED DOWNTIME SEP 23",
	date: "2015-06-15 13:40:55.2",
	msg:"Services will be down all day on SEP 23. Please"
}, {
	user: "jones",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:55.3",
	msg:"-"
}, {
	user: "chris",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:55.4",
	msg:"-"
}, {
	user: "jeremy201",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:55.5",
	msg:"User logged to monitor"
}, {
	user: "jeremy201",
	msgtitle: "User Logged off",
	date: "2015-06-15 13:40:55.6",
	msg:"-"
}, {
	user: "ehabib",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:56.1",
	msg:"-"
}, {
	user: "chris",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:56.2",
	msg:"-"
}, {
	user: "jeremy201",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:56.3",
	msg:"-"
}, {
	user: "jeremy201",
	msgtitle: "User Logged off",
	date: "2015-06-15 13:40:56.4",
	msg:"-"
}, {
	user: "ehabib",
	msgtitle: "User Logged on",
	date: "2015-06-15 13:40:56.9",
	msg:"-"
}]


var msg_board_App = angular.module('msg_board_App',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
        return [{
           	user: "ehabib",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:55.0",
        	msg:"-"
        }, {
        	user: "ehabib",
        	msgtitle: "User Logged off",
        	date: "2015-06-15 13:40:55.1",
        	msg:"-"
        }, {
        	user: "tekVizion",
        	msgtitle: "SCHEDULED DOWNTIME SEP 23",
        	date: "2015-06-15 13:40:55.2",
        	msg:"Services will be down all day."
        }, {
        	user: "jones",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:55.3",
        	msg:"-"
        }, {
        	user: "chris",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:55.4",
        	msg:"-"
        }, {
        	user: "jeremy201",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:55.5",
        	msg:"User logged to monitor"
        }, {
        	user: "jeremy201",
        	msgtitle: "User Logged off",
        	date: "2015-06-15 13:40:55.6",
        	msg:"-"
        }, {
        	user: "ehabib",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:56.1",
        	msg:"-"
        }, {
        	user: "chris",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:56.2",
        	msg:"-"
        }, {
        	user: "jeremy201",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:56.3",
        	msg:"-"
        }, {
        	user: "jeremy201",
        	msgtitle: "User Logged off",
        	date: "2015-06-15 13:40:56.4",
        	msg:"-"
        }, {
        	user: "ehabib",
        	msgtitle: "User Logged on",
        	date: "2015-06-15 13:40:56.9",
        	msg:"-"
        }];
    };
})
// when sorting by year, sort by year and then replace %
.service("Comparators", function() { 
  this.year = function(r1, r2) {
    if(r1.date === r2.date) {
      if (r1.extent === r2.extent) return 0;
      return r1.extent > r2.extent ? 1 : -1;
    } else if(!r1.date || !r2.date) {
      return !r1.date && !r2.date ? 0 : (!r1.date ? 1 : -1);
    }
    return r1.date > r2.date ? 1 : -1;
  };
})
.controller('MessgaeBoardCtrl', function($scope, $timeout, $window, Data, Comparators) {
    
	$scope.addEntry = function() {
    	msg_board_txt.push({        //add the employee
    		user: "Ammu",
        	msgtitle: "ammu Logged on",
        	date: "2015-06-15 10:10:10.10",
        	msg:"User Ammu logged on bdsbcvswgh bgcdskjhgc d dgcgh ceghuighc bgcediuedgh giwe"
    	});
    };
    
    $scope.deleteEntry = function(){
    	msg_board_txt.splice(-1, 1);
    };
    
	$scope.visibleProjects = msg_board_txt;
    
	
	//$scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };

    
})
;