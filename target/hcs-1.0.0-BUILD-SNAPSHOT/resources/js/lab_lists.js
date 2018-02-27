/* global angular:false */
'use strict';

var lablist_txt = [{
	state: "on",
	labname: "Admin test Lab 01",
	connProfile: "Profile Name",
	startdate: "2015-06-14 ",
	duration:"2 Wk",
	admin:"TekVizion",
	backup:"none"
	 
}, {
	state: "on",
	labname: "Admin test Lab 57",
	connProfile: "Profile Name",
	startdate: "2015-06-13 ",
	duration:"2 Wk",
	admin:"TekVizion",
	backup:"backup"
	 
}, {
	state: "off",
	labname: "Admin test Lab 36",
	connProfile: "Profile Name",
	startdate: "2015-06-12 ",
	duration:"2 Wk",
	admin:"Edward Habib",
	backup:"none"
	 
}, {
	state: "on",
	labname: "Admin test Lab 71",
	connProfile: "Profile Name",
	startdate: "2015-06-11 ",
	duration:"2 Wk",
	admin:"TekVizion",
	backup:"backup"
	 
}, {
	state: "off",
	labname: "Admin test Lab 05",
	connProfile: "Profile Name",
	startdate: "2015-06-10 ",
	duration:"2 Wk",
	admin:"TekVizion",
	backup:"backup"
	 
}, {
	state: "off",
	labname: "Admin test Lab 86",
	connProfile: "Profile Name",
	startdate: "2015-06-09 ",
	duration:"2 Wk",
	admin:"Edward Habib",
	backup:"none"
	 
}, {
	state: "on",
	labname: "Admin test Lab 37",
	connProfile: "Profile Name",
	startdate: "2015-06-08 ",
	duration:"2 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "on",
	labname: "Admin test Lab 18",
	connProfile: "Profile Name",
	startdate: "2015-06-07 ",
	duration:"2 Wk",
	admin:"TekVizion",
	backup:"backup"
	 
}, {
	state: "off",
	labname: "Admin test Lab 02",
	connProfile: "Profile Name",
	startdate: "2015-06-06 ",
	duration:"2 Wk",
	admin:"Edward Habib",
	backup:"none"
	 
}, {
	state: "off",
	labname: "Admin test Lab 55",
	connProfile: "Profile Name",
	startdate: "2015-06-05 ",
	duration:"2 Wk",
	admin:"Edward Habib",
	backup:"none"
	 
}, {
	state: "off",
	labname: "Admin test Lab 20",
	connProfile: "Profile Name",
	startdate: "2015-06-04 ",
	duration:"2 Wk",
	admin:"TekVizion",
	backup:"backup"
}]

var lablist_txt1 = [{
	state: "off",
	labname: "Ed's test Lab 10",
	connProfile: "My Profile Name",
	startdate: "2015-06-02 ",
	duration:"5 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "off",
	labname: "Ed's test Lab 20",
	connProfile: "My Profile Name",
	startdate: "2015-06-05 ",
	duration:"2 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "on",
	labname: "Ed's test Lab 33",
	connProfile: "My Profile Name",
	startdate: "2015-06-22 ",
	duration:"1 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "on",
	labname: "Ed's test Lab 01",
	connProfile: "My Profile Name",
	startdate: "2015-06-30 ",
	duration:"1 Wk",
	admin:"Edward Habib",
	backup:"none"
	 
}, {
	state: "off",
	labname: "Ed's test Lab 59",
	connProfile: "My Profile Name",
	startdate: "2015-06-01 ",
	duration:"1 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "on",
	labname: "Ed's test Lab 03",
	connProfile: "My Profile Name",
	startdate: "2015-06-18 ",
	duration:"3 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "on",
	labname: "Ed's test Lab 67",
	connProfile: "My Profile Name",
	startdate: "2015-06-03 ",
	duration:"3 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "off",
	labname: "Ed's test Lab 18",
	connProfile: "My Profile Name",
	startdate: "2015-06-17 ",
	duration:"1 Wk",
	admin:"Edward Habib",
	backup:"none"
	 
}, {
	state: "on",
	labname: "Ed's test Lab 39",
	connProfile: "My Profile Name",
	startdate: "2015-06-05 ",
	duration:"2 Wk",
	admin:"Edward Habib",
	backup:"backup"
	 
}, {
	state: "on",
	labname: "Ed's test Lab 60",
	connProfile: "My Profile Name",
	startdate: "2015-06-14 ",
	duration:"9 Wk",
	admin:"Edward Habib",
	backup:"none"
	 
}, {
	state: "off",
	labname: "Ed's test Lab 11",
	connProfile: "My Profile Name",
	startdate: "2015-06-20 ",
	duration:"4 Wk",
	admin:"Edward Habib",
	backup:"none"
}]

var lablist_App = angular.module('lablist_App',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
       
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
.controller('CompReservationCtrl', function($scope, $timeout, $window, Data, Comparators) {
    
	$scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };
    
    $scope.visibleProjects = lablist_txt;
    

})

.controller('MyReservationCtrl', function($scope, $timeout, $window, Data, Comparators) {
    
	$scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };
    
    $scope.visibleProjects = lablist_txt1;
    
})
;