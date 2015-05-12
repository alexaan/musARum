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
	$duplicationCheckQuery = "SELECT * FROM groups WHERE grp_name = '$grp_name' AND sessions_session_id = '$sessioncode'";
	$duplicationCheckResult = mysql_query($duplicationCheckQuery);
	$duplicationCheckNumrows = mysql_num_rows($duplicationCheckResult);
	
	//check if a session with the input session code exists.
	if($sessionExistsCheckNumrows == 0){
		echo "error: no such session";
	}
	//check if a group with that name is already created for the selected session.
	else if($duplicationCheckNumrows > 0){
		echo "error: duplicated group";
	}
	else //no problems detected, insert data.
	{
		$query="INSERT INTO groups (grp_name, sessions_session_id, current_phase, current_image_id) VALUES ('$grp_name', '$sessioncode', 'Phase 1', '1')";
		$result=mysql_query($query);
		echo "success";
	}
	mysql_close();
	
	
}



?>
