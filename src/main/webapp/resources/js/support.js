/* global angular:false */
'use strict';

var txt1 =  [{
          document: "onTap User Guide",

        }, {
            document: "Getting Started - Skype for Business",

        }, {
            document: "Skype for Business Lab Capabilities",

        }, {
            document: "Cisco Unified Call Manager",

        }, {
            document: "Disclaimers and other Legal Information",
        }, {
            document: "Release Notes",
        }, {
            document: "Release Notes",
        }, {
            document: "Release Notes",           
        }]

var release =  [{
    		releasedate: "06/20/15",
    		version: "0.1.0",
    		changes: " - Decoupled Cleanup cron from Portal" +
    				" - User cannot invoke VM power ON/ OFF command while back up is in progress." +
    				" - Modiefied app properties files to fix the bug where booking end date was set as  Saturday" +
    				" - Moved truststore jsk inside portal" +
    				" - Fixed the bug in monitoring the URL that is to change the password of the user ",

		}, {
    		releasedate: "06/11/15",
    		version: "0.0.10",
    		changes: " - Released Beta version",
        }, {
    		releasedate: "06/10/15",
    		version: "0.0.09",
    		changes: " - Fixed content overlapping issue while shrinking the webpage visible area" +
    				" - Fixed the log in issue (login -> browser close -> login)" +
    				" - Integration with vmware API" +
    				" - Lab cleanup cron added. Cron runs at 00.05 every midnight or every Saturday depending on the configuration." +
    				" - Pointed disclaimer to tekvizion.com’s disclaimer.",
        }, {
    		releasedate: "06/11/15",
    		version: "0.0.10",
    		changes: "- Released Beta version",
       }, {
   			releasedate: "06/11/15",
   			version: "0.0.10",
   			changes: "- Released Beta version",
        }]


var support_docApp = angular.module('support_docApp',['scrollable-table'])
.service('Data', function() {
    this.get = function() {
        return [{
          document: "onTap User Guide",

        }, {
            document: "Getting Started - Skype for Business",

        }, {
            document: "Skype for Business Lab Capabilities",

        }, {
            document: "Cisco Unified Call Manager",

        }, {
            document: "Disclaimers and other Legal Information",

        }, {
            document: "Release Notes",

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
.controller('SupportMyCtrl', function($scope, $timeout, $window, Data, Comparators) {
    $scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };


$scope.addEntry = function() {
	txt1.push({        //add the employee
	      document: "onTap User Guide",
	});
};

$scope.deleteEntry = function(){
	txt1.splice(-1, 1);
};

$scope.visibleProjects = txt1;
})





.controller('ReleaseCtrl', function($scope, $timeout, $window, Data, Comparators) {
    $scope.visibleProjects = Data.get();
    $scope.comparator = Comparators.year;
  
    $scope.changeRecord = function(){
        $scope.visibleProjects[3].code = 'aaabbbccc';
        $scope.$broadcast("renderScrollableTable");
    };

    $scope.replaceRecords = function(){
        $scope.visibleProjects = Data.get();
    };


$scope.addREntry = function() {
	var str=Math.round(Math.random() * 400)/100;
	release.push({        

		
	      document: "Release Notes "+ str,
	});
};

$scope.deleteREntry = function(){
	release.splice(-1, 1);
};

$scope.visibleProjects = release;
})
;