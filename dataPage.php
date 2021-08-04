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

//select the database on the connection (our page) we only have one now, but we could have multiple database if needed
$db_selected = mysql_select_db('cirashea_myphr',$link);		// Select a DB on the server (Select "myphr" DB on the 'mysql_connect' connection return)

// this was a pain in the butt, this is how you format a variable for the query later
$patientID = "'".$userid."'";

//**********************************************  maximum values ***********************************************************************************
//this string 'when' executed will get the maximimun values of RAS ldl hdl systolic diastolic for the userid that was passed to this page
$sql = "select * from usermaxima where userid = ".$patientID;

// the results of the query string will go into the variable named result
$result = mysql_query($sql);

//check to see if query has any records
if (!$result)
		{
			echo "DB Error, could not query the database\n";
    			echo 'MySQL Error: ' . mysql_error();
    			exit;
    		}
    		
//this will fill one row into the variable $row
$row = mysql_fetch_assoc($result);

// this query show only return one row so a while loop is not needed
//since the previous fetch was 'assoc' we can reference the row data by column names
$RASMaxima = $row['max(RAS)'];
$hdlMaxima = $row['max(hdl)'];
$ldlMaxima = $row['max(ldl)'];
$systolicMaxima = $row['max(systolic)'];
$diastolicMaxima = $row['max(diastolic)'];

//put the variables into an array (by association)
$data_array['RASMaxima'] = $RASMaxima;
$data_array['hdlMaxima'] = $hdlMaxima;
$data_array['ldlMaxima'] = $ldlMaxima;
$data_array['systolicMaxima'] = $systolicMaxima;
$data_array['diastolicMaxima'] = $diastolicMaxima;



//**********************************************  minimum values ***********************************************************************************
//this string when executed will get the mimimun values of RAS ldl hdl systolic diastolic for the userid that was passed to this page
$sql = "select * from userminima where userid = ".$patientID;

// the results of the query string will go into the variable named result
$result = mysql_query($sql);

//check to see if query has any records
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


//**********************************************  average values ***********************************************************************************
//this string when executed will get the average or 'meanima' (my new word today) values of RAS ldl hdl systolic diastolic for the userid that was passed to this page
$sql = "select * from usermeanima where userid = ".$patientID;
// the results of the query string will go into the variable named result
$result = mysql_query($sql);

//check to see if query has any records
if (!$result) {
    echo "DB Error, could not query the database\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}


//this will fill one row into the variable $row
$row = mysql_fetch_assoc($result);

//lets get the average value and put them into variables
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

//encode the array and echo it back to the caller
echo json_encode($data_array);


?>