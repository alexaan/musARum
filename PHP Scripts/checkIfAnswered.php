<?php
include("common.php");
$link=dbConnect();

$sessioncode=make_safe($_POST['code']);
$grp_name=make_safe($_POST['grp_name']);
$questions_q_id=make_safe($_POST['questions_q_id']);

$grpQuery = "SELECT * FROM groups WHERE grp_name = '$grp_name'";
$grpResult = mysql_query($grpQuery);
$grpNumrows=mysql_num_rows($grpResult);
if($grpNumrows == 1){
$grp_id = mysql_result($grpResult, 0, 'grp_id');

$checkIfSubmittedQuery = "SELECT * FROM answers WHERE groups_grp_id = '$grp_id' AND sessions_session_id = '$sessioncode' AND questions_q_id = '$questions_q_id'";
$checkIfSubmittedResult = mysql_query($checkIfSubmittedQuery);
$checkIfSubmittedNumrows = mysql_num_rows($checkIfSubmittedResult);
if($checkIfSubmittedNumrows > 0)
{
	echo "answered";
}
else
{
	echo "not answered";
}
}
else{echo "Error: Failed to check if submitted";}
mysql_close();


?>