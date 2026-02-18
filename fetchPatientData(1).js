	
/*
 * Filename: fetchPatientData.js
 * Author: Robert Cost
 * Professor: Dr. Amit Sheth
 * CS 4900: Web Info Systems
 * Final Project: CIRAS HealthCare - Cardiac Risk Tracking
 *
 * This JS file retrieves the JSON-encoded associative array of patient data,
 * which is echoed by "dataPage.php".
 * The display is built by modifying the HTML elements of "index.html" via DOM manipulation.
 */ 
	
				
function fetchPatientData() {

	$.getJSON('dataPage.php', function(cirasObject) 
	{
	
		var content = document.getElementById("patientDiv");
	       //  content.innerHTML=cirasObject['RASMaxima'];
                // alert(cirasObject['RASMaxima']);
                             
                //content.append('<br />' + cirasObject.RASMaxima); 


	}); // end getJSON

} // end fetchPatientData
