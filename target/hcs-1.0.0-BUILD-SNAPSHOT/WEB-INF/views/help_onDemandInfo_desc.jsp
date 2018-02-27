<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p class="help_paragraph">To run a project on demand, first go to the ‘Dashboard’ page, select the project to be scheduled, click on run button:</p>
<img src="resources/images/epam/help/help_startProject.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">Once the run button is clicked, the project will start executing and the run button will change to a red square <span class="glyphicon glyphicon-stop" aria-hidden="true" style="color: #ff1a1a !important; font-size: 16px; top: -4px;"></span> which will stay that way until the project has finished executing. </p>

<p class="help_paragraph">Note, to abort a project while running, click on the red square button <span class="glyphicon glyphicon-stop" aria-hidden="true" style="color: #ff1a1a !important; font-size: 16px; top: -4px;"></span>. </p>

<p class="help_paragraph"> <span class="help_bold">Viewing Result </span></p>
<p class="help_paragraph"> To view the result of an executed project, first go the ‘Dashboard’ page, select the desired project and click on it:</p>
<img src="resources/images/epam/help/help_project_list.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">Once clicked, the display will transition to the ‘Run History’ tab. Under this tab, the last 10 project runs will be displayed. Each run will show the ‘Status’ (i.e. Running, Completed, Interrupted), the Stats of the run (i.e. total number of test cases in project, number of pass and fail), and the run’s associated logs. Please reference the <span class="help_bold" style="color: red;">onPOINT user guide</span> for additional information.</p>
<img src="resources/images/epam/help/help_runHistory.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">The associated logs are a collection of files that give additional information about the project execution. </p>
<p class="help_paragraph">The <span class="glyphicon glyphicon glyphicon-file" aria-hidden="true" style="font-size: 16px; top: -5px;"></span> button will download a PDF file containing several graphs about the test case executions and some quality metrics. The <span class="glyphicon glyphicon-download-alt" aria-hidden="true" style="font-size: 16px; top: -5px;"></span> button will download a zip file containing all the files associated with the project run.</p>

<p class="help_paragraph">The <span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="font-size: 16px; top: -5px;"></span> button will download an Excel spreadsheet that lists al the test cases in the project and the status their execution.</p>
<p class="help_paragraph">Please reference the <span class="help_bold" style="color: red;">onPOINT user guide</span> for additional information.</p>
<p class="help_paragraph">To drill down into a particular run history, click on the desired run history:</p>
<img src="resources/images/epam/help/help_runHistory_details.png" alt="Pic" class="help_modal_img"/>
			<br></br>
<p class="help_paragraph">Will lead to this page which will show all the Pass and Fail results of all the test cases that were executed during the project run:</p>
<img src="resources/images/epam/help/help_testCase_list.png" alt="Pic" class="help_modal_img"/>
			<br></br> 

<p class="help_paragraph">The State Validation Heading shows the disposition of the test case execution which could be PASS, FAIL or INTERRUPTED. Interrupted means that the test case was either aborted manually or stopped by the system for some specific reason.</p>

<p class="help_paragraph">The Trace Capture column indicates whether a pcap trace was collected for the test case.</p>

<p class="help_paragraph">The SIP Validation Column indicates the disposition of the SIP validation of the test case. The possible values is PASS, FAIL or N/A. N/A means that no SIP validation was configured for the test case. </p>

<p class="help_paragraph">Clicking on the PASS or FAIL will pop up a page that show additional details about the test cases.</p>

<p class="help_paragraph">The following is an example of a test case PASS</p>
	<img src="resources/images/epam/help/help_testCase_pass.png" alt="Pic" class="help_modal_img"/>
			<br></br> 

<p class="help_paragraph">The following is an example of SIP Validation PASS and FAIL</p>
<img src="resources/images/epam/help/help_sip_validation_report.png" alt="Pic" class="help_modal_img"/>
<br></br>
<p class="help_paragraph">The Logs column indicates that the user can download the test case associated logs. The logs will be collected into a zip file and downloaded when the <span class="glyphicon glyphicon-download-alt" aria-hidden="true" style="font-size: 16px; top: -5px;"></span> button is clicked. Please reference the <span class="help_bold" style="color: red;">onPOINT user guide</span> for additional information.</p>

<p class="help_paragraph"><span class="help_bold">Failed Test Cases</span></p>
<p class="help_paragraph">Failed test cases can be viewed under the ‘Failed Test Cases’ tab. This tab will show a subset of all the executed test cases which are the failed ones. It will have a similar view as the page that shows the results of all the test cases.</p> 
<img src="resources/images/epam/help/help_failTestcase.png" alt="Pic" class="help_modal_img"/>
<p class="help_paragraph">The following is an example of a test case FAIL</p>
<img src="resources/images/epam/help/help_testCase_fail.png" alt="Pic" class="help_modal_img"/>
			<br></br> 

