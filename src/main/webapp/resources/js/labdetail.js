/* global angular:false */
'use strict';

var vm =[{
			vmname: "VM Name is here one",
			status: "on",
			}, {
			vmname: "VM Name is here one",
			status: "off",
			}, {
			vmname: "VM Name is here one",
			status: "on",
			}, {	
			vmname: "VM Name is here one",
			status: "on",	
			}, {
			vmname: "VM Name is here one",
			status: "off",
			}, {
			vmname: "VM Name is here one",
			status: "on",				
		}]

var backup =[{
profilename: "My Backup-2",
creatorname: "My Second Backup Image",
createddate: "06-25-2015",
status:"Completed",
lastusedinlab: "Integration Testing",
}, {
	profilename: "My Backup-3",
creatorname: "My Third Backup Image",
createddate: "06-25-2015",
status:"Completed",
lastusedinlab: "Integration Testing",
}, {
	profilename: "My Backup-3",
creatorname: "My Third Backup Image",
createddate: "06-25-2015",
status:"Completed",
lastusedinlab: "Integration Testing",
}, {
	profilename: "My Backup-3",
creatorname: "My Third Backup Image",
createddate: "06-25-2015",
status:"Completed",
lastusedinlab: "Integration Testing",
}];


var labdetailApp = angular.module('labdetailApp',['scrollable-table'])
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
.controller('vmCtrl', function($scope, $timeout, $window, Data, Comparators) {
    $scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };
    
    
    $scope.visibleProjects = vm;

    
})

.controller('hwCtrl', function($scope, $timeout, $window, Data, Comparators) {
    $scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };
    
    
    $scope.visibleProjects = vm;

    
})

.controller('backupCtrl', function($scope, $timeout, $window, Data, Comparators) {
    $scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };
    $scope.visibleProjects = backup;
    
})
;