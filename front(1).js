/**
 * File: /bob/front.js
 * Authors: Bob Cost & Gabrielle Vanderburgh
 * Course: CS 4800: Web Info Systems, Prof. Amit Sheth. WSU.
 * This page of JavaScript is included in "bob/index.html". 
 * When the page is ready, this script executes an anonymous function which makes a
 * call to retrieve a JSON object when the button whose id="send" is clicked; 
 * the server page 'dataPage.php' is queried for the user's data.
 * The data retrieved is specified by the userid provided in the aptly named "userid" field.
 * 'dataPage.php' echos the requested user's data in JSON format
 */

$(document).ready( function () {

	$("form").submit(function(e){
		
		var USERID=$("#userid").val();
		// var queryURL="dataPage.php?userid="+USERID;
		
		var request = $.ajax({  url: "dataPage.php",
					type:"GET",
					data: { userid:USERID},
					dataType:"json"			
					});
					
					
		request.done(function (patientArray) {
			var content = document.getElementById("patientDiv");
					 
			content.innerHTML=
				 "RAS Maximum:" + patientArray['RASMaxima']  + " RAS Minimum:" + patientArray['RASMinima'] + 
				 " LDL Maximum:" + patientArray['ldlMaxima'] + " LDL Minimum:" + patientArray['ldlMinima'] + 
				 " HDL Maximum:" + patientArray['hdlMaxima'] + " HDL Minimum:" + patientArray['hdlMinima'] + 
				 " Systolic Maximum:"  + patientArray['systolicMaxima']  + " Systolic Minimum:"  + patientArray['systolicMinima'] +
				 " Diastolic Maximum:" + patientArray['diastolicMaxima'] + " Diastolic Minimum:" + patientArray['diastolicMinima'] ;
			
			averageContent.innerHTML=
				"RAS Average:" + patientArray['RASMeanima'] + " LDL Average:" + patientArray['ldlMeanima']  + 
				" HDL Meanima:" + patientArray['hdlMeanima'] + " Systolic Meanima:" + patientArray['systolicMeanima'] +  
				" Diastolic Meanima:" + patientArray['diastolicMeanima'];
					        
			var extreme = document.getElementById("maxRAS");
			extreme.innerHTML=patientArray['RASMaxima'];
			
			extreme = document.getElementById("maxLDL");
			extreme.innerHTML=patientArray['ldlMaxima'];
			
			extreme = document.getElementById("maxHDL");
			extreme.innerHTML=patientArray['hdlMaxima'];
			
			
			// DOESN'T WORK : $("#maxRAS").innterHTML=patientArray['RASMaxima'];
			
			//for( var i = 0; i < 5; i++)
			//{
			//$("#a").innerHTML="<td> RAS Maximum: </td> ");
			//$("#b").innerHTML="<td>RAS Minimum: </td> ");
			
				/* $("tr").val(" LDL Maximum:" + patientArray['ldlMaxima'] );
				$("tr").val(" LDL Minimum:" + patientArray['ldlMinima'] );
				$("tr").val(" HDL Maximum:" + patientArray['hdlMaxima'] ); */
			//}
			
			//$("#responseDiv").load("dataPage.php");
			 
			 
		}); // end function (patientArray) { ... }	
				
		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		});	
		
		e.preventDefault();
		return true;
		
	}); // end  submit form
    
}); // end ready	        
 
function drawVisualization() {
  var dataTable = google.visualization.arrayToDataTable([
    ['Name',   'Age', 'Instrument', 'Color'],
    ['John',   24,     'Guitar',    'Blue'],
    ['Paul',   52,     'Sitar',     'Red'],
    ['George', 16,     'Guitar',    'Green'],
    ['Ringo',  72,     'Drums',     'White']
  ]);

  var table = new google.visualization.Table(document.getElementById('table'));
  table.draw(dataTable, null);

  var dataView = new google.visualization.DataView(dataTable);
  dataView.setColumns([0, 1]);

  var chart = new google.visualization.ColumnChart(document.getElementById('chart'));
  chart.draw(dataView, {width: 400, height: 200});
}