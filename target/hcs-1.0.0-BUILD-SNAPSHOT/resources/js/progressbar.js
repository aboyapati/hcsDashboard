/**
 * 
 */

$(document).ready(function(){
 var timer=0;
 var percentageWidth = $('#progressBar').outerWidth()/100;
  function timerRun(){
    $('#progressBar .progress-bar').css("width", timer + "%").attr("aria-valuenow", timer);
    
    if(timer >= 100){  
      $('#progressBar .progress-bar').css("width","100%");
      return;
    }
    timer++;
    setTimeout(function(){timerRun()},200);
  }
  
  $('.backup_lab .confirm_button').click(function(e){
	  var nMonths = "";
	  if(flag==false){
		  nMonths = noOfMonths;		 
	  }
	  
	  //validation
		if( $("#backup_name").val()==""){
		bootbox.alert("Name cannot be empty").find("div.modal-content").addClass("modalfailure")
		.parent().parent().addClass("bootbox_default");		 
		}  else if($("textarea[name='backup_desc']").val()==""){
		bootbox.alert("Description cannot be empty").find("div.modal-content").addClass("modalfailure")
		.parent().parent().addClass("bootbox_default");		 
		} else {
	 /*
	  	Ticket : 35897
	   	Desc : Backup Confirm alert about time taken for backup
	   	Fix : When click confirm to backup an alert box is displayed to prompt user about backup time taken
	   	Author : Amulya Boyapati
	*/
	  bootbox.confirm({
		  buttons: {
			  confirm: {
				  label: 'YES',
			  },
			  cancel: {
				  label: 'NO',
			  }
		  },
		  message: 'Backup might even take several hours and lab cannot be accessed at this time. Are you sure want to Backup?',
		  callback: function(result) {
			  if(result) {
					 
				  $('#backup_now').modal('hide');
				//call the function to start the backup process. This will now be an Ajax call.
 
				$.ajax({
					url: "vmcmds/backuplab/get",
					type:'POST',
					dataType: "json",
					data: {
						bkupName:$("#backup_name").val(),
						resId:$("#res_id").val(),
						bkupDesc:$("textarea[name='backup_desc']").val() ,
						noOfMonths: nMonths, 
					},
					error: function(jqXHR, textStatus, error) {
						bootbox.alert("Could not initiate backup process. Please contact onTAP admin."+error).find("div.modal-content").addClass("modalfailure")
						 .parent().parent().addClass("bootbox_default");
					},
					success: function(response){ 
						//verify the response
						if(response['status']=='SUCCESS'){
							bootbox.alert(response['message']).find("div.modal-content").addClass("modalsuccess");
							getStatus();
						} else {
							bootbox.alert(response['message']).find("div.modal-content").addClass("modalfailure")
							 .parent().parent().addClass("bootbox_default");
						}
					}
				});
				}
				e.preventDefault();
				//  timerRun();
		  },
	  }).find("div.modal-content").addClass("modalalert");
	}
  });
}); 