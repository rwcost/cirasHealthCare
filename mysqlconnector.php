<?php
/*this php code gets the post userID from the index.html page and
makes a connection to the xecloud database and queries on the select statement
 * for the proper userID
*/

//  fan booth 2 speed  
//start php code to fetch data from the query made fora the

  require('Query.php');

//this is the local database instance on the cloud
$link = mysql_connect('localhost', 'cirashea_rwcost', 'October14');	//  mysql_connect(' IP:PORT', 'USERNAME', 'PASSWORD');

if (!$link) {
    die('Could not connect: ' . mysql_error());		// Verify database connection
}

$db_selected = mysql_select_db('cirashea_myphr',$link);		// Select a DB on the server (Select "myphr" DB on the 'mysql_connect' connection return)

//this is where the named pairs from the phone are put into the user vitals 
//$sql = 
//"INSERT INTO user_vitals (userid,date_time,systolic,diastolic,hdl,ldl,RAS,isOnMeds,isSmoker,age,isDiabetic,isMale)VALUES 
//('".$_POST['useridName']."','".$_POST['date_timeName']."','".$_POST['systolicName']."','".$_POST['diastolicName']."',
//'".$_POST['hdlName']."','".$_POST['ldlName']."','".$_POST['RASName']."','".$_POST['isOnMedsName']."',
//'".$_POST['isSmokerName']."','".$_POST['ageName']."','".$_POST['isDiabeticName']."','".$_POST['isMaleName']."')";

//this is where the named pairs from the phone are put into the user vitals 
$sql = 
"INSERT INTO user_vitals (userid,systolic,diastolic,hdl,ldl,RAS,isOnMeds,isSmoker,age,isDiabetic,isMale)VALUES 
('".$_POST['useridName']."','".$_POST['systolicName']."','".$_POST['diastolicName']."',
'".$_POST['hdlName']."','".$_POST['ldlName']."','".$_POST['RASName']."','".$_POST['isOnMedsName']."',
'".$_POST['isSmokerName']."','".$_POST['ageName']."','".$_POST['isDiabeticName']."','".$_POST['isMaleName']."')";


$result = mysql_query($sql);

//check to see if query has any records
if (!$result) {
    echo "DB Error, could not query the database\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}


echo $val
?>
