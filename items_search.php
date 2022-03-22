<style>
.item{
background-color:#999;
}
.item a{
text-decoration:none;
color:#000;
font-size:14px;
}
.item2 a{
text-decoration:none;
color:#000;
font-size:14px;
}
.item2{
background-color:#CCC;
}
.item:hover{
background-color:#FFC;
}
.item2:hover{
background-color:#FFC;
}
</style>
<?php include_once("includes/inc.php"); ?>
  <div id="suppliersName" class="text-center">
 
  <ul style="direction:rtl; width:45%; margin-top:0px; float:right;list-style: none;">
 <a href="<?php echo"".$_SERVER['HTTP_REFERER'].""; ?>"><img src="images/cancel.png" style="border:0px; float:left;" /></a>
<?php

$dd = ($user_barcode_manual =="1" or $user_IsAdmin ==1)? ' ' : 'style = "pointer-events: none;cursor: default;"' ;


$ser=$_GET['q'];
if($_GET['Barcode']!==null){
$ser=$_GET['Barcode'];	
	}
$result_search_clients = mysqli_query($con,"SELECT * FROM items WHERE  item LIKE '%$ser%' or id='$ser' or Barcode='$ser' limit 0,20");
if(@mysqli_num_rows($result_search_clients)>0){
	$i=1;
while($row_search_clients = mysqli_fetch_array($result_search_clients))
  {
	  $issingle=$i/2;
	   $dot = strstr($issingle, '.');
			if($dot==""){
				$class="item";
			}else{
				$class="item2";
				}
		                            
                                
                                               $all_qty0 = ($row_search_clients['Quantity'] + GetQuantity($row_search_clients['id']));
                            $NumberBreakdown = NumberBreakdown($all_qty0, $returnUnsigned = false);
                            $all_qty = (abs($NumberBreakdown[1]) * $row_search_clients['subqty']);
                            $whole = $NumberBreakdown[0];
                                
                                
  echo'<li class="'.$class.'"><a '. $dd . 'href="?q='.$row_search_clients['id'].'">'.$row_search_clients['item'].' ('.$whole.','.round($all_qty).')</a></li>';
  $i++;
   }
}else{
	echo'<li class="item2"><a href="#">'.$no_data_lang.'</a></li>';
	}
  ?>
  </ul>
  </div>