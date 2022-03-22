<?php
include "includes/inc.php";
?>
<head>
    <meta charset="UTF-8" />
    <title>تكاليف الانتاج</title>
</head>
<style>
@media print {
    .break {page-break-after: always;}
}
.center {
   margin: auto;
    width: 60%;
   // border: 1px solid #73AD21;
    padding: 3px;
width:145px;
hight:65px;
text-align:left;
}
.barcode{
    padding-top: 2px;
}
</style>
<body style="margin-left: 0px;">
<?php
if($_GET['order_id']){

    $result_inv = mysqli_query($con,"SELECT * FROM ".$prefix."_receivings_orders_line where inv='".$_GET['order_id']."' order by id ASC"); 

}else{
    $result_inv = mysqli_query($con,"SELECT * FROM ".$prefix."_receivings where inv_id='".$_GET['id']."' order by id ASC"); 

}
if(@mysqli_num_rows($result_inv)>0){
$ii=0;
while($row_inv = mysqli_fetch_array($result_inv))
  {
//echo $row_inv['item'];
//echo"<br />";
//echo $row_inv['Quantity'];
//echo"<br />";
//echo $row_inv['color'];
//echo"<br />";get_price_of_item($row_inv['item'])
//$row_inv['color'];
//echo"<br />";&text2='.get_color_name($row_inv['color']).'
$barcode="".$row_inv['item']."-".$row_inv['size']."-".$row_inv['color']."";
$x=0;
for ($x = 1; $x <= $row_inv['Quantity']; $x++) {
echo'<div class="barcode" style="width: 171px; background-color: aquamarine; font-size: 12px;">
<div style="width: 100%; float: right;">
<div style="float: left; width: 30%; text-align: left;white-space: nowrap;">'.get_color_name($row_inv['color']).' </div>
<div style="float: left; width: 35%; text-align:center;white-space: nowrap;"">S:'.Get_size_name($row_inv['size']).'</div>
<div style="float: left; text-align: right; width: 35%;white-space: nowrap;""> <span style="text-align:left;">فيالى</span></div>
</div>
<div style="width: 100%; float: right;">
<div style="float: left; width: 30%; text-align: left;white-space: nowrap;">'.Get_model_name($row_inv['item']).'</div>
<div style="float: left; width: 35%; text-align:center;white-space: nowrap;"">P:'.get_price_of_item($row_inv['item']).'</div>
<div style="float: left; text-align: right; width: 35%;white-space: nowrap;""> <span style="text-align:left;">'.Get_product_name(Get_model_groupid($row_inv['item'])).'</span></div>
</div>
<div style="text-align:center;"><img  src="barcode_labels_a.php?codetype=code128&size=20&text='.$barcode.'">
</div>
</div>
<div class="break"></div>';
//echo"<hr />";
/*if($x==1){
 break;
}
*/
}
/*if($ii==1){
 break;
}
*/
$ii++;}
}
?>
</body>
