$(document).ready(function() { // wait til the document is ready before we start trying to access its elements


 $('#send').click(function(){

var userid = document.getElementById('userid').value;

$.getJSON('dataPage.php',{userid:userid} // GET parameter sent to server, encoded as a query string on the URL
		, function(data) {



alert(jsonData['RASMaxima']);

		$('#basicGChart').gchart({type: 'line', maxValue: 40,
		title: 'Weather for|Brisbane, Australia', titleColor: 'green',
		backgroundColor: $.gchart.gradient('horizontal', 'ccffff', 'ccffff00'),
		series: [$.gchart.series('Max', [29.1, 28.9, 28.1, 26.3,
		23.5, 21.2, 20.6, 21.7, 23.8, 25.6, 27.3, 28.6], 'red', 'ffcccc'),
		$.gchart.series('Min', [20.9, 20.8, 19.5, 16.9,
		13.8, 10.9, 9.5, 10.0, 12.5, 15.6, 18.0, 19.8], 'green'),
		$.gchart.series('Rainfall', [157.7, 174.6, 138.5, 90.4,
		98.8, 71.2, 62.6, 42.7, 34.9, 94.4, 96.5, 126.2], 'blue', 0, 200)],
		axes: [$.gchart.axis('bottom', ['Jan', 'Feb', 'Mar', 'Apr',
		'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], 'black'),
		$.gchart.axis('left', 0, 40, 'red', 'right'),
		$.gchart.axis('left', ['C'], [50], 'red', 'right'),
		$.gchart.axis('right', 0, 200, 50, 'blue', 'left'),
		$.gchart.axis('right', ['mm'], [50], 'blue', 'left')],
		legend: 'right'});

		});
//	};

	});
  });
