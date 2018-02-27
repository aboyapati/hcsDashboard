/* global angular:false */
'use strict';

var connectionApp = angular.module('connectionApp',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
    	
    	//AJAX call here
    	//string response
    	
    	return [{
    		status: "online",
    		profilename: "Home Office",
    		creatorname: "Edward Habib",
    		createddate: "8/3/15",
    		datelastmodified: "8/3/15",
    		datelastused: "8/3/15",
    		lastusedinlab: "Client Lab Test",
    		 }, {
    		status: "online",
    		profilename: "Main Office Location",
    		creatorname: "Edward Habib",
    		createddate: "8/1/15",
    		datelastmodified: "8/1/15",
    		datelastused: "8/1/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
    	    status: "offline",    			 
    		profilename: "Client Site 1",
    		creatorname: "John A Smith",
    		createddate: "7/22/15",
    		datelastmodified: "7/22/15",
    		datelastused: "7/22/15",
    		lastusedinlab: "Client Site 1",
    		 }, {
    	    status: "offline",
    		profilename: "Coffee Shop",
    		creatorname: "Chris Nicholson",
    		createddate: "7/22//15",
    		datelastmodified: "7/22/15",
    		datelastused: "7/22/15",
    		lastusedinlab: "NuCo UC Setup 1",
    		 }, {
    	    status: "offline",
    		profilename: "NuCo UC setup 1 test",
    		creatorname: "Chris Nicholson",
    		createddate: "6/1/15",
    		datelastmodified: "6/1/15",
    		datelastused: "6/1/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
    	    status: "offline",    			 
    		profilename: "VPN 100",
    		creatorname: "John A Smith",
    		createddate: "6/1/15",
    		datelastmodified: "6/1/15",
    		datelastused: "6/1/15",
    		lastusedinlab: "Client Site 1",
    		 }, {
    	    status: "offline",
    		profilename: "Ed's test Lab 2",
    		creatorname: "Edward Habib",
    		createddate: "5/19/15",
    		datelastmodified: "5/19/15",
    		datelastused: "5/19/15",
    		lastusedinlab: "Client Lab Test",
    		 }, {
    	    status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2",
    		 }, {
			status: "offline",
    		profilename: "Client Lab test",
    		creatorname: "Janice Lewis",
    		createddate: "5/7/15",
    		datelastmodified: "5/7/15",
    		datelastused: "5/7/15",
    		lastusedinlab: "Ed's test lab 2"
    	   
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
.controller('ConnectionMyCtrl', function($scope, $timeout, $window, Data, Comparators) {
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