<?php
include("common.php");
$link=dbConnect();
$sessioncode=make_safe($_POST['code']);
$query="SELECT * FROM session_target_picture WHERE sessions_session_id = '$sessioncode' ORDER BY target_pictures_tp_id ASC";

$result=mysql_query($query);
$numrows=mysql_num_rows($result);
if($result){

for ($i=0; $i<$numrows; $i++)
	{
	$tempTargetPicId = mysql_result($result,$i,'target_pictures_tp_id');
	$route_number = mysql_result($result, $i, 'route_number');
	
	$query2="SELECT * FROM museumdb.target_pictures WHERE tp_id = $tempTargetPicId";
	$result2=mysql_query($query2);
	
	$tp_id=mysql_result($result2, 0,'tp_id');
	$tp_name=mysql_result($result2, 0,'tp_name');
	$tp_info=mysql_result($result2, 0,'tp_info');
	$tp_hintImg=mysql_result($result2, 0,'tp_hintImg');
	
	echo $tp_id;
	echo "|";
	echo $tp_name;
	echo "|";
	echo $tp_info;
	echo "|";
	echo $tp_hintImg;
	echo "|";
	echo $route_number; 
	echo "&";
        
        
	}
}else{
	echo "getTargets failed";
	
}
mysql_close();


?>