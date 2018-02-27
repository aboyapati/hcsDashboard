<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p class="help_paragraph">The onPOINT link is the most crucial part of the configuration. </p>

<p class="help_paragraph">
An onPOINT link server is a dedicated server that is used to execute automation test projects and report the results to onPOINT. The server is intended to reside in a customer network where it can communicate with the phones that will be executing the automation test case. This server can also reside in the tekVizion network which it will not require any setup. </p>

<p class="help_paragraph">This server will be act a proxy (hence it will be referred to as proxy server in the subsequent literature) to the onPOINT main controller and will be responsible for executing the automated test cases and reporting back the result to the onPOINT main controller. </p>

<p class="help_paragraph">For detailed information about the server, its requirements and complete setup, refer to <span class="help_bold" style="color: red;">onPOINT Link registration Guide</span></p>

<p class="help_paragraph">The configuration of onPOINT Link may consist of two steps. One required setup is on the onPOINT Portal and the second is on the server residing in the customer’s premise. </p>

<p class="help_paragraph"><span class="help_bold">onPOINT Portal Setup:</span></p>
<p class="help_paragraph">This step is only required if the onPOINT Link will be communicating with the trace capture server. This is an optional functionality that allows the capturing of the pcap traces of the automated test calls. If the no trace capture server is required for the setup, then this step can be skipped. If not, then click on onPOINT Link tab to establish a connection to the Automation Node.</p>
<img src="resources/images/epam/help/help_onPoint_Link.png" alt="Pic" />
			<br></br>
<p class="help_paragraph">For more information about the capture server requirements and setup, please refer to <span class="help_bold" style="color: red;">Deployment Guide</span></p>
<p class="help_paragraph">And click on Edit button and provide the trace capture server details. </p>
<img src="resources/images/epam/help/help_edit_onPoint_link.png" alt="Pic" />
			<br></br>

<p class="help_paragraph"><span class="help_bold">On Premise Setup</span></p>
<p class="help_paragraph">This setup is required to be performed on the onPOINT Link server. Access to the server is from the customer premises only. The following two sections list the server requirements and prerequisites before the configuration can start.</p>
<p class="help_paragraph"><span class="help_bold">Server Requirements:</span></p>
<ul class="help_li"><li><p class="help_paragraph">OS Linux: Ubuntu: 14.04 or CentOS: 6.x</p></li>
<li><p class="help_paragraph">CPU: 2.0GHz or higher</p></li>
<li><p class="help_paragraph">Mem: 4 GB</p></li>
<li><p class="help_paragraph">HDD: 16 GB or more</p></li>
<li><p class="help_paragraph">No java</p></li>
<li><p class="help_paragraph">No tomcat</p></li>
<li><p class="help_paragraph">Static IP address</p></li>
<li><p class="help_paragraph">Utility ‘wget’ installed</p></li>
<li><p class="help_paragraph">Access to the internet</p></li>
<li><p class="help_paragraph">Port 25995 available</p></li>
<li><p class="help_paragraph">1 network interface. If two are used, the first IP address will be used for internal operation</p></li>
<li><p class="help_paragraph"></p>Server needs to have hostname configured</li>
<li><p class="help_paragraph">Root access for initiating the auto registration process</p></li></p></li>
</ul>

<p class="help_paragraph"><span class="help_bold">Pre-Setup Requirements</span></p>
<p class="help_paragraph">Before an onPOINT Link server is registered and ready to run, the end user is required to determine the access method to the server. There are two possible ways to allow the proxy server to communicate with the onPOINT server. The methods are:</p>
<ul class="help_li"><li><p class="help_paragraph">VPN</p></li>
<li><p class="help_paragraph">Public IP</p></li></ul>

<p class="help_paragraph">If using the VPN access, then the end user needs to contact tekVizion IT and onPOINT support to establish the VPN tunnel. </p>
<p class="help_paragraph">If using the Public IP access, then the end user needs to ensure that port 25995, TCP, is allowed access through the firewall and NAT’d to proxy server.</p>

<p class="help_paragraph">Additionally, if the proxy server is given a Public IP address, then the proxy server will require two interfaces: one to the internet and the other to the internal private network. The Public IP interface needs to be permitted to access port 25995.  The setup of the server with the two interface will be the customer’s responsibility. </p>

<p class="help_paragraph">Furthermore, the end user is required to obtain the following Automation proxy server information from tekVizion:</p> 
<ul class="help_li"><li><p class="help_paragraph">Customer Name</p></li>
<li><p class="help_paragraph">Site Name</p></li>
<li><p class="help_paragraph">Proxy Server name</p></li>
<li><p class="help_paragraph">License key </p></li></ul>
<p class="help_paragraph">After the requirements and prerequisites are met, the configuration can start. The following steps needs to be taken:</p>
<ol class="help_decimal"><li><p class="help_paragraph">Login to the proxy server as root user. Any other user will cause the registration process to fail</p></li>
<li><p class="help_paragraph">Change the working directory to /tmp by doing:<br>
<span class="help_bold">cd /tmp</span> </p></li>
<li><p class="help_paragraph">Download the auto registration script from the tekVizion download site by doing:<br>
<span class="help_bold">wget onpoint.tekvizion.com/downloads/Automation/autoReg/autoReg.sh</span></p></li>
<li><p class="help_paragraph">Once the script is downloaded, change its permission as such:<br>
<span class="help_bold">chmod +x autoReg.sh</span></p></li>
<li><p class="help_paragraph">Run the script as such:<br> 
<span class="help_bold">./autoReg.sh</span></p></li></ol>
<p class="help_paragraph">If no error are encountered, the onPOINT Link is now ready to start executing projects. At this point, the next steps are to create test project and execute them</p>
<p class="help_paragraph"><span class="help_bold">Link Upgrade:</span></p>
<p class="help_paragraph">When a new release of automation Service is available readily, then the tekVizion administrator will introduce the load into the onPoint server. Once the upgrade link is available on onPoint server, a button on the onPoint Link tab will be enabled to the user to upgrade. Once the button is clicked by the User, the upgrade process will start.  
</p>
<br></br>
<p class="help_paragraph"><span class="help_bold">Uploading Jar:</span></p>
<p class="help_paragraph">The automation link jar that is to be required for upgrading the link should be uploaded first using UI tab available at Admin --> OnPointLinkBuilds.</p>
<img src="resources/images/epam/help/help_edit_onPoint_link.png" alt="Pic" />
<br></br>
<p class="help_paragraph"><span class="help_bold">onPOINT Link Upgrade:</span></p>
<p class="help_paragraph">When a new version of onPOINT link is available, the user gets a prompt at the dashboard as shown below</p>
<img src="resources/images/epam/help/help_linkUpgrade.PNG" alt="Pic" />
<br></br>
<p class="help_paragraph">On click of the ‘New Version Available’ link, the user will be asked for confirmation to update and on confirming the update, the onPOINT link starts updating.</p>
<img src="resources/images/epam/help/help_upgradeInProgress.PNG" alt="Pic" />
<br></br>
<p class="help_paragraph">The connection at dashboard turns to green after the link is updated successfully.</p>
