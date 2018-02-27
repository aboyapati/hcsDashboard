/* global angular:false */
'use strict';

var userstxt = [{
    del: "Y",
    userName: "Joe Power",
    contact: "(Contact info here)",
    email: "username@domain.com",
    login: "jeep",
    type: "Power User",
    lock: "lock"
  }, {
  	del: "y",
      userName: "Joe Viewer",
      contact: "(Contact info here)",
      email: "username@domain.com",
      login: "joe",
      type: "Viewer",
      lock: "lock"
  }, {
  	del: "Y",
      userName: "Jim Smith",
      contact: "(Contact info here)",
      email: "username@domain.com",
      login: "testlogin",
      type: "Viewer",
      lock: "lock"
  }, {
  	del: "Y",
      userName: "Jim Smith",
      contact: "(Contact info here)",
      email: "username@domain.com",
      login: "testlogin",
      type: "Viewer",
      lock: "lock"
  }, {
  	del: "Y",
      userName: "Jim Smithsonian",
      contact: "(Contact info here)",
      email: "username@domain.com",
      login: "testlogin",
      type: "Viewer",
      lock: "lock"
  }, {        	
  	del: "Y",
      userName: "Edward Habib",
      contact: "(Contact info here)",
      email: "username@domain.com",
      login: "ehabib",
      type: "Power User",
      lock: "unlock"       
  }]

var usersApp = angular.module('usersApp',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
        return [{
          del: "X",
          userName: "Joe Power",
          contact: "(Contact info here)",
          email: "username@domain.com",
          login: "jeep",
          type: "Power User",
          lock: "lock"
        }, {
        	del: "X",
            userName: "Joe Viewer",
            contact: "(Contact info here)",
            email: "username@domain.com",
            login: "joe",
            type: "Viewer",
            lock: "lock"
        }, {
        	del: "X",
            userName: "Jim Smith",
            contact: "(Contact info here)",
            email: "username@domain.com",
            login: "testlogin",
            type: "Viewer",
            lock: "lock"
        }, {
        	del: "X",
            userName: "Jim Smith",
            contact: "(Contact info here)",
            email: "username@domain.com",
            login: "testlogin",
            type: "Viewer",
            lock: "lock"
        }, {
        	del: "X",
            userName: "Jim Smith",
            contact: "(Contact info here)",
            email: "username@domain.com",
            login: "testlogin",
            type: "Viewer",
            lock: "lock"
        }, {        	
        	del: "X",
            userName: "Edward Habib",
            contact: "(Contact info here)",
            email: "username@domain.com",
            login: "ehabib",
            type: "Power User",
            lock: "unlock"       
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
.controller('UsersMyCtrl', function($scope, $timeout, $window, Data, Comparators) {
    //$scope.visibleProjects = Data.get();
	userstxt.push({        //add the employee
	    del:"Y",
	    userName:"Rut",
	    contact:"10:00 am",
	    email:"rut@bah.com",
	    login:"800-888-8888",
	    type:"images/mike.jpg",
	    lock: "unlock"
	});	
	
	$scope.addEntry = function() {
    	userstxt.push({        //add the employee
    	    del:"Y",
    	    userName:"Ruta",
    	    contact:"10:00 ama",
    	    email:"rut@bah.coma",
    	    login:"800-888-8888a",
    	    type:"images/mike.jpga",
    	    lock: "unlock"
    	});
    };
    
    $scope.deleteEntry = function(){
    	userstxt.splice(-1, 1);
    };
    
	$scope.visibleProjects = userstxt;
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        //$scope.visibleProjects = Data.get();
    	$scope.visibleProjects = userstxt;
    };
    
})
;

usersApp.controller('ButtonController', ['$scope', function($scope) {
    $scope.spice = 'very';

    $scope.addEntry = function() {
    	userstxt.push({        //add the employee
    	    del:"Y",
    	    userName:"Ruta",
    	    contact:"10:00 ama",
    	    email:"rut@bah.coma",
    	    login:"800-888-8888a",
    	    type:"images/mike.jpga",
    	    lock: "unlock"
    	});
    };

    $scope.jalapenoSpicy = function() {
        $scope.spice = 'jalapeño';
    };
}]);