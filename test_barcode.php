<?php
// include Barcode39 class
include "Barcode39.php";
// set Barcode39 object
$bc = new Barcode39("محمد");

// display new barcode
$bc->draw();
?>