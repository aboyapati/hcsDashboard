//Helps in creating a structure will help later.
function makeStruct(names) {
    var names = names.split(' ');
    var count = names.length;
    function constructor() {
        for (var i = 0; i < count; i++) {
            this[names[i]] = arguments[i];
        }
    }
    return constructor;
}

var rootcondition = '<table><tr><td class="seperator" style="color: rgb(154,154,154);">'
					+'<img src="resources/images/projectCreation/remove.png" style="cursor:pointer" alt="Remove" class="remove" />'
					+'<select class="logicalOperator" style="margin-right:5px"><option>OR</option><option>AND</option></select></td>';
rootcondition += '<td><div class="querystmts" style="float:left"></div>'
					+'<div style="float:left;margin-left:5px"><img class="add" style="cursor:pointer" src="resources/images/projectCreation/add icon.png" alt="Add" />'
					+'</div>';
rootcondition += '</td></tr></table>';

var statement = '<div class="statementDiv" style="width:583px;float:left;margin-top:5px;color: rgb(154,154,154);">'
				+'<div class="remove_icon" style="float:left"></div>'
				+'<select class="parameter1" style="float:left;margin-left: 15px;width:115px">'
				+'<option selected value="">--Select--</option><option>Cisco</option><option>GrandStream</option><option>IPC</option>'
				+'<option>Polycom</option></select>'
				+'<select class="parameter2" style="float:left;margin-left: 15px;width:120px">'
				+'<option selected value="">--Select--</option><option value="DISPLAY NAME">Name</option><option value="PRIMARY DN">Phone Number</option>'
				+'<option value="MODEL NUMBER">Model No</option><option value="LOCATION">Location</option>'
				+'<option value="GROUP">Group</option>'
				+'</select>'
				+'<select class="operator1" style="width: 105px;float:left;margin-left: 15px">'
				+'<option selected value="">--Select--</option><option value=\"BEGINS WITH\">Begins With</option><option value=\"ENDS WITH\">Ends With</option>'
				+'<option value=\"EQUALS\">Equals</option><option value=\"CONTAINS\">Contains</option>'
				+'</select>'
				+'<input type="text" class="input1" style="width: 150px;float:left;margin-left: 15px;height:22px"/><br></div>';	

var addqueryroot = function (sel, isroot) {
    $(sel).append(rootcondition);
    var q = $(sel).find('table');
    var l = q.length;
    var elem = q;
    if (l > 1) {
        elem = $(q[l - 1]);
    }

    //If root element remove the close image
    if (isroot) {
        elem.find('td >.remove').detach();
    }
    else {
        elem.find('td >.remove').click(function () {
            // td>tr>tbody>table
            $(this).parent().parent().parent().parent().detach();
        });
    }
    //if($('.querystmts div').nextAll().hasClass('statementDiv')){
	    // Add the default staement segment to the root condition
	    elem.find('td >.querystmts').append(statement);
	
	    // Add the head class to the first statement
	    elem.find('td >.querystmts div >.remove').addClass('head');
    //}

    // Handle click for adding new statement segment
    // When a new statement is added add a condition to handle remove click.
    elem.find('td div >.add').click(function () {
        $(this).parent().siblings('.querystmts').append(statement);
        var stmts = $(this).parent().siblings('.querystmts').find('div >.remove').filter(':not(.head)');
        stmts.unbind('click');
        stmts.click(function () {
            $(this).parent().detach();
        });
    });

    // Handle click to add new root condition
    elem.find('td div > .addroot').click(function () {
        addqueryroot($(this).parent(), false);
    });
};

//Recursive method to parse the condition and generate the query. Takes the selector for the root condition
var getCondition = function (rootsel) {
    //Get the columns from table (to find a clean way to do it later) //tbody>tr>td
    var elem = $(rootsel).children().children().children();
    //elem 0 is for operator, elem 1 is for expressions

    var q = {};
    var expressions = [];
    var nestedexpressions = [];
    var operator = $(elem[0]).find(':selected').val();
    q.operator = operator;
    // Get all the expressions in a condition
    var expressionelem = $(elem[1]).find('> .querystmts .statementDiv');
    for (var i = 0; i < expressionelem.length; i++) {
        expressions[i] = {};
        var parameter1 = $(expressionelem[i]).find('.parameter1 :selected');
        var operator1 = $(expressionelem[i]).find('.operator1 :selected');
        expressions[i].colval = "";
        expressions[i].coldisp = "";
        expressions[i].opval = "";
        expressions[i].opdisp = "";
        
        if(parameter1.val().trim()==""){
        	bootbox.alert("Please Select The Vendor Value For the Search Criteria.").find("div.modal-content").addClass("modalfailure");
    		error = true;
    		return null;
        }
        
        expressions[i].val = "vendor:"+parameter1.val()+"|"+"field:"+$(expressionelem[i]).find('.parameter2 :selected').val()+"|"
							+"comparator:"+operator1.val()+"|"+"value:"+$(expressionelem[i]).find('.input1').val().trim()+";";
    }
    q.expressions = expressions;
    // Get all the nested expressions
	 if ($(elem[1]).find('> div > table').length != 0) {
       var len = $(elem[1]).find('> div > table').length;
        for (var k = 0; k < len; k++) {
           nestedexpressions[k] = getCondition($(elem[1]).find('> div > table')[k]);
        }
    }
	if(error == true){
		return null;
	}
    q.nestedexpressions = nestedexpressions;
    return q;
};

//Recursive method to iterate over the condition tree and generate the query
var getQuery = function (condition) {
    var op = [' ', condition.operator, ' '].join('');

    var e = [];
    var elen = condition.expressions.length;
    for (var i = 0; i < elen; i++) {
        var expr = condition.expressions[i];
        e.push(expr.colval + " " + expr.opval + " " + expr.val);
    }

    var n = [];
    var nlen = condition.nestedexpressions.length;
    for (var k = 0; k < nlen; k++) {
        var nestexpr = condition.nestedexpressions[k];
        var result = getQuery(nestexpr);
        n.push(result);
    }

    var q = [];
    if (e.length > 0)
        q.push(e.join(op));
		
    if (n.length > 0)
        q.push(n.join(op));

    return ['(', q.join(op), ')'].join(' ');
};