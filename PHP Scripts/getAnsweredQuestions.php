<?php
include("common.php");
$link=dbConnect();

$sessioncode=make_safe($_POST['code']);
$grp_name=make_safe($_POST['grp_name']);
$route_number=make_safe($_POST['route_number']);

$grpQuery = "SELECT * FROM groups WHERE grp_name = '$grp_name'";
$grpResult = mysql_query($grpQuery);
$grpNumrows=mysql_num_rows($grpResult);
if($grpNumrows == 1){
$grp_id = mysql_result($grpResult, 0, 'grp_id');

$getAnsweredQuestionsQuery = "SELECT * FROM answers WHERE groups_grp_id = '$grp_id' AND sessions_session_id = '$sessioncode'";
$getAnsweredQuestionsResult = mysql_query($getAnsweredQuestionsQuery);
$getAnsweredQuestionsNumrows = mysql_num_rows($getAnsweredQuestionsResult);
if($getAnsweredQuestionsNumrows > 0)
{
//for every question the group has answered (for every target picture in the session)
	for ($i=0; $i<$getAnsweredQuestionsNumrows; $i++)
	{
		$q_id = mysql_result($getAnsweredQuestionsResult, $i, 'questions_q_id');
		
		//get id of the target picture the client is currently viewing, based on route number
		$targetPictureForQuestionQuery = "SELECT * FROM session_target_picture WHERE sessions_session_id = '$sessioncode' AND route_number = '$route_number'";
		$targetPictureForQuestionResult = mysql_query($targetPictureForQuestionQuery);
		$temp_tp_id = mysql_result($targetPictureForQuestionResult,0,'target_pictures_tp_id');
		
		//if the question belongs to the target picture the client is currently viewing, return it
		//echo "c:";
		//echo $q_id;
		//echo "|";
		//echo $temp_tp_id;
		//echo "!";
		$questionForCorrectTargetQuery = "SELECT * FROM questions WHERE q_id = '$q_id' AND target_pictures_tp_id = '$temp_tp_id'";
		$questionForCorrectTargetResult = mysql_query($questionForCorrectTargetQuery);
		$questionForCorrectTargetNumrows = mysql_num_rows($questionForCorrectTargetResult);
		if($questionForCorrectTargetNumrows == 1)
		{
			echo $q_id;
			echo "|";
		}
		else
		{
			//echo $q_id;
			//echo "|";
			//echo $temp_tp_id;
			//echo "!";
			
		}
	}
}
else
{
	echo "not answered";
}
}
else{echo "Error: Failed to check answered";}
mysql_close();


?>