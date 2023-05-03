<?php
    session_start();
    // Destroy session
    if(session_destroy()) {
        // Redirecting To Home Page
        echo 'logout completed';
        header("Location: login.php");
    }
    //hello
?>
