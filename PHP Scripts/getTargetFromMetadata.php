<?php
include("common.php");
$link=dbConnect();
$tp_id=make_safe($_POST['tp_id']);
$query="SELECT * FROM target_pictures WHERE tp_id = '$tp_id'";

$result=mysql_query($query);
$numrows=mysql_num_rows($result);
if($result){

$tp_name = mysql_result($result,0,'tp_name');
$tp_info = mysql_result($result,0,'tp_info');
$tp_hintImg = mysql_result($result,0,'tp_hintImg');
$tp_id = mysql_result($result,0,'tp_id');
echo $tp_name;
echo "|";
echo $tp_info; 
echo "|";
echo $tp_hintImg;
echo "|";
echo $tp_id;
echo "&";
	$query3="SELECT * FROM tp_ar_element WHERE target_pictures_tp_id = '$tp_id'";
	$result3=mysql_query($query3);
	$numrows_result3=mysql_num_rows($result3);
	if($result3){
		$arElementStack = array();
		for ($i=0; $i<$numrows_result3; $i++){
			$ar_elements_ar_element_id=mysql_result($result3,$i,'ar_elements_ar_element_id');
			array_push($arElementStack,$ar_elements_ar_element_id);
			}
	$numArElements = count($arElementStack);
	$test_array = array();
	while(list($key, $val) = each($arElementStack)){
		$query4="SELECT * FROM ar_elements WHERE ar_element_id = '$val'";
		$result4=mysql_query($query4);
		$ar_element_id = mysql_result($result4,0,'ar_element_id');
		$are_name=mysql_result($result4,0,'are_name');
		$url=mysql_result($result4,0,'Url');
		//$temp_array["innerarray"]= array("are_name" => $are_name, "url" => $url);
		$test_array[$ar_element_id] = array("ar_element_id" => $ar_element_id,"are_name"=>$are_name,"url"=>$url);
		}
		
	while(list($ar_element_id, $temp_array) = each($test_array)){
		$idToCheck = $temp_array["ar_element_id"];
		$checkIfIsImageQuery = "SELECT * FROM ar_element_image WHERE ar_elements_ar_element_id = '$idToCheck'";
		$checkIfIsImageResult = mysql_query($checkIfIsImageQuery);
		$checkIfIsImageNumrows = mysql_num_rows($checkIfIsImageResult);
		if($checkIfIsImageNumrows > 0)
		{
			echo "image";
			echo "|";
			echo mysql_result($checkIfIsImageResult, 0, 'ar_i_testfield');
			echo "|";
		}
		//else{
		//echo "firstIfFailed";
		//echo "|";
		//}
		$checkIfIsSoundQuery = "SELECT * FROM ar_element_sound WHERE ar_elements_ar_element_id = '$idToCheck'";
		$checkIfIsSoundResult = mysql_query($checkIfIsSoundQuery);
		$checkIfIsSoundNumrows = mysql_num_rows($checkIfIsSoundResult);
		if($checkIfIsSoundNumrows > 0)
		{
			echo "sound";
			echo "|";
			echo mysql_result($checkIfIsSoundResult, 0, 'ar_s_testfield');
			echo "|";
		}
		//else{
		//echo "secondIfFailed";
		//echo "|";
		//}
		
		echo $temp_array["ar_element_id"];
		echo "|";
		echo $temp_array["are_name"];
		echo "|";
		echo $temp_array["url"];
		echo "&";
		}
	}
	else{echo "getTargetPicture query3 failed";}
}else{echo "getTargetPicture query1 failed";}
mysql_close();
?>