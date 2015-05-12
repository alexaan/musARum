<?php

// Database details
$dbHost = "129.241.103.145";
$dbUser = "museum";
$dbPass = "asdasd";
$dbName = "museumdbtest";



/*********************************************************
** Function: dbconnect()                                **
**     Desc: Perform database server connection and     **
**           database selection operations              **
*********************************************************/
function dbConnect() {
    // Access global variables
    global $dbHost;
    global $dbUser;
    global $dbPass;
    global $dbName;
    
    // Attempt to connect to database server
    $link = @mysql_connect($dbHost, $dbUser, $dbPass);

    // If connection failed...
    if (!$link) {

	
        fail("Couldn't connect to database server");
    }

    // Attempt to select our database. If failed...
    if (!@mysql_select_db($dbName)) {
        // Inform Flash of error and quit
        fail("Couldn't find database $dbName");
    }

    return $link;
}
function make_safe($variable) {
$variable = addslashes(trim($variable));
return $variable;
}

function fail($errorMsg) {
  
    
    // Output error information and exit
    print $errorMsg;
    exit;
}
?>