<?php
include_once("includes/inc.php");

echo  $_GET['user_id'];

mysqli_query($con, "UPDATE ".$prefix."_sales_temporary SET sellerID='".$_GET['seller_id']."' where user_id='".$_GET['user_id']."' ");
?>
