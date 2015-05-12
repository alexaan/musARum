<?php
include("common.php");
$link=dbConnect();
$tp_id=make_safe($_POST['tp_id']);
$sessioncode=make_safe($_POST['code']);
$grp_name=make_safe($_POST['grp_name']);
$question=make_safe($_POST['question']);
$solution=make_safe($_POST['solution']);
$alternative1=make_safe($_POST['alternative1']);
$alternative2=make_safe($_POST['alternative2']);
$alternative3=make_safe($_POST['alternative3']);

$grpQuery = "SELECT * FROM groups WHERE grp_name = '$grp_name'";
$grpResult = mysql_query($grpQuery);
$grpNumrows=mysql_num_rows($grpResult);
if($grpNumrows == 1){
$grp_id = mysql_result($grpResult, 0, 'grp_id');

//Check if the question is already created (by the same group in the same session), check that question and solution has some value
$checkDuplicationQuery = "SELECT * FROM questions WHERE sessions_session_id = '$sessioncode' AND question = '$question' AND groups_grp_id = '$grp_id'";
$checkDuplicationResult = mysql_query($checkDuplicationQuery);
$checkDuplicationNumrows = mysql_num_rows($checkDuplicationResult);
if($checkDuplicationNumrows == 0 && $question != "" && $solution != ""){
$insertQuestion = mysql_query("INSERT INTO questions (question, solution, alternative1, alternative2, alternative3, groups_grp_id, sessions_session_id, target_pictures_tp_id) 
VALUES ('$question', '$solution', '$alternative1', '$alternative2', '$alternative3',  '$grp_id', '$sessioncode', '$tp_id')");
echo "Question created";
}else{
echo "Duplicated question";
}
}
else{echo "Failed to create question";}
mysql_close();


?>