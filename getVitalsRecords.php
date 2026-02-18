/* 
 * Author: Bob Cost-- for CIRAS
 * Grab all submitted vitals records for a single patient (whose id is 'userid')
 * Goal: Display all data points in a line-chart-- all on one graph, then add options to display 1-at-a-timw
 */

<?php
  require('/gabmaster/Query.php');

//get the post from the index.html
$userid = $_GET['userid'];
$password = $_GET["password"];
$data_array = array();

//this is the xeround database instance on out webpage
$link = mysql_connect('localhost', 'cirashea_rwcost', 'October14');

//if no connection show an error
if (!$link) {
    die("Could not connect: " . mysql_error());
}

// select the database on the connection -- our page
// we only have one page now, but could have multiple database if needed
$db_selected = mysql_select_db('cirashea_myphr', $link);		

// this was a pain in the butt, this is how you format a variable for the query later

$patientID = " ' ".$userid." ' ";		// Format variable for query

////////////////////////////////////////////////////////////////////////////////////
/************************  Vitals Records *******************************
 * WHEN EXECUTED, the string '$sql' will grab the following values,     *
 * and store them in '$result' (which will be checked for content) :    *
 * { RAS - LDL - HDL - Systolic - Diastolic } which correspond          *
 * to the userid submitted in the form on the home page.                *
 ************************************************************************/

$sql = "SELECT * FROM user_vitals WHERE userid = ".$patientID;

$result = mysql_query($sql);		
if (!$result) {
    echo "DB Error, could not query the database\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}

//this will fill one row into the variable $row
$row = mysql_fetch_assoc($result);

// lets get the average value and put them into variables
// this query show only return one row so a while loop is not needed
//since the previous fetch was 'assoc' we can reference the row data by column names
$RAS = $row['RAS'];
$HDL = $row['hdl'];
$LDL = $row['ldl'];
$systolic = $row['systolic'];
$diastolic = $row['diastolic'];


//put the variables into an array (by association)
$data_array['RAS'] = $RAS;
$data_array['hdl'] = $hdl;
$data_array['ldl'] = $ldl;
$data_array['systolic'] = $systolic;
$data_array['diastolic'] = $diastolic;

echo json_encode($data_array);	// data_array now contains all extrema stored associatively

?>
