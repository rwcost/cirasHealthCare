<?php
  require('Query.php');

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

/**************************  Max Values *********************************
 * WHEN EXECUTED, the string '$sql' will grab the following Max values, *
 * and store them in '$result' (which will be checked for content) :    *
 * { RAS - LDL - HDL - Systolic - Diastolic } which correspond          *
 * to the userid submitted in the form on the home page.                *
 ************************************************************************/

$sql = "SELECT * FROM usermaxima WHERE userid = ".$patientID;
	
/* (1.1) Execute query ($sql) and (1.2) Store results (in $result); 
 * (2.1) Check query and (2.2) Check ($result) content;
 * (3.1) Extract SQL row from ($result) */
 
$result = mysql_query($sql);		// (1.1) & (1.2)
if (!$result) {				// (2.1)
	echo "DB Error, could not successfully run query ($sql) from the database: " . mysql_error();
	exit;
}
if (mysql_num_rows($result) == 0) {	// (2.2)
    echo "No results found for user id: ($userid).";
    exit;
}
// this will fill one row into the variable $row	
$row = mysql_fetch_assoc($result);	// (3.1) 

// this query show only return one row so a while loop is not needed
//since the previous fetch was 'assoc' we can reference the row data by column names

// Query the DB for values
$RASMaxima = $row['max(RAS)'];
$hdlMaxima = $row['max(hdl)'];
$ldlMaxima = $row['max(ldl)'];
$systolicMaxima = $row['max(systolic)'];
$diastolicMaxima = $row['max(diastolic)'];

// Store results of above queries -> local array
$data_array['RASMaxima'] = $RASMaxima;
$data_array['hdlMaxima'] = $hdlMaxima;
$data_array['ldlMaxima'] = $ldlMaxima;
$data_array['systolicMaxima'] = $systolicMaxima;
$data_array['diastolicMaxima'] = $diastolicMaxima;



/**************************  Min Values *********************************
 * WHEN EXECUTED, the string '$sql' will grab the following Min values, *
 * and store them in '$result' (which will be checked for content) :    *
 * { RAS - LDL - HDL - Systolic - Diastolic } which correspond          *
 * to the userid submitted in the form on the home page.                *
 ************************************************************************/

$sql = "SELECT * FROM userminima WHERE userid = ".$patientID;

$result = mysql_query($sql);
if (!$result) {
    echo "DB Error, could not query the database\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}

//this will fill one row into the variable $row
$row = mysql_fetch_assoc($result);

// this query show only return one row so a while loop is not needed
//since the previous fetch was 'assoc' we can reference the row data by column names
$RASMinima = $row['min(RAS)'];
$hdlMinima = $row['min(hdl)'];
$ldlMinima = $row['min(ldl)'];
$systolicMinima = $row['min(systolic)'];
$diastolicMinima = $row['min(diastolic)'];

//put the variables into an array (by association)
$data_array['RASMinima'] = $RASMinima;
$data_array['hdlMinima'] = $hdlMinima;
$data_array['ldlMinima'] = $ldlMinima;
$data_array['systolicMinima'] = $systolicMinima;
$data_array['diastolicMinima'] = $diastolicMinima;

/**************************  Avg Values *********************************
 * WHEN EXECUTED, the string '$sql' will grab the following Avg values, *
 * and store them in '$result' (which will be checked for content) :    *
 * { RAS - LDL - HDL - Systolic - Diastolic } which correspond          *
 * to the userid submitted in the form on the home page.                *
 ************************************************************************/

$sql = "SELECT * FROM usermeanima WHERE userid = ".$patientID;
$result = mysql_query($sql);

//check to see if query has any records
if (!$result) {
    echo "DB Error, could not query the database\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}

$row = mysql_fetch_assoc($result);	//this will fill one row into the variable $row

// this query show only return one row so a while loop is not needed
//since the previous fetch was 'assoc' we can reference the row data by column names
$RASMeanima = $row['avg(RAS)'];
$hdlMeanima = $row['avg(hdl)'];
$ldlMeanima = $row['avg(ldl)'];
$systolicMeanima = $row['avg(systolic)'];
$diastolicMeanima = $row['avg(diastolic)'];

//put the variables into an array (by association)
$data_array['RASMeanima'] = $RASMeanima;
$data_array['hdlMeanima'] = $hdlMeanima;
$data_array['ldlMeanima'] = $ldlMeanima;
$data_array['systolicMeanima'] = $systolicMeanima;
$data_array['diastolicMeanima'] = $diastolicMeanima;


echo json_encode($data_array);	// data_array now contains all extrema stored associatively

?>