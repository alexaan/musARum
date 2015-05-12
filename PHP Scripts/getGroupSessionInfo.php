<?php

include("common.php");
$sessioncode=make_safe($_POST['code']);
$grp_name=make_safe($_POST['grp_name']);
if(!$sessioncode || !$grp_name){
	echo "error: data missing";
}else{
	$link=dbConnect();
	
	$sessionExistsCheckQuery = "SELECT * FROM sessions WHERE session_id = '$sessioncode'";
	$sessionExistsCheckResult = mysql_query($sessionExistsCheckQuery);
	$sessionExistsCheckNumrows = mysql_num_rows($sessionExistsCheckResult);
	
	$sessionInfoQuery = "SELECT * FROM groups WHERE grp_name = '$grp_name' AND sessions_session_id = '$sessioncode'";
	$sessionInfoResult = mysql_query($sessionInfoQuery);
	$sessionInfoNumrows = mysql_num_rows($sessionInfoResult);
	
	//check if a session with the input session code exists.
	if($sessionExistsCheckNumrows == 0){
		echo "error: no such session";
	}
	//check if a group with that name is already created for the selected session.
	else if($sessionInfoNumrows > 0){
	$current_phase = mysql_result($sessionInfoResult, 0, 'current_phase');
	$current_image_id = mysql_result($sessionInfoResult, 0, 'current_image_id');
		echo $current_phase;
		echo "|";
		echo $current_image_id;
	}
	else //no problems detected, insert data.
	{
		echo "error: failed to find group info";
	}
	mysql_close();
	
	
}



?>