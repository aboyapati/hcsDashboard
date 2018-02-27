<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<style type="text/css">
	input[type=text][disabled]{
		background-color: transparent;
	}
</style>
<h3 class="myprofile_heading_text">Users &nbsp&nbsp&nbsp 
  <c:if test="${userRole=='ROLE_ADMIN' || userRole=='ROLE_CUSTOMER_ADMIN' || userRole=='ROLE_PROVIDER_ADMIN' || userRole=='ROLE_RESELLER_ADMIN'}">
	(${userCount }) 
</c:if>
<c:if test="${userRole=='ROLE_ADMIN' || userRole=='ROLE_CUSTOMER_ADMIN' || userRole=='ROLE_PROVIDER_ADMIN' || userRole=='ROLE_RESELLER_ADMIN'}">
	  <div class="addUser_icon_users" style="float:right;margin-top: 0px;" onclick="display_adduser()"></div>
</c:if>

</h3>
	
<div class="table_data_users" >	
  <scrollable-table watch="visibleProjects" style="width: 735px;">
	<div class="scrollableContainer">
	  <div class="headerSpacer">
	  </div>
	  <div class="scrollArea" ng-transclude="">
		<table id="users_table_id" class="borderless tablesorter table-striped ng-scope" fixed-header="">
		  <thead>
			<tr>
			  <th style="width:25px" class="table_th_users"><div class="th-inner" title="Del" style="width: 39px;cursor:default"">
				<div class="box">Del</div></div>
			  </th>
			 <c:if test="${userRole =='ROLE_ADMIN'}">
			  <th style="width:55px" class="table_th_users"><div class="th-inner" title="Reset" style="width: 40px;">
				  <div class="box">Reset</div>
				  </div>
				</th>
			  </c:if> 
			  <th style="width:90px" col="userName" class="table_th_users ng-scope">
				<div class="th-inner" title="User Name" style="width: 147px;"><div class="box"><div ng-mouseenter="enter()" ng-mouseleave="leave()">
				  <div class="title" ng-transclude=""><span class="ng-scope">User Name</span></div>
				  	<span class="orderWrapper">
					  <span class="order ng-hide" ng-show="focused || isActive()" ng-click="toggleSort($event)" ng-class="{active:isActive()}">
					  	<i ng-show="isAscending()" class="glyphicon glyphicon-chevron-up"></i>
					  	<i ng-show="!isAscending()" class="glyphicon glyphicon-chevron-down ng-hide"></i>
					  </span>
					</span>
				  </div></div>
				</div>
			  </th>
			  <th style="width:60px" col="email" class="table_th_users ng-scope">
				<div class="th-inner" title="Email" style="width: 186px;"><div class="box"><div ng-mouseenter="enter()" ng-mouseleave="leave()">
				  <div class="title" ng-transclude=""><span class="ng-scope">Email</span></div>
					<span class="orderWrapper">
					  <span class="order ng-hide" ng-show="focused || isActive()" ng-click="toggleSort($event)" ng-class="{active:isActive()}">
						<i ng-show="isAscending()" class="glyphicon glyphicon-chevron-up"></i>
				 		<i ng-show="!isAscending()" class="glyphicon glyphicon-chevron-down ng-hide"></i>
				  	  </span>
					</span>
				  </div></div>
				</div>
			  </th>
			  
			  <th style="width:60px" col="login" class="table_th_users ng-scope">
			    <div class="th-inner" title="Login" style="width: 62px;"><div class="box"><div ng-mouseenter="enter()" ng-mouseleave="leave()">
			      <div class="title" ng-transclude=""><span class="ng-scope">Login</span></div>
			        <span class="orderWrapper">
			          <span class="order ng-hide" ng-show="focused || isActive()" ng-click="toggleSort($event)" ng-class="{active:isActive()}">
			       		<i ng-show="isAscending()" class="glyphicon glyphicon-chevron-up"></i>
			       		<i ng-show="!isAscending()" class="glyphicon glyphicon-chevron-down ng-hide"></i>
			       	  </span>
			       	</span>
			      </div></div>
				</div>
			  </th>            
			  <th style="width:60px" class="table_th_users">
			    <div class="th-inner" title="Type" style="width: 84px;"><div class="box">Type</div>
			    </div>
			  </th>
			  <c:if test="${userRole=='ROLE_ADMIN'}">
				<th style="width:55px" class="table_th_users"><div class="th-inner" title="Company" style="width: 66px;">
				  <div class="box">Provider</div>
				  </div>
				</th>
			  </c:if>
			  <c:if test="${userRole!='ROLE_ADMIN'}">
				<th style="display: none"></th>
			  </c:if>
			  
			  
			   <!--  Ticket: 401
			Desc: Need provision to add users to reseller and should able to view the customers of the logged in reseller.
			Fix:Show up the reseller user details.
			Author: Bala */--> 
			  <th style="width:50px" col="reseller" class="table_th_users ng-scope">
				<div class="th-inner" title="Reseller" style="width: 147px;"><div class="box"><div ng-mouseenter="enter()" ng-mouseleave="leave()">
				  <div class="title" ng-transclude=""><span class="ng-scope">Reseller</span></div>
				  	<span class="orderWrapper">
					  <span class="order ng-hide" ng-show="focused || isActive()" ng-click="toggleSort($event)" ng-class="{active:isActive()}">
					  	<i ng-show="isAscending()" class="glyphicon glyphicon-chevron-up"></i>
					  	<i ng-show="!isAscending()" class="glyphicon glyphicon-chevron-down ng-hide"></i>
					  </span>
					</span>
				  </div></div>
				</div>
			  </th>
			  
			  <th style="width:50px" col="customer" class="table_th_users ng-scope">
				<div class="th-inner" title="Customer" style="width: 147px;"><div class="box"><div ng-mouseenter="enter()" ng-mouseleave="leave()">
				  <div class="title" ng-transclude=""><span class="ng-scope">Customer</span></div>
				  	<span class="orderWrapper">
					  <span class="order ng-hide" ng-show="focused || isActive()" ng-click="toggleSort($event)" ng-class="{active:isActive()}">
					  	<i ng-show="isAscending()" class="glyphicon glyphicon-chevron-up"></i>
					  	<i ng-show="!isAscending()" class="glyphicon glyphicon-chevron-down ng-hide"></i>
					  </span>
					</span>
				  </div></div>
				</div>
			  </th>
			
			  <th style="width:55px;padding-left:15px !important;" class="table_th_users">
			  	<div class="th-inner" title="Edit" style="width: 92px;cursor:default">
			  	  <div class="box">Edit</div>
			  	</div>
			  </th>
			</tr>
		  </thead>
		  <tbody>
		  <c:choose>
			  <c:when test="${userRole!='ROLE_ADMIN' && userRole!='ROLE_CUSTOMER_ADMIN'}">
				<div style="text-align:center;padding-top:50px;font-family:'Source Sans Pro';font-weight:400;font-size:18px;color:crimson;">
				  User doesn't have access to view details
				</div>
			  </c:when>
			  <c:otherwise>
				<c:forEach var="user" items="${userList}">
				  <tr>
					<td id="del_user" style="min-width:35px;max-width: 35px;cursor:pointer;" class="table_body_tr_users">
					<!--   Ticket: 392
					Desc: delete link is shown for current login user.
					Fix: Here based on the loggedInUser shows the delete icon.
					Author: Bala -->
					<c:if test="${loggedInUser.id != user.id}">
					  <div class="table_del_icon_users"></div>
					  </c:if>					  
					</td>	
					<c:if test="${userRole =='ROLE_ADMIN'}">				 
					 <td id="reset_user" style="min-width: 40px; max-width: 40px; cursor: pointer;" class="table_body_tr_users">
					 <c:if test="${loggedInUser.id != user.id}">					 
					  	<div>
					  	<a  title="Reset" style="cursor: pointer;" class="Reset_Password"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span></a>
					  	</div>
					  </c:if> 
					  </td>
					 </c:if>					
					<td id="username" style="min-width:95px;max-width: 95px" class="table_body_tr_users">
					  <span style="white-space: nowrap;">${user.name}</span>
					</td>
					<td id="useremail" style="min-width:120px;max-width: 120px" class="cr table_body_tr_users">
					  <span style="white-space: nowrap;">${user.email}</span>
					</td>
					<td id="userloginid" style="min-width:60px;max-width: 60px" class="table_body_tr_users">
					  <span style="white-space: nowrap;">${user.loginId}</span>
					</td>            
					<td id="usertype_name" style="min-width:55px;max-width: 55px" class="table_body_tr_users">
					  <span style="white-space: nowrap;">${user.usertype.name}</span>
					</td>
					<td id="user_id" style="display:none">${user.id}</td>
					<!-- <td style="min-width:30px;max-width: 30px" class="table_body_tr_users"><div class="table_lock_icon_users"></div></td> -->
					
					<c:if test="${userRole=='ROLE_ADMIN'}">
					  <td style="min-width:30px;max-width: 30px;padding-left: 7px" class="table_body_tr_users"><span style="white-space: nowrap;">${user.provider.name}</span></td>
					</c:if>
					<c:if test="${userRole!='ROLE_ADMIN'}">
					  <td style="display: none"></td>
					</c:if>
					
					<td id="user_reseller" style="min-width:30px;max-width: 30px" class="table_body_tr_users">
					  <span style="white-space: nowrap;">${user.reseller.name}</span>
					</td>  
					<td id="user_customer" style="min-width:30px;max-width: 30px" class="table_body_tr_users">
					  <span style="white-space: nowrap;">${user.customer.name}</span>
					</td> 
					<td id="edituser_button" style="min-width:50px;max-width: 50px" class="table_body_tr_users">
					  <p class="table_edit_icon_users" style="margin-right:5px;float: right;"></p>
					</td>
					
				  </tr>
				</c:forEach>
			  </c:otherwise>
			</c:choose>
		  </tbody>
		</table>
	  </div>
	</div>
  </scrollable-table>
  <br/><br/>
</div>
		
<script>
	$("#users_table_id").tablesorter({ 
		sortList: ("${userList}" == '[]' || ("${userRole}"!='ROLE_ADMIN' && "${userRole}"!='ROLE_CUSTOMER_ADMIN' && "${userRole}"!='ROLE_INTERNAL_MANAGER') ? []: [[1,0]] ),
		headers:{0:{sorter:false},5:{sorter:false},6:{sorter:false},8:{sorter:false},9:{sorter:false}}
	});
	
	var table = document.getElementById('users_table_id');
	var cells = table.getElementsByTagName('td');

	for (var i = 0; i < cells.length; i++) {
	    // Take each cell
	    var cell = cells[i];
	    // do something on onclick event for cell
	    cell.onclick = function () {
	        // Get the row id where the cell exists
	        var rowId = this.parentNode.rowIndex;
	        var rowsNotSelected = table.getElementsByTagName('tr');
	            for (var row = 0; row < rowsNotSelected.length; row++) {
	                rowsNotSelected[row].style.outline = "0px";
	            }
	        var rowSelected = table.getElementsByTagName('tr')[rowId];
	        rowSelected.style.outline = "2px solid lightskyblue";
	    }
	}

	$('.table_edit_icon_users').click(function () {
		var tr = $(this).closest('tr');
		var userid="";
		if(${userRole =='ROLE_ADMIN'}){
			userid = tr.find('td').eq(6).text();
		}else{
			userid = tr.find('td').eq(5).text();
		}
		
		var data = 'userid='
			+ encodeURIComponent(userid);

		display_edituser(data);
	 });

	$('.table_del_icon_users').click(function () {

		var tr = $(this).closest('tr');
		var userid ="";
		if(${userRole =='ROLE_ADMIN'}){
		userid = tr.find('td').eq(6).text();
		}else{
			userid = tr.find('td').eq(5).text();	
		}
		var $row = $(this).parent().parent();
		var data = 'id='
			+ encodeURIComponent(userid);

		bootbox.confirm({
		    buttons: {
		    	confirm: {
		    		label: 'YES',
            	},
		        cancel: {
		            label: 'NO',
		        }
		    },
		    message: 'Are you sure want to delete this user?',
		    callback: function(result) {
		    	if(result) {	
					$.ajax({
						url : "deleteUser",
						data : data,
						type : "POST",
				
						success : function(deleteuser_response) {
							if(deleteuser_response=="Success"){ 
								$row.remove();
								bootbox.alert("User deleted successfully").find("div.modal-content").addClass("modalsuccess");
								display_users();
							}
							else{
								bootbox.alert(deleteuser_response).find("div.modal-content").addClass("modalfailure");
							}
						},
						error : function(xhr, status, error) {
							bootbox.alert("Session Expired..Please Login again..",function(){window.location = "login";
							}).find("div.modal-content").addClass("modalfailure");
						}
					});
			    }
		    },
		    //title: "You can also add a title",
		}).find("div.modal-content").addClass("modalalert");
	});
	
	$(".Reset_Password").click(function(){
	
		var tr = $(this).closest('tr');
		var userid = tr.find('td').eq(6).text();
		var $row = $(this).parent().parent();
		var data = 'id='
			+ encodeURIComponent(userid);
		
		bootbox.confirm({
		    buttons: {
		    	confirm: {
		    		label: 'YES',
            	},
		        cancel: {
		            label: 'NO',
		        }
		    },
		    message: 'Password will be reset. Are you sure?',
		    callback: function(result) {
		    	if(result) {	
					$.ajax({
						url : "resetUser",
						data : data,
						type : "POST",
				
						success : function(resetUser) {
							if(resetUser=="success"){ 
								bootbox.alert("Password reset is successful").find("div.modal-content").addClass("modalsuccess");
								display_users();
							}
							else{
								bootbox.alert(resetUser).find("div.modal-content").addClass("modalfailure");
							}
						},
						error : function(xhr, status, error) {
							bootbox.alert("Session Expired..Please Login again..",function(){window.location = "login";
							}).find("div.modal-content").addClass("modalfailure");
						}
					});
			    }
		    },
		    //title: "You can also add a title",
		}).find("div.modal-content").addClass("modalalert"); 
	})
</script>