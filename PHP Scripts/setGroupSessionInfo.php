<?php

include("common.php");
$sessioncode=make_safe($_POST['code']);
$grp_name=make_safe($_POST['grp_name']);
$current_phase=make_safe($_POST['current_phase']);
$current_image_id=make_safe($_POST['current_image_id']);

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
	if($current_phase != "empty")
	{
		$updatePhase = mysql_query("UPDATE groups SET current_phase = '$current_phase' WHERE grp_name = '$grp_name' AND sessions_session_id = '$sessioncode'");
		//$updateAnswer = mysql_query("UPDATE answers SET answer = '$answer' WHERE groups_grp_id = '$grp_id' AND sessions_session_id = '$sessioncode' AND questions_q_id = '$questions_q_id'");
		echo "updated phase";
		echo "new phase is"+$current_phase;
	}
	if($current_image_id != "empty")
	{
		$updateCurrImage = mysql_query("UPDATE groups SET current_image_id = '$current_image_id' WHERE grp_name = '$grp_name' AND sessions_session_id = '$sessioncode'");
		echo "updated img";
		echo "new id is" + $current_image_id;
	}
	
	}
	else 
	{
		echo "error: failed to find group info";
	}
	mysql_close();
	
	
}



?>