<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p class="help_paragraph">The phones identified to be used for the running the Automation projects will be defined in this section. Several phone attributes are needed to add the automation phones to the phone inventory. The following is the list of attributes and meaning:</p>

<ul class="help_li"><li><p class="help_paragraph"><span class="help_bold" style=""> Site:</span> The site to which the phone belong. This is the site configured under the Sites section</p></li>
<li><p class="help_paragraph"><span class="help_bold"> Phone Type:</span> There are two types of phones defined for the Automation: Local and PSTN. Local means that the phone belong to Call Server of the same site of the phone. PSTN means that the phone belongs to a different call server belonging to a different site.</p></li>
<li><p class="help_paragraph"><span class="help_bold"> Vendor:</span> Currently supported phones are Polycom and Cisco. </p></li>
<li><p class="help_paragraph"><span class="help_bold">Phone Name:</span>A name given to the phone to help identify it. Example: Auto Test 1</p></li>
<li><p class="help_paragraph"><span class="help_bold">Protocol:</span> This field indicates the protocol that the phone support. Current SIP is allowed, so SIP should be entered in this field</p></li>
<li><p class="help_paragraph"><span class="help_bold">Model Number:</span> the phone model number. </p></li>
<li><p class="help_paragraph"><span class="help_bold">Firmware Version:</span> the phone firmware version</p></li>
<li><p class="help_paragraph"><span class="help_bold">IP Address:</span> the phone IP address. This IP address should be static.</p></li>
<li><p class="help_paragraph"><span class="help_bold">PhoneDN:</span> the phone DN (Directory Number). For Cisco phones, this the DN number used by the CUCM to reach the phone</p></li>
<li><p class="help_paragraph"><span class="help_bold">FQDN: </span>the phone FQDN is configured. This is an optional parameter</p></li></ul>
</br>
<p class="help_paragraph">Select Phones tab and click on Add Phone button.</p>
<img src="resources/images/epam/help/help_phones.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">Provide the mandatory fields as shown below. Click on the ‘[+]’ link to add lines to the phones. Provide the line details. Click on “save” button.</p>
<img src="resources/images/epam/help/help_add_phone.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">Note: as phones are added, they will be listed on the Phones tab. If a mistake or wrong information was entered, use the  <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="font-size: 16px; top: -5px;"></span>  button to edit the information. To delete any phone click on the  <span class="glyphicon glyphicon-trash" aria-hidden="true" style="font-size: 16px; top: -5px;"></span>  button.</p>

<p class="help_paragraph"><span class="help_bold">Import Phone Details:</span></p>
<p class="help_paragraph">The Phones can be uploaded in bulk through an excel sheet in the following way. Select the Configuration tab. Select the Phones tab. Click on Import button.</p>
<img src="resources/images/epam/help/help_phones_import.png" alt="Pic"  style="border: 4px solid #000;"/>
			<br></br>
<p class="help_paragraph">Provide the mandatory details such as Site, Phone make and choose the file from the location. Click on the validate button to validate the sheet.</p>
<img src="resources/images/epam/help/help_validate_sheet.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">On successful validation, the following success message will be shown. Click on Ok button next</p>			
	<img src="resources/images/epam/help/help_validate_success.png" alt="Pic"  style="margin-left: 45px;"/>
			<br></br>
<p class="help_paragraph">The Phones can be saved after the successful validation as the save button is enabled. Click on the “save” button.</p>	
<img src="resources/images/epam/help/help_save_phones_sheet.png" alt="Pic" />
			<br></br>	
<p class="help_paragraph">Note: as phones are added, they will be listed on the Phones tab. If a mistake or wrong information was entered, use the  <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="font-size: 16px; top: -5px;"></span>  button to edit the information. To delete any phone click on the  <span class="glyphicon glyphicon-trash" aria-hidden="true" style="font-size: 16px; top: -5px;"></span>  button.</p>

<p class="help_paragraph"><span class="help_bold">Add PSTN Phones:</span></p>
<p class="help_paragraph">The PSTN phones can be added in the following way. Select the Configuration tab. Select the PSTN Phones tab, then Click on Add Phone button.</p>
<img src="resources/images/epam/help/help_pstnPhoes.png" alt="Pic" style="margin-left: 45px;" />
			<br></br>
<p class="help_paragraph">Provide the required details and click on Save.</p>
<img src="resources/images/epam/help/help_add_pstnPhone.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">Note: as PSTN phones are added, they will be listed on the PSTN Phones tab. If a mistake or wrong information was entered, use the  <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="font-size: 16px; top: -5px;"></span>  button to edit the information. To delete any phone click on the  <span class="glyphicon glyphicon-trash" aria-hidden="true" style="font-size: 16px; top: -5px;"></span>  button.</p>

<p class="help_paragraph"><span class="help_bold">Export Phones to File:</span></p>

<p class="help_paragraph">The Phones can be exported from the inventory to a file in the following way. Select the Configuration tab. Select the Phones tab. Click on “Export” button.</p>
	<img src="resources/images/epam/help/help_export_phones.png" alt="Pic" style="margin-left: 45px;" />
			<br></br>
			
<p class="help_paragraph">Provide the Site detail, phone make and the file name for the export. Click on the “Save” button.</p>
<img src="resources/images/epam/help/help_export_sheet.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">The File will be downloaded on the local machine as shown below.</p>
	<img src="resources/images/epam/help/help_export_file.png" alt="Pic" />
			<br></br>		