	
			
	var startDate="";
	var endDate="";
	//var hasCredit;
	var userRole = "${userRole}";
	
	/**------------Global Functions for Making Reservation---------------**/
	var dtPckr = $('.datepicker')
	
	$("*").scroll(function() {
	      dtPckr.datepicker('hide');
	    });
	$(window).resize(function() {
	  dtPckr.datepicker('hide');
	});

	$(function() {
	$(".ui-datepicker-today").css("background","red");
	$(".ui-state-disabled").css("opacity","1");
	$(".ui-datepicker-today").addClass('event');
	});


	// Call this function to Disable ALL DatePickers
	function disableDatepicker(){
		$(".datepicker").datepicker({
            minDate:1,
            dateFormat: 'mm/dd/yy',
            showOn: "button",
            buttonImage: "resources/images/reservelab_product/calendar_icon.png",
            buttonImageOnly: true,
            buttonText: "",
            disabled:true,
        });
	}
	

	function getToday(){
		 var d = new Date();
		  var month = d.getMonth()+1;
		  var day = d.getDate();

		  var output =((''+month).length<2 ? '0' : '') + month   + '/' +
		      ((''+day).length<2 ? '0' : '') + day + '/' +
		      d.getFullYear();	
	      return output;
	};

	function addToday(input){
	   setTimeout(function() {
	           $(".ui-datepicker-buttonpane")
	              .html('')
	           .append("Today : " + getToday());
	        }, 1)
	};

	//return the date before next disabled date with in maxDays
	function getMaxEndDate(startDate, disableDates,maxDays){
		var date =  $.datepicker.parseDate("mm/dd/yy", startDate);
		for(var i = 0; i < maxDays; i++){
			ymd = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2); 
			if(disableDates.indexOf(ymd)!= -1){
				date.setDate(date.getDate()-1);
				return date;
			}
			date.setDate(date.getDate()+1);
		}
		date.setDate(date.getDate()-1);
		return date;
	    };


	 // Display Summary according to reserve form on Rightpanel 
	 function displaySummary(modalId){ 

	 	$(modalId +' #productDisplay').text($(modalId +' #form_product').val());
	 	$(modalId +' #equipmentDisplay').text($(modalId +' #form_equipment option:selected').text());
	 	
	 	if(startDate!=''){
	 		$(modalId +' #durationDisplay').text(startDate+' - '+endDate);
	 	}else{
	 		$(modalId +' #durationDisplay').text('');
	 	}
	  	
	 	$(modalId +' #labNameDisplay').text($(modalId +' #form_labName').val());
	  	$(modalId +' #userNameDisplay').text($(modalId +' #form_user option:selected').text());

	 	if($(modalId +' #form_connection option:selected').val()==''){
	 		$(modalId +' #connectionDisplay').text('');
	 	} else {
	 		$(modalId +' #connectionDisplay').text($(modalId +' #form_connection option:selected').text());
	 	}
	  		
	 	$(modalId +' #emailDisplay').text($(modalId +' #form_emailRecipients').val());    
	 	 
	 	$(modalId +' #packagesDisplay').empty();    
	 	$.each($(modalId +' select#form_packages option:selected'),function(){
	 		$(modalId +' #packagesDisplay').append('<li>'+$(this).text()+'</li>');
	 	})
	 	 
	 }

	 function setupNameByType(modalId,isInternal){
	 	var oldvalue=$(modalId+" #form_labName").val();
	 	var labnamePrefix="";
	 	if(isInternal){
	 		labnamePrefix=$(modalId+' #form_equipment option:selected').text()+': ';
	 	}
	 	$(modalId+" #form_labName").val(labnamePrefix+oldvalue.substring(oldvalue.indexOf(": ")+1).trim());

	 	$(modalId+" #labNameDisplay").text($(modalId+" #form_labName").val());		
	 	
	 	$(modalId+" #form_labName").unbind();
	 	$(modalId+" #form_labName").on('keydown keyup paste drag drop focusout',function(e) {

	 		if(e.which == 186) {
	 			return false;
	 		}
	 	//	if(isInternal){
	 		   oldvalue=$(this).val();
	 		    var field=this;
	 		    setTimeout(function () {
	 		        if(field.value.indexOf(labnamePrefix) !== 0) {
	 		            $(field).val(oldvalue);
	 		        } 
	 		    }, 1);
	 		   
	 	//	}
	 	});
	 	
	 	$(modalId+" #labNameDisplay").on('focusin',function(){});	
	 	$(modalId+" #form_labName").on('focusout',function(){
	 		$(modalId+" #labNameDisplay").text($(modalId+" #form_labName").val());		
	 	});
	 	
	 }
	    
//Always show reservelabintro page when click Reserve a Lab button
	
    function back_intro() {
	    $("#popup_product").html("");
	    $("#popup_catalog").html("");
	    $("#popup_backupimg").html("");
	    
		var pop = document.querySelectorAll(".popup");
	    for (var i = 0; i < pop.length; i++) {
	    	pop[i].style.display = "none";
	    }

	};
	
	//Popup alert if feature not implemented
	function featureComingSoon(){
		bootbox.alert("This Feature Coming Soon ...").find("div.modal-content").addClass("modalalert");
	};
	
	
	
	
/*-----Methods shared by ReserveLab/Product and ReserveLab/Catalog-----*/
	
	//setup reserve form userlist based on company. Used when user is Admin
	function addUserList(modalId){
		if(userRole=="ROLE_ADMIN"){	
			$(modalId+' #form_user').empty();
	    	$.ajax({
	            url: "reserveLab/company/userList",
	            type:'POST',
	            dataType: 'json',
	            data: {
	            	company: $(modalId+' #form_company').val()
	            },
	            success: function(result){
	        		
	            	if(result.length<=0){ 
	            		$(modalId+' #userNameDisplay').text('');
	            		bootbox.alert("Could not find the users list in given company").find("div.modal-content").addClass("modalfailure");
		            }else{
	            	 for (var i = 0; i < result.length; i++) {
	            		 $(modalId+' #form_user').append($('<option>', {
	            			   value: result[i]['id'],
	            			   text: result[i]['name']
	            		}));
	                 }
	            	 $(modalId+' #userNameDisplay').text($(modalId+' #form_user option:selected').text());	
		            }            	
	            },
				error: function(jqXHR){
		            ajaxErrorHandler(jqXHR);
		    	},

	    	});
    	
		}
	    else{
			$(modalId+' #userNameDisplay').text($(modalId+' #form_user option:selected').text());	 
	    }
    }
   
    				
 	// Call this function to Display Credit at right panel
    function DisplayCredit(modalId){
	    
	    if("${addFundsEnabled}"=="false"){
		    return;
		}
	    var equipId= $(modalId+' #form_equipment option:selected').val();
	   
	    $.ajax({						
            url: "getCreditInfo",
            type:'GET',
            dataType: 'json',
            traditional: true,
            data: {
            	companyId: $(modalId+' #form_company option:selected').val(),
            	bEquipmentId:equipId,
				packages:$(modalId+' select#form_packages').val(),
				start: startDate, 
				end:endDate
            },
            error: function(jqXHR){
	            ajaxErrorHandler(jqXHR);
	    	},
            success: function(creditData){
            	if(jQuery.isEmptyObject(creditData)){
               		$(modalId+' #creditDisplay').text('');
               		$(modalId +' #estCostDisplay').css('display','none');
            	}else{
	             
            	$(modalId+' #creditDisplay').text("$ "+creditData.credit.toFixed(2));
            	if(creditData.equipCost==0){
            		bootbox.alert("Could not find cost information of the lab. Please contact tekVizion help desk for support.").find("div.modal-content").addClass("modalfailure");
            	}
            	$(modalId +' #estCostDisplay').css('display','inline');
            	
            	$(modalId +' #estCostDisplay').text(" $ "+creditData.estCost.toFixed(2));

             	if(creditData.isSufficient<0){
            		$( modalId +' #buy_cred').css('display','block');
            		$( modalId +' #insuff').css('display','block');

            		$(modalId+' .buy_credits').unbind('click');
            		$(modalId+' .buy_credits').on('click',function(){
            			$('.modal.in .exit_button').trigger('click');	
            			setTimeout(function(){$(".menu_icon_add_credit").parent().trigger('click');}, 500);		
            		});	
            	} else{ 
                	$(modalId +' #buy_cred').css('display','none');
            		$(modalId +' #insuff').css('display','none');
            	}
            	}
            },
     	});
          	
	};
	
	//reserve button on click function
	function reserveOnSubmit(modalId){

		var reserveForm = {
				'product': $(modalId +' #form_productId').val(), 
				'basicEquipment':$(modalId +' #form_equipment option:selected').val(),
				'packages':$(modalId +' select#form_packages').val(),
				'customLabName':$(modalId +' #form_labName').val(),
				'user': $(modalId +' #form_user').val(), 
				'reservationDate': startDate, 
				'endDate':endDate, 
				'company':$(modalId +' #form_company option:selected').val(), 
				'connection':$(modalId +' #form_connection option:selected').val(), 
				'emailRecipients':$(modalId +' #form_emailRecipients').val(),
				};
			
		$.ajax({
			url: "validateReservation",
			type:'POST',
			dataType: "json",
			data: JSON.stringify(reserveForm),
			contentType: 'application/json; charset=utf-8',
			
			error: function(jqXHR){
		        ajaxErrorHandler(jqXHR);
		    },
			
			success: function(validationResult){ 
				
				if(validationResult.status){
					bootbox.confirm({
						message:"Are you sure to make a reservation?",
						buttons:{
							confirm:{
								lable:"Yes",
								className:"btn-primary",							
								},					
							cancel:{
								lable:"Cancel",
								className:"btn-default",
								}					
							},	
							
						callback: function(confirm){
							
							if(confirm){
								
								$.ajax({
									url: "confirmReservation",
									type:'POST',
									dataType: "json",
									data: JSON.stringify(validationResult.form),
									contentType: 'application/json; charset=utf-8',
									
									error: function(jqXHR){
							            ajaxErrorHandler(jqXHR);
							    	},
									
									success: function(reserveResult){ 							
										if(reserveResult.status){
											bootbox.alert(reserveResult.Msg,function(){
												$("body").addClass("wait");
												window.location = "dashboard";
											})
											.find("div.modal-content").addClass("modalsuccess");
										}else{						
											bootbox.alert(reserveResult.errorMsg).find("div.modal-content").addClass("modalfailure");
										}
										
									 },
								});  //End of Ajax - confirmReservation
							 }
						},		 
					}).find("div.modal-content").addClass("modalalert");
				}else{
					bootbox.alert(validationResult.errorMsg).find("div.modal-content").addClass("modalfailure");
				}
			},
		});  //End of Ajax - validateReservation
	//	}
	};
	//});	 //End of reserve button click function
	

	
	
	/**********Scripts for Reserve By Vendor*************/
	
	function ShowList(){
		document.getElementById("list_button").className = "list_button_selected";
		document.getElementById("gallery_button").className = "gallery_button";
		
		document.getElementById("gallery_view").style.display = "none";
		document.getElementById("list_view").style.display = "block";		
	};

	function ShowGallery(){

		document.getElementById("list_button").className = "list_button";
		document.getElementById("gallery_button").className = "gallery_button_selected";
		
		document.getElementById("gallery_view").style.display = "block";
		document.getElementById("list_view").style.display = "none";
	};

   	$(document).on('click','.list_view li,.gallery_view li',function(){
	    	
		$('.list_view li').removeClass('selected');
	    $('.gallery_view li').removeClass('selected');
	    var prodId= $(this).attr('id'); 
	    var prodName=$(this).attr('value'); 

	    $('#popup_product #summary_content').css("display","block");	
	  	$('#popup_product #reserve_submit').css("display","block");

	    onSelectVendor(prodId,prodName);	           
	});
	    
	/* setup reserve form after select a vendor
	1. Vendor ID / Name as param
	2. Empty Equipment dropdown
	3. If prodId ='', Empty form / credit. Return
	   If prodId!=''
		1) Left Panel - set selected style for prodId
		2) Ajax call to get Basic Equipment
		3) Call onChangeBequip()
	*/
	function onSelectVendor(prodId,prodName){

		$('#popup_product #form_product').attr({
		   	'value': $.trim(prodName),
		});
		$('#popup_product #form_productId').attr({
			'value': $.trim(prodId),
		});
	    
	    $('#popup_product #form_equipment').empty();
		
		if(prodId!='') { 
			$("body").addClass("wait");
			$('#list_view #'+prodId).addClass('selected');
	   		$('#gallery_view #'+prodId).addClass('selected');
 
			$("#popup_product #productDisplay").text(prodName);		    
	    
	    	$.ajax({						
	            url: "getBEquipDropdown",
	            type:'GET',
	            dataType: 'json',
	            data: {
	            	prodId: prodId,
	            },
	            
	            error:  function(jqXHR){
	            	$("body").removeClass("wait");	
		            ajaxErrorHandler(jqXHR);
		        },
	            success: function(result){ 

	            	$('#popup_product #form_equipment').empty();
            	 
	            	$.each(result, function (key,value) {

	            		$('#popup_product #form_equipment').append($('<option/>', { 
            	       		value: key,
            	       		text : value
            	    	}))     	    	  
	            		
					});	

	            	$('#popup_product #form_equipment').removeAttr('disabled');  
	            	onChangeBequip();

	        		$("body").removeClass("wait");	
	            },
	    	}); 
	    
		}else{  							
			$('#popup_product #form_equipment').attr({'disabled': 'disabled'});
			disableDatepicker();
			DisplayCredit("#popup_product");
		};   

	};  // End of onSelectVendor()


	
	/* Function called after change of basic equipment. For selectVendor, basicEquipment dropdown onChange, packages dropdown onDropdownHide
	1.Get information with Ajax Call getReserveForm
	2.Setup reserve form with returned information 
	3.clear & setup new datepicker
	4.display right panel
	5.displayCredit
	
	*/			
	function onChangeBequip(){

		$("body").addClass("wait");
		
    	$.ajax({						
            url: "getReserveForm",
            type:'GET',
            dataType: 'json',
            traditional: true,
            data: {
            	productId: $('#popup_product #form_productId').val(),
	        	bEquipmentId: $('#popup_product #form_equipment').val(),
	       		packages:$('#popup_product select#form_packages').val()
            },
            
            error:  function(jqXHR){
            	$("body").removeClass("wait");	
	            ajaxErrorHandler(jqXHR);
	        },
            success: function(response){
           
        		//setup connection profile availability and labname prefix
        		if(response.isInternal){
        			$("#popup_product #form_connection option").prop('selected',false);
    				$("#popup_product #form_connection").attr('disabled','disabled');
    				setupNameByType("#popup_product",true);
        		}else{
        			$("#popup_product #form_connection").removeAttr('disabled','disabled');
    				setupNameByType("#popup_product",false);   			
        		}
        		
        		
        		//destroy datepickers
				$("#popup_product .datepicker").datepicker("destroy");
				$("#popup_product .datepicker").val('');
				startDate='';
				endDate='';
        		
            	if(response.status){
            		if(response.isHW){
            			var minStartDate = 0;
            		}else{
            			var minStartDate = 1;
            		}

                	setupDatepicker(minStartDate,response.maxPermittedDays,response.unavailableDates);	
            		
				}else{						
					bootbox.alert(response.errorMsg).find("div.modal-content").addClass("modalfailure");	
					disableDatepicker();
				}
            	
            	DisplayCredit("#popup_product");
            	displaySummary("#popup_product");

        		$("body").removeClass("wait");	
            },
    	}); 

	} 


	
	// Call this function to Setup DatePicker
	function setupDatepicker(minStartDate,maxPermittedDate,disDates) {

        var minEndDate;
        var endDateStop = false;
        if($("#popup_product #start_Date").val()==""){
        	minEndDate = minStartDate;
        }else{
        	minEndDate = new Date($("#popup_product #start_Date").val());
        }
        var disableDates = [""];
        var disableDays = [""];
	
        	disableDates = disDates;
			var Alldays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
				
			function ShowDisableDates(date) {				
		    	ymd = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2);
		    	day = new Date(ymd).getDay();
		    	if ($.inArray(ymd, disableDates) < 0 && $.inArray(Alldays[day], disableDays) < 0) {
		    	return true;
		    	} else {
		    	return false;
		    	}
			};
			
		$("#popup_product #start_Date").datepicker({
        	minDate: minStartDate,
        //	maxDate: maximumDate,
		    dateFormat: 'mm/dd/yy',        
	       	showOn: "button",
	   		buttonImage: "resources/images/reservelab_product/calendar_icon.png",
      		buttonImageOnly: true,
      		buttonText: "",
      	    showOtherMonths: false,  
      	    disabled:true,  	    

      	    //show today's date at bottom
            showButtonPanel: true,
            beforeShow: function (input){
		    	addToday(input);			  
		    },    
		    onChangeMonthYear:function( year, month, inst ) {  
		    	addToday(inst.input);
		    }, 

      		beforeShowDay: function(date){
   	        	var string = jQuery.datepicker.formatDate('mm/dd/yy', date);

   				ymd = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2); 

   	   		    if(getToday()===string){
   					return [disableDates.indexOf(ymd) == -1,"highlight-today"];
  				}

   	   		    return [ disableDates.indexOf(ymd) == -1 ]
   					//ShowDisableDates(date);  
   			      
   			},	
      		onSelect: function( selectedDate ) {
      			if(selectedDate){
				$( "#popup_product #end_Date" ).datepicker( "option", "minDate", selectedDate );
		    	$("#popup_product #end_Date").val('');
				endDate="";
				startDate=$('#popup_product #start_Date').val();			
				$( "#popup_product #end_Date" ).datepicker( "option", "maxDate", getMaxEndDate(startDate, disableDates,maxPermittedDate));
		        $( "#popup_product #end_Date" ).datepicker( "enable");
		        endDateStop=false;
				$("#popup_product #durationDisplay").text(startDate+' - '+endDate);	 
				DisplayCredit("#popup_product");
			//	checkCredit("#popup_product",'');
      			}
      		}
		});

		$("#popup_product #end_Date").datepicker({	          
	    	minDate: minEndDate,
	   //     maxDate: maximumDate,
		    dateFormat: 'mm/dd/yy',
	       	showOn: "button",
	   		buttonImage: "resources/images/reservelab_product/calendar_icon.png",
      		buttonImageOnly: true,
      		buttonText: "",
      	    showOtherMonths: false,
      	    disabled:true,
      	    //show today's date at bottom
            showButtonPanel: true,
            beforeShow: function (input){
		    	addToday(input);			  
		    },    
		    onChangeMonthYear:function( year, month, inst ) { 
		    	addToday(inst.input);
		    }, 

      		beforeShowDay: function(date){
   	        	var string = jQuery.datepicker.formatDate('mm/dd/yy', date);
   		      	if(getToday()===string){
   					return [true,"highlight-today"];
   				} else {
   					ymd = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2); 
   				
   					return [ disableDates.indexOf(ymd) == -1 ]
   					//ShowDisableDates(date);  
   			   	}
   			},	
            onClose: function( selectedDate ) {
            	if(selectedDate){
            	endDate=$('#popup_product #end_Date').val();    
            	$("#popup_product #durationDisplay").text(startDate+' - '+endDate);	
            	DisplayCredit("#popup_product");
            //	checkCredit("#popup_product",'');
            	}
            }
   		
  		});    			
		$( "#popup_product #start_Date" ).datepicker('enable');
	};

	
	
	/**********Scripts for Reserve By Catalog*************/
	
	
	// setup reserve form when select a catalog	
	function onselectCatalog(bEquipmentId){
		$("body").addClass("wait");
		$("#popup_catalog1").css('display', "none");
		$("#popup_catalog2").css('display', "block");
		$('#popup_catalog2 #reserve_submit').css("display","block");

       	addUserList("#popup_catalog2");   	
       	addConnection("#popup_catalog2");
       	$('#popup_catalog2 select#form_packages').multiselect('deselectAll', false);
    	$('#popup_catalog2 select#form_packages').multiselect('refresh');
    	$.ajax({						
            url: "getBEquipment",
            type:'GET',
            dataType: 'json',
            data: {
            	bEquipmentId: bEquipmentId,
            },
            error: function(jqXHR){
            	$("body").removeClass("wait");
                ajaxErrorHandler(jqXHR);
        	},
            success: function(result){ 
	            
	            if(result == null){
	            	$("body").removeClass("wait");
	        		bootbox.alert("Seleted Basic Equipment is not available. The page will be reloaded.",function(){location.reload();
	        		}).find("div.modal-content").addClass("modalfailure");
		            return;
		        }
		        
    		    $('#popup_catalog2 #form_product').attr({
    		      	'disabled': 'disabled',
    		      	'value': $.trim(result.prodName),
    		    });
    		    $('#popup_catalog2 #form_productId').attr({
    		    	'disabled': 'disabled',
    		    	'value': $.trim(result.prodId),
    		    });
    		    
            	$('#popup_catalog2 #form_equipment')
            	.empty()
            	.append($('<option/>', { 
            		value: result.bEquipId,
            		text : result.bEquipName, 
            	}))
            	.attr({'disabled': 'disabled', 'title':result.bEquipName,});  

            	onChangeEquipCatalog();

            	$("body").removeClass("wait");
            },
		});	  

	};   //End of select catalog function

	function onChangeEquipCatalog(){
  	$.ajax({						
        url: "getReserveForm",
        type:'GET',
        dataType: 'json',
        traditional: true,
        data: {
        	productId: $('#popup_catalog2 #form_productId').val(),
        	bEquipmentId: $('#popup_catalog2 #form_equipment').val(),
       		packages:$('#popup_catalog2 select#form_packages').val()
        },
        
        error:  function(jqXHR){
        	$("body").removeClass("wait");	
            ajaxErrorHandler(jqXHR);
        },
        success: function(response){
       
    		//setup connection profile availability and labname prefix
    		if(response.isInternal){
    			$("#popup_catalog2 #form_connection option").prop('selected',false);
				$("#popup_catalog2 #form_connection").attr('disabled','disabled');
				setupNameByType("#popup_catalog2",true);
    		}else{
    			$("#popup_catalog2 #form_connection").removeAttr('disabled','disabled');
				setupNameByType("#popup_catalog2",false);   			
    		}
    		
    		
    		//destroy datepickers
			$("#popup_catalog2 .datepicker").datepicker("destroy");
			$("#popup_catalog2 .datepicker").val('');
			startDate='';
			endDate='';
    		
        	if(response.status){
        		if(response.isHW){
        			var minStartDate = 0;
        		}else{
        			var minStartDate = 1;
        		}

        		setupDatepickerCatalog(minStartDate,response.maxPermittedDays,response.unavailableDates);	
        		
			}else{						
				bootbox.alert(response.errorMsg).find("div.modal-content").addClass("modalfailure");	
				disableDatepicker();
			}
        	
        	DisplayCredit("#popup_catalog2");
        	displaySummary("#popup_catalog2");

    		$("body").removeClass("wait");	
        },
	}); 
	};
			
	// Call this function to Setup DatePicker
	function setupDatepickerCatalog(minStartDate,maxPermittedDate,disDates) {
        	
        var disableDates = disDates;
        var disableDays = [""]; 
        
        var minEndDate;
        var endDateStop = false;
        if($("#popup_product #start_Date").val()==""){
        	minEndDate = minStartDate;
        }else{
        	minEndDate = new Date($("#popup_product #start_Date").val());
        }
        
		var Alldays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

		function ShowDisableDates(date) {				
	    	ymd = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2);
	    	day = new Date(ymd).getDay();
	    	if ($.inArray(ymd, disableDates) < 0 && $.inArray(Alldays[day], disableDays) < 0) {
	    		return true;
	    	} else {
	    		return false;
	    	}
		};
	    
    			    

		$("#popup_catalog2 #start_catalog").datepicker({
        	minDate: minStartDate,
      //  	maxDate: maximumDate,
		    dateFormat: 'mm/dd/yy',        
	       	showOn: "button",
	   		buttonImage: "resources/images/reservelab_product/calendar_icon.png",
      		buttonImageOnly: true,
      		buttonText: "",
      	    showOtherMonths: false,  
      	    disabled:false,  	    

      	    //show today's date at bottom
            showButtonPanel: true,
            beforeShow: function (input){
		    	addToday(input);			  
		    },    
		    onChangeMonthYear:function( year, month, inst ) {  
		    	addToday(inst.input);
		    }, 

      		beforeShowDay: function(date){
   	        	var string = jQuery.datepicker.formatDate('mm/dd/yy', date);
  
   					ymd = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2); 

   	   	   		    if(getToday()===string){
   	   					return [disableDates.indexOf(ymd) == -1,"highlight-today"];
   	  				}
   	  				return [ disableDates.indexOf(ymd) == -1 ]
   
   			},	
      		onSelect: function( selectedDate ) {
      			if(selectedDate){
					$( "#popup_catalog2 #end_catalog" ).datepicker( "option", "minDate", selectedDate );
		    		$("#popup_catalog2 #end_catalog").val('');
					endDate="";
					startDate=$('#popup_catalog2 #start_catalog').val();   
					$( "#popup_catalog2 #end_catalog" ).datepicker( "option", "maxDate", getMaxEndDate(startDate, disableDates,maxPermittedDate));			        
		        	$( "#popup_catalog2 #end_catalog" ).datepicker( "enable");
					$("#popup_catalog2 #durationDisplay").text(startDate+' - '+endDate);	 
					DisplayCredit("#popup_catalog2");
      			}
      		}
	    });


		$("#popup_catalog2 #end_catalog").datepicker({	          
	    	minDate: minEndDate,
	   //     maxDate: maximumDate,
		    dateFormat: 'mm/dd/yy',
	       	showOn: "button",
	   		buttonImage: "resources/images/reservelab_product/calendar_icon.png",
      		buttonImageOnly: true,
      		buttonText: "",
      	    showOtherMonths: false,
      	    disabled:true,
      	    //show today's date at bottom
            showButtonPanel: true,
            beforeShow: function (input){
		    	addToday(input);			  
		    },    
		    onChangeMonthYear:function( year, month, inst ) { 
		    	addToday(inst.input);
		    }, 

      		beforeShowDay: function(date){
   	        	var string = jQuery.datepicker.formatDate('mm/dd/yy', date);
   		       	if(getToday()===string){
   					return [true,"highlight-today"];
   				} else {
   					ymd = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2); 
   					return [ disableDates.indexOf(ymd) == -1 ]
   					//ShowDisableDates(date);  
   			   	}
   			},	
            onClose: function( selectedDate ) {
            	if(selectedDate){
            	endDate=$('#popup_catalog2 #end_catalog').val();    
            	$("#popup_catalog2 #durationDisplay").text(startDate+' - '+endDate);	
            	DisplayCredit("#popup_catalog2");
            	}
            }
		});   
		$( "#popup_catalog2 #start_catalog" ).datepicker('enable');	    			
	};

	
