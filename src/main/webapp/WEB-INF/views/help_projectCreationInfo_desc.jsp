<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p class="help_paragraph">After the phones are selected and the phone list is created, it is time now to create the project. To do so, select the Projects tab and click on Create Project button.</p>
<img src="resources/images/epam/help/help_createProject.PNG" alt="Pic" />
<br></br>
<p class="help_paragraph"><span class="help_bold">Creating a Project – Fixed test plan:</span></p>
<p class="help_paragraph"> Provide the Project Name, select a “Fixed” test plan and a resource list from the dropdown. If a new phone List needs to be created for the project, then select from the dropdown “Add New Phone List” and provide the phone List name. Click on the “Next” button.</p>
<img src="resources/images/epam/help/help_create_project.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">Assign the resources from the list in the following way. Select the resource from the dropdown, from the list click on the “Assign” button against the resources. Click on “Next” button.</p>
<img src="resources/images/epam/help/help_create_resouceList_project.png" alt="Pic" />

<p class="help_paragraph">Provide the dial plan details, Park code and retrieve code as necessary. Click on the “Finish” button.</p>
<img src="resources/images/epam/help/help_dialing_plan.png" alt="Pic" />
			<br></br>
			
<p class="help_paragraph">Note: The Internal Dialing number is the phone number that is dialed by a local or internal phone to reach another internal or local phone. 
External Dialing number is the number used to dial an external phone. Normally this is a 10 digits number consisting of the Area Code, NXX and NPA. Sometimes, a ‘9’ might be needed to reach an external number.
Consult your dialing plans on how internal and external phones are dialed.
For Internal Dial: The possible choices are 4 digits, 5 digits, 7 digits or 10 digits.
For External Dial: There is a Prefix box which could contain maximum 2 digits. The possible choices for the external dial are 4 digits, 5 digits, 7 digits or 10 digits.
</p>

<p class="help_paragraph">The success message will be displayed after successful creation of the Project. Click on “Ok” button.</p>
<img src="resources/images/epam/help/help_project_create_success.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">The Project can be shown listed under the projects tab.</p>
<img src="resources/images/epam/help/help_fixed_projets.png" alt="Pic" /> 
<br></br>
<p class="help_paragraph"><span class="help_bold">Creating a project-Progressive test plan:</span></p>

<p class="help_paragraph"> Select a Progressive test plan, provide the Project name and Phone list. If a new phone List needs to be created for the project, then select from the dropdown “Add New Phone List” and provide the phone List name. Click on the “Next” button.</p>
<img src="resources/images/epam/help/help_create_project_progressive.png" alt="Pic" />
<p class="help_paragraph">Select DUT resources for the progressive end point testing. Click on “Next” button.</p>
<img src="resources/images/epam/help/help_create_resouceList_progressive.png" alt="Pic" />
<p class="help_paragraph">Select the acceleration option from the list. Click on “Next” button.</p>
<img src="resources/images/epam/help/help_create_acceleration.png" alt="Pic" />
<p class="help_paragraph">Assign the resources from the list in the following way. Select the subproject and the resource from the respective dropdowns. From the list below, click on the “Assign” button against the resource for the sub project. Click on “Next” button.</p>
<img src="resources/images/epam/help/help_create_termination_progressive.png" alt="Pic" />
<p class="help_paragraph">Provide the dial plan details, Park code and retrieve code as necessary. Click on the “Finish” button</p>
<img src="resources/images/epam/help/help_dialing_plan.png" alt="Pic" />


<p class="help_paragraph">Once a project is created, it is ready to run. In most cases, when a project is created, all the selected test plan test cases will be set to be executed for the project. If it is not desired to run all the test case and instead just a few test cases are needed to be select, click on the Project that was created:</p>
<img src="resources/images/epam/help/help_project_list.png" alt="Pic" />
<p class="help_paragraph">Select the Test Cases tab and check the test cases to run for the project:</p>
<img src="resources/images/epam/help/help_selected_testcases.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">Select the type of execution required for the project (run once or run multiple times) and click on the ‘Run’ button. </p>
<img src="resources/images/epam/help/help_recursive_run.png" alt="Pic" />
			<br></br>

<p class="help_paragraph">The selected test cases are the ones that will be run when the project is executed. Once this is done, the created project is ready to run.</p>
<p class="help_paragraph"><span class="help_bold">Project Execution</span></p>
<p class="help_paragraph">Projects can s scheduled to run at specific desired times or to be run on demand. Multiple projects can run concurrently on an onPOINT Link as long at the resources (phones) executing the test cases are not the same. For obvious reason, a multiple test cases cannot run, at the same, using the same phones.</p>

