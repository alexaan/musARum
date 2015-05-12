<?php
include("common.php");
$link=dbConnect();
$tp_id=make_safe($_POST['tp_id']);
$sessioncode=make_safe($_POST['code']);

$query="SELECT * FROM questions WHERE target_pictures_tp_id = '$tp_id' AND sessions_session_id = '$sessioncode'";

$result=mysql_query($query);
$numrows=mysql_num_rows($result);
if($result){

for ($i=0; $i<$numrows; $i++)
	{
	
	$q_id=mysql_result($result, $i,'q_id');
	$question=mysql_result($result, $i,'question');
	$solution=mysql_result($result, $i,'solution');
	$sessions_session_id=mysql_result($result, $i,'sessions_session_id');
	$groups_grp_id=mysql_result($result, $i,'groups_grp_id');
	$target_pictures_tp_id=mysql_result($result, $i,'target_pictures_tp_id');
	$alternative1 = mysql_result($result, $i, 'alternative1');
	$alternative2 = mysql_result($result, $i, 'alternative2');
	$alternative3 = mysql_result($result, $i, 'alternative3');
	
	$query2="SELECT FROM groups WHERE grp_id ='$groups_grp_id'";
	$result2=mysql_query($query2);
	$grp_name=mysql_result($result2,0,'grp_name');
	
	echo $q_id;
	echo "|";
	echo $question;
	echo "|";
	echo $solution;
	echo "|";
	echo $sessions_session_id;
	echo "|";
	echo $groups_grp_id;
	echo "|";
	echo $target_pictures_tp_id;
	echo "|";
	echo $grp_name;
	echo "|";
	echo $alternative1;
	echo "|";
	echo $alternative2;
	echo "|";
	echo $alternative3;
	echo "&";
        
        
	}
}else{
	echo "getAnswers failed";
	
}
mysql_close();


?>