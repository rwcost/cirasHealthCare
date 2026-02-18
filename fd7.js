	
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
	
$(function() 
	{ // wait til the document is ready before we start trying to access its elements	

	
		$('#send').click(function()
		{
			var userid = document.getElementById('userid').value;
			$.getJSON('dataPage.php',{userid:userid}, function(jsonData) 
			{			
                		
                 		//alert(jsonData['RASMaxima']);
      
  //*****************  chart stuff  ******************************************************************************************************************************************************************               	
	var barBackgrounds = [['', '', ''], 
	[$.gchart.gradient(0, 'white', 'red'), $.gchart.gradient(-90, 'white', 'green'), 
	$.gchart.gradient(-60, 'white', 'blue')], 
	[$.gchart.stripe(0, ['white', 'red'], [0.1, 0.1]), 
        $.gchart.stripe(-90, ['white', 'green'], [0.1, 0.1]), 
        $.gchart.stripe(-60, ['white', 'blue'], [0.1, 0.1])]]; 
        
	var barSeries = [$.gchart.series('Max', [(jsonData['RASMaxima']), (jsonData['ldlMaxima']),(jsonData['hdlMaxima']), (jsonData['systolicMaxima']),(jsonData['diastolicMaxima'])], 'red',0,200), 
    	$.gchart.series('Averages', [(jsonData['RASMeanima']), (jsonData['ldlMeanima']),(jsonData['hdlMeanima']), (jsonData['systolicMeanima']),(jsonData['diastolicMeanima'])], 'green',0,300), 
        $.gchart.series('Minimum', [(jsonData['RASMinima']), (jsonData['ldlMinima']),(jsonData['hdlMinima']), (jsonData['systolicMinima']),(jsonData['diastolicMinima'])], 'blue',0,300)]; 

	$('#barChart').gchart({type: 'barVertGrouped', series: barSeries, barWidth: 30, barSpacing: 5, barGroupSpacing: 8, 
	barZeroPoint: 0.0,title:"C.I.R.A.S Heart Care User Data", titleColor:'green',legend:' ',dataLabels: ['RAS Score', 'ldl values', 'hdl values', 'systolic values','diastolic values']}); 
 
 //	$('#barChart')$.gchart.axis('right', 0, 200, 50, 'blue', 'left');
 
//*****************************************************************************************************************************************************************************************************                 		
                 	});
   		});
   		
	});	

