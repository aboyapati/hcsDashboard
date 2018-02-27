/* global angular:false */
'use strict';

var mybackupsApp = angular.module('mybackupsApp',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
    	
    	//AJAX call here
    	//string response
    	
    	return [{
		    		backupname: "My Backup-2",
		    		description: "My Second Backup Image",
		    		createdon: "06-25-2015",
		    		labname: "Integration Testing",
    		 }, {
    			 	backupname: "My Backup-3",
    	    		description: "My Third Backup Image",
    	    		createdon: "06-25-2015",
    	    		labname: "Integration Testing",
    		 }, {
    			 	backupname: "My Backup-3",
    	    		description: "My Third Backup Image",
    	    		createdon: "06-25-2015",
    	    		labname: "Integration Testing",
    		 }, {
    			 	backupname: "My Backup-3",
    	    		description: "My Third Backup Image",
    	    		createdon: "06-25-2015",
    	    		labname: "Integration Testing",
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
.controller('ResLabBackupMyCtrl', function($scope, $timeout, $window, Data, Comparators) {
    $scope.visibleProjects = Data.get();
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