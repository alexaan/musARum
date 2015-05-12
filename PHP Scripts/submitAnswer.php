<?php
include("common.php");
$link=dbConnect();

$sessioncode=make_safe($_POST['code']);
$grp_name=make_safe($_POST['grp_name']);
$answer=make_safe($_POST['answer']);
$questions_q_id=make_safe($_POST['questions_q_id']);

$grpQuery = "SELECT * FROM groups WHERE grp_name = '$grp_name'";
$grpResult = mysql_query($grpQuery);
$grpNumrows=mysql_num_rows($grpResult);
if($grpNumrows == 1){
	$grp_id = mysql_result($grpResult, 0, 'grp_id');

	$checkIfAlreadyAnsweredByGroupQuery = "SELECT * FROM answers WHERE groups_grp_id = '$grp_id' AND sessions_session_id = '$sessioncode' AND questions_q_id = '$questions_q_id'";
	$checkIfAlreadyAnsweredByGroupResult = mysql_query($checkIfAlreadyAnsweredByGroupQuery);
	$checkIfAlreadyAnsweredByGroupNumrows = mysql_num_rows($checkIfAlreadyAnsweredByGroupResult);
	if($checkIfAlreadyAnsweredByGroupNumrows > 0)
	{
		$updateAnswer = mysql_query("UPDATE answers SET answer = '$answer' WHERE groups_grp_id = '$grp_id' AND sessions_session_id = '$sessioncode' AND questions_q_id = '$questions_q_id'");
		//$insertAnswer = mysql_query("INSERT INTO answers (answer, questions_q_id, sessions_session_id, groups_grp_id) VALUES ('$answer', '$questions_q_id', '$sessioncode', '$grp_id')");
		echo "Answer updated";
	}
	else
	{
		$insertAnswer = mysql_query("INSERT INTO answers (answer, questions_q_id, sessions_session_id, groups_grp_id) VALUES ('$answer', '$questions_q_id', '$sessioncode', '$grp_id')");
		echo "Answer submitted";
	}



	
}
else{echo "Error: Failed to submit answer";}
mysql_close();


?>