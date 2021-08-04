	
/*
 * Filename: fetchPatientData.js
 * Author: Gabrielle Vanderburgh
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

	//alert("here");
		$('#send').click(function()
		{
		//	var userid = document.getElementById('userid').value;
		//	$.getJSON('dataPage.php?',{userid:userid} // GET parameter sent to server, encoded as a query string on the URL
		//	, function(jsonData) 
			{			
			
			
			
			google.load('visualization', '1', {'packages':['corechart']});
			
			// Set a callback to run when the Google Visualization library is loaded.
    			//google.setOnLoadCallback(drawChart);
    			
 			 // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

    // Create our data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Topping');
    data.addColumn('number', 'Slices');
    data.addRows([
      ['Mushrooms', 3],
      ['Onions', 1],
    ]);


			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, null);
			}

		  };
	
        	});
       	});
        	        	
      