/**
 * File: /bob/front.js
 * Authors: Bob Cost
 * Course: CS 4800: Web Info Systems, Prof. Amit Sheth. WSU.
 * This page of JavaScript is included in "bob/index.html". 
 * When the page is ready, this script executes an anonymous function which makes a
 * call to retrieve a JSON object when the button whose id="send" is clicked; 
 * the server page 'dataPage.php' is queried for the user's data.
 * The data retrieved is specified by the userid provided in the aptly named "userid" field.
 * 'dataPage.php' echos the requested user's data in JSON format
 */

$(document).ready( function(){
	
	// fetchPatientData();
	
	$("#cirasForm").submit(function(e){
	
		var USERID=$("#userid").val();
		var serverURL="dataPage.php"
		var request = 
		       $.ajax({ url:"dataPage.php",
				type:"GET",
				data: { userid:USERID},
				dataType:"json",
				success:function(msg){
					    fetchPatientData();
					
				}
			});
		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		});	
		e.preventDefault();
		return true;
	});
}) 		
	
            
 
